# -*- coding: utf-8 -*-
import sys
sys.stdout.reconfigure(encoding='utf-8')
from selenium import webdriver
from selenium.webdriver.common.by import By
import mysql.connector
from datetime import datetime

# MySQL 接続
conn = mysql.connector.connect(
    host="localhost",
    user="rezouser",
    password="Rezo_0000",
    database="diary_app"
)
cursor = conn.cursor()

# WebDriver 設定
options = webdriver.ChromeOptions()
options.add_argument('--headless')  
options.add_argument('--disable-gpu')

driver = webdriver.Chrome(options=options)

try:

    driver.get("https://www3.nhk.or.jp/news/")

    elements = driver.find_elements(By.CSS_SELECTOR, "a[href] > img.lazy")

    # データ抽出する
    for i, img in enumerate(elements):
        if i >= 10:
            break

        raw_src = img.get_attribute("src")
        alt = img.get_attribute("alt")
        parent_a = img.find_element(By.XPATH, "..")
        href = parent_a.get_attribute("href")

        # 結果表示test
        print("Image SRC:", raw_src)
        print("TITLE:", alt)
        print("URL:", href)

        # データベースにINSERT
        insert_sql = """
            INSERT INTO news_top (image, title, url)
            VALUES (%s, %s, %s)
        """
        cursor.execute(insert_sql, (raw_src, alt, href))

    # コミットして反映
    conn.commit()
    print("データベースに保存成功しました！")

finally:
    cursor.close()
    conn.close()
    driver.quit()



