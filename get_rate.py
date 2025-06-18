# -*- coding: utf-8 -*-
import sys
sys.stdout.reconfigure(encoding='utf-8')
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import mysql.connector
from datetime import datetime
import time

options = Options()
options.add_argument('--headless') 
driver = webdriver.Chrome(options=options)

driver.get("https://finance.yahoo.com/quote/JPY=X")

try:
    elem = WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.XPATH, '//fin-streamer[@data-symbol="JPY=X" and @data-field="regularMarketPrice"]'))
    )
    rate_str = elem.text.replace(',', '')
    rate = float(rate_str)
    print(f"１ドル = {rate} 円")
except Exception as e:
    print(f"為替レート取得失敗: {e}")
    driver.quit()
    exit()

driver.quit()

# データベースに保存
try:
    conn = mysql.connector.connect(
        host="localhost",
        user="rezouser",
        password="Rezo_0000",
        database="diary_app"
    )
    cursor = conn.cursor()

    sql = "INSERT INTO exchange_rates (usd_to_jpy, timestamp) VALUES (%s, %s)"
    cursor.execute(sql, (rate, datetime.now()))
    conn.commit()
    print("データベースに保存成功しました！")

except mysql.connector.Error as err:
    print(f"データベース間違えた：{err}")

finally:
    if conn.is_connected():
        cursor.close()
        conn.close()
