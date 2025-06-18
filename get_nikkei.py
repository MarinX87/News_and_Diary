# -*- coding: utf-8 -*-
import sys
sys.stdout.reconfigure(encoding='utf-8')
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time
import mysql.connector
from datetime import datetime
import time

#WebDriver
options = webdriver.ChromeOptions()
options.add_argument('--headless')  
options.add_argument('--disable-gpu')

driver = webdriver.Chrome(options=options)

try:
    url = "https://www.nikkei.com/markets/stocks/"
    driver.get(url)
    time.sleep(2)  

    #日経指数
    index_value = driver.find_element(By.XPATH, '/html/body/div[5]/div/div/div/div/ul/li[1]/div/a/span[2]/span[1]').text

    #騰落
    change_percent = driver.find_element(By.XPATH, '/html/body/div[5]/div/div/div/div/ul/li[1]/div/a/span[2]/span[2]/span').text

    index_value = float(index_value.replace(",", ""))


    print("日経指数：", index_value)
    print("騰落：", change_percent)


    

finally:
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

    sql = "INSERT INTO nikkei_index (index_value, change_percent,timestamp) VALUES (%s, %s,%s)"
    cursor.execute(sql, (index_value,change_percent, datetime.now()))
    conn.commit()
    print("データベースに保存成功しました！")

except mysql.connector.Error as err:
    print(f"データベース間違えた：{err}")

finally:
    if conn.is_connected():
        cursor.close()
        conn.close()
