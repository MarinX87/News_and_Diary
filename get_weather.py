# -*- coding: utf-8 -*-
import sys
sys.stdout.reconfigure(encoding='utf-8')
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time
import mysql.connector
from datetime import datetime


#WebDriver
options = webdriver.ChromeOptions()
options.add_argument('--headless')  
options.add_argument('--disable-gpu')

driver = webdriver.Chrome(options=options)

try:
    url = "https://weather.yahoo.co.jp/weather/jp/13/4410.html"
    driver.get(url)
    time.sleep(2)  

    #天気
    weather = driver.find_element(By.XPATH, '//*[@id="main"]/div[6]/table/tbody/tr/td[1]/div/p[2]').text

    #最高気温
    high_temp = driver.find_element(By.XPATH, '//*[@id="main"]/div[6]/table/tbody/tr/td[1]/div/ul/li[1]/em').text
                                          

    #最低気温：
    low_temp = driver.find_element(By.XPATH, '//*[@id="main"]/div[6]/table/tbody/tr/td[1]/div/ul/li[2]/em').text


    print("天気予報：", weather)
    print("最高気温：", high_temp)
    print("最低気温：", low_temp)

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

    sql = "INSERT INTO weather_data (min_temp, max_temp,weather,created_at) VALUES (%s, %s,%s, %s)"
    cursor.execute(sql, (low_temp,high_temp,weather, datetime.now()))
    conn.commit()
    print("データベースに保存成功しました！")

except mysql.connector.Error as err:
    print(f"データベース間違えた：{err}")

finally:
    if conn.is_connected():
        cursor.close()
        conn.close()
