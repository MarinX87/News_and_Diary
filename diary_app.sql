-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2025-06-18 10:33:25
-- サーバのバージョン： 8.4.0
-- PHP のバージョン: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `diary_app`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `diaries`
--

CREATE TABLE `diaries` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `diaries`
--

INSERT INTO `diaries` (`id`, `user_id`, `content`, `created_at`) VALUES
(10, 3, '気に入った公園が見つかったら、周辺でお部屋探しをしてみてはいかがでしょうか。\r\n１、代々木公園／渋谷区 \r\n２、上野恩賜公園／台東区 \r\n３、新宿御苑／新宿区 \r\n４、葛西臨海公園／江戸川区 \r\n５、世田谷公園／世田谷区 \r\n６、飛鳥山公園／北区 \r\n７、西郷山公園／目黒区\r\n８、木場公園／江東区', '2025-06-17 00:39:12'),
(22, 3, '面白い豆知識をいくつかご紹介します。﻿\r\nカキは生涯で複数回性別を変える:。\r\nシロクマは一匹残らず左利き:。\r\n人の大腿骨はコンクリートよりも硬い:。\r\n柚子胡椒には胡椒が含まれていない:。\r\n「スーパーマリオブラザーズ」と入力するとハテナブロックをたたける:。\r\n犬や猫と検索すると犬や猫の手が出てきて鳴き声も聞ける:。\r\n「人生、宇宙、すべての答え」と検索すると「42」という答えが返ってくる:。\r\n雨のにおいの名前は「ペトリコール」:。\r\nかっぱの語源は「capa」:。\r\n雨粒の形はしずく型ではない:。\r\n雨が降ると頭痛がするのは、ヒスタミンの分泌が増えるから:。\r\n世界一速い昆虫といわれるハンミョウは時速80kmで走る:。\r\nキリギリスの耳は前脚にある:。\r\nカブトムシには鳴き声がある:。\r\n花の蜜を吸う蚊が存在する:。\r\nスズメバチのオスは針を持っていない:。\r\n足の裏を拭くと蚊に刺されにくくなる:。\r\nアホウドリはパートナーを愛し続ける:。\r\nダチョウは馬より俊足:。\r\nコアラは1日のほとんどを寝て過ごす:。\r\n水族館のラッコは寝るときに手をつなぐ:。\r\nチョコレートの語源は苦い水:。\r\nからまったネックレスはベビーパウダーをかけるとほどける:。\r\nしなしなの野菜はお湯で洗うと復活する:。\r\n切れた電池は手で温めると一時的に復活する:。\r\n血液汚れには大根おろしがきく:。\r\n排水溝にアルミホイルを入れると臭いやぬめりを予防できる:。\r\nあくびは上唇をなめると止まる:。', '2025-06-17 07:38:22');

-- --------------------------------------------------------

--
-- テーブルの構造 `exchange_rates`
--

CREATE TABLE `exchange_rates` (
  `id` int NOT NULL,
  `usd_to_jpy` decimal(8,2) NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `exchange_rates`
--

INSERT INTO `exchange_rates` (`id`, `usd_to_jpy`, `timestamp`) VALUES
(6, 143.97, '2025-06-12 13:51:52'),
(7, 144.88, '2025-06-17 10:39:30'),
(8, 144.78, '2025-06-17 15:06:34'),
(9, 144.78, '2025-06-17 15:09:44'),
(10, 144.77, '2025-06-17 15:12:35'),
(11, 144.78, '2025-06-17 15:14:21'),
(12, 144.76, '2025-06-17 15:16:10'),
(13, 144.57, '2025-06-17 15:37:51'),
(14, 144.72, '2025-06-17 16:41:08'),
(15, 145.35, '2025-06-18 08:55:23'),
(16, 145.30, '2025-06-18 09:09:08'),
(17, 145.25, '2025-06-18 09:47:56');

-- --------------------------------------------------------

--
-- テーブルの構造 `news_top`
--

CREATE TABLE `news_top` (
  `id` int NOT NULL,
  `image` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(2083) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `news_top`
--

INSERT INTO `news_top` (`id`, `image`, `title`, `url`, `timestamp`) VALUES
(5, 'https://www3.nhk.or.jp/news/html/20250617/K10014837261_2506171201_0617120310_02_01.jpg', '東北新幹線 東京～仙台 運転見合わせ 回送列車が自走できず', 'https://www3.nhk.or.jp/news/html/20250617/k10014837261000.html', '2025-06-17 05:13:53'),
(6, 'https://www3.nhk.or.jp/news/html/20250617/K10014837011_2506171339_0617134026_02_01.jpg', '沖縄～東北で気温上昇 東海では38度予想も 熱中症対策の徹底を', 'https://www3.nhk.or.jp/news/html/20250617/k10014837011000.html', '2025-06-17 05:13:53'),
(7, 'https://www3.nhk.or.jp/news/html/20250617/K10014837001_2506171109_0617140816_02_01.jpg', '大谷翔平 先発1回1失点 打者で2打席連続適時打 ドジャース勝利', 'https://www3.nhk.or.jp/news/html/20250617/k10014837001000.html', '2025-06-17 05:13:53'),
(8, 'https://www3.nhk.or.jp/news/html/20250616/K10014836911_2506170755_0617080005_02_01.jpg', 'イスラエルがイラン国営放送局攻撃 イラン“全面戦争の準備”', 'https://www3.nhk.or.jp/news/html/20250616/k10014836911000.html', '2025-06-17 05:13:53'),
(9, 'https://www3.nhk.or.jp/news/html/20250617/K10014837111_2506171249_0617125137_02_01.jpg', '自転車 交通違反「青切符」反則金額決定 来年4月1日から取締り', 'https://www3.nhk.or.jp/news/html/20250617/k10014837111000.html', '2025-06-17 05:13:53'),
(10, 'https://www3.nhk.or.jp/news/html/20250617/K10014837161_2506171125_0617123421_02_01.jpg', '日銀 政策金利0.5％程度に据え置き 国債購入の減額幅縮小へ', 'https://www3.nhk.or.jp/news/html/20250617/k10014837161000.html', '2025-06-17 05:13:53'),
(11, 'https://www3.nhk.or.jp/news/html/20250617/K10014837261_2506171201_0617120310_02_01.jpg', '東北新幹線 東京～仙台 運転見合わせ 回送列車が自走できず', 'https://www3.nhk.or.jp/news/html/20250617/k10014837261000.html', '2025-06-17 05:31:13'),
(12, 'https://www3.nhk.or.jp/news/html/20250617/K10014837011_2506171339_0617134026_02_01.jpg', '沖縄～東北で気温上昇 東海では38度予想も 熱中症対策の徹底を', 'https://www3.nhk.or.jp/news/html/20250617/k10014837011000.html', '2025-06-17 05:31:14'),
(13, 'https://www3.nhk.or.jp/news/html/20250617/K10014837001_2506171109_0617140816_02_01.jpg', '大谷翔平 先発1回1失点 打者で2打席連続適時打 ドジャース勝利', 'https://www3.nhk.or.jp/news/html/20250617/k10014837001000.html', '2025-06-17 05:31:14'),
(14, 'https://www3.nhk.or.jp/news/html/20250616/K10014836911_2506170755_0617080005_02_01.jpg', 'イスラエルがイラン国営放送局攻撃 イラン“全面戦争の準備”', 'https://www3.nhk.or.jp/news/html/20250616/k10014836911000.html', '2025-06-17 05:31:14'),
(15, 'https://www3.nhk.or.jp/news/html/20250617/K10014837111_2506171249_0617125137_02_01.jpg', '自転車 交通違反「青切符」反則金額決定 来年4月1日から取締り', 'https://www3.nhk.or.jp/news/html/20250617/k10014837111000.html', '2025-06-17 05:31:14'),
(16, 'https://www3.nhk.or.jp/news/html/20250617/K10014837161_2506171125_0617123421_02_01.jpg', '日銀 政策金利0.5％程度に据え置き 国債購入の減額幅縮小へ', 'https://www3.nhk.or.jp/news/html/20250617/k10014837161000.html', '2025-06-17 05:31:14'),
(17, 'https://www3.nhk.or.jp/news/html/20250617/K10014837301_2506171324_0617132519_02_01.jpg', '百日せき患者数 6月8日までの1週間 3044人で過去最多に', 'https://www3.nhk.or.jp/news/html/20250617/k10014837301000.html', '2025-06-17 05:31:14'),
(18, 'https://www3.nhk.or.jp/news/html/20250617/K10014837011_2506171339_0617134026_02_01.jpg', '沖縄～東北で気温上昇 東海では38度予想も 熱中症対策の徹底を', 'https://www3.nhk.or.jp/news/html/20250617/k10014837011000.html', '2025-06-17 06:06:42'),
(19, 'https://www3.nhk.or.jp/news/html/20250617/K10014837161_2506171125_0617123421_02_01.jpg', '日銀 政策金利0.5％程度に据え置き 国債購入の減額幅縮小へ', 'https://www3.nhk.or.jp/news/html/20250617/k10014837161000.html', '2025-06-17 06:06:42'),
(20, 'https://www3.nhk.or.jp/news/html/20250617/K10014837261_2506171201_0617120310_02_01.jpg', '東北新幹線 東京～仙台 運転見合わせ 回送列車が自走できず', 'https://www3.nhk.or.jp/news/html/20250617/k10014837261000.html', '2025-06-17 06:06:43'),
(21, 'https://www3.nhk.or.jp/news/html/20250616/K10014836911_2506170755_0617080005_02_01.jpg', 'イスラエルがイラン国営放送局攻撃 イラン“全面戦争の準備”', 'https://www3.nhk.or.jp/news/html/20250616/k10014836911000.html', '2025-06-17 06:06:43'),
(22, 'https://www3.nhk.or.jp/news/html/20250617/K10014837111_2506171249_0617125137_02_01.jpg', '自転車 交通違反「青切符」反則金額決定 来年4月1日から取締り', 'https://www3.nhk.or.jp/news/html/20250617/k10014837111000.html', '2025-06-17 06:06:43'),
(23, 'https://www3.nhk.or.jp/news/html/20250617/K10014837001_2506171109_0617140816_02_01.jpg', '大谷翔平 2シーズンぶり先発登板 1回1失点 “二刀流”復活', 'https://www3.nhk.or.jp/news/html/20250617/k10014837001000.html', '2025-06-17 06:06:43'),
(24, 'https://www3.nhk.or.jp/news/html/20250617/K10014837401_2506171425_0617145705_02_01.jpg', '“美容施術 HIFUでやけど” 会社が謝罪し解決金で和解成立', 'https://www3.nhk.or.jp/news/html/20250617/k10014837401000.html', '2025-06-17 06:06:43'),
(25, 'https://www3.nhk.or.jp/news/html/20250617/K10014837011_2506171339_0617134026_02_01.jpg', '沖縄～東北で気温上昇 東海では38度予想も 熱中症対策の徹底を', 'https://www3.nhk.or.jp/news/html/20250617/k10014837011000.html', '2025-06-17 06:09:53'),
(26, 'https://www3.nhk.or.jp/news/html/20250617/K10014837161_2506171125_0617123421_02_01.jpg', '日銀 政策金利0.5％程度に据え置き 国債購入の減額幅縮小へ', 'https://www3.nhk.or.jp/news/html/20250617/k10014837161000.html', '2025-06-17 06:09:53'),
(27, 'https://www3.nhk.or.jp/news/html/20250617/K10014837261_2506171201_0617120310_02_01.jpg', '東北新幹線 東京～仙台 運転見合わせ 回送列車が自走できず', 'https://www3.nhk.or.jp/news/html/20250617/k10014837261000.html', '2025-06-17 06:09:53'),
(28, 'https://www3.nhk.or.jp/news/html/20250616/K10014836911_2506170755_0617080005_02_01.jpg', 'イスラエルがイラン国営放送局攻撃 イラン“全面戦争の準備”', 'https://www3.nhk.or.jp/news/html/20250616/k10014836911000.html', '2025-06-17 06:09:53'),
(29, 'https://www3.nhk.or.jp/news/html/20250617/K10014837111_2506171249_0617125137_02_01.jpg', '自転車 交通違反「青切符」反則金額決定 来年4月1日から取締り', 'https://www3.nhk.or.jp/news/html/20250617/k10014837111000.html', '2025-06-17 06:09:53'),
(30, 'https://www3.nhk.or.jp/news/html/20250617/K10014837001_2506171109_0617140816_02_01.jpg', '大谷翔平 2シーズンぶり先発登板 1回1失点 “二刀流”復活', 'https://www3.nhk.or.jp/news/html/20250617/k10014837001000.html', '2025-06-17 06:09:53'),
(31, 'https://www3.nhk.or.jp/news/html/20250617/K10014837401_2506171425_0617145705_02_01.jpg', '“美容施術 HIFUでやけど” 会社が謝罪し解決金で和解成立', 'https://www3.nhk.or.jp/news/html/20250617/k10014837401000.html', '2025-06-17 06:09:53'),
(32, 'https://www3.nhk.or.jp/news/html/20250617/K10014837261_2506171201_0617120310_02_01.jpg', '東北新幹線 東京～仙台 運転見合わせ 回送列車が自走できず', 'https://www3.nhk.or.jp/news/html/20250617/k10014837261000.html', '2025-06-17 06:14:30'),
(33, 'https://www3.nhk.or.jp/news/html/20250617/K10014837161_2506171125_0617123421_02_01.jpg', '日銀 政策金利0.5％程度に据え置き 国債購入の減額幅縮小へ', 'https://www3.nhk.or.jp/news/html/20250617/k10014837161000.html', '2025-06-17 06:14:30'),
(34, 'https://www3.nhk.or.jp/news/html/20250616/K10014836911_2506170755_0617080005_02_01.jpg', 'イスラエルがイラン国営放送局攻撃 イラン“全面戦争の準備”', 'https://www3.nhk.or.jp/news/html/20250616/k10014836911000.html', '2025-06-17 06:14:30'),
(35, 'https://www3.nhk.or.jp/news/html/20250617/K10014837111_2506171249_0617125137_02_01.jpg', '自転車 交通違反「青切符」反則金額決定 来年4月1日から取締り', 'https://www3.nhk.or.jp/news/html/20250617/k10014837111000.html', '2025-06-17 06:14:30'),
(36, 'https://www3.nhk.or.jp/news/html/20250617/K10014837001_2506171109_0617140816_02_01.jpg', '大谷翔平 2シーズンぶり先発登板 1回1失点 “二刀流”復活', 'https://www3.nhk.or.jp/news/html/20250617/k10014837001000.html', '2025-06-17 06:14:30'),
(37, 'https://www3.nhk.or.jp/news/html/20250617/K10014837401_2506171425_0617145705_02_01.jpg', '“美容施術 HIFUでやけど” 会社が謝罪し解決金で和解成立', 'https://www3.nhk.or.jp/news/html/20250617/k10014837401000.html', '2025-06-17 06:14:30'),
(38, 'https://www3.nhk.or.jp/news/html/20250617/K10014837381_2506171411_0617144854_02_01.jpg', '東京 三宅島 噴火警戒レベル 火口周辺規制示す「2」に引き上げ', 'https://www3.nhk.or.jp/news/html/20250617/k10014837381000.html', '2025-06-17 06:14:30'),
(39, 'https://www3.nhk.or.jp/news/html/20250617/K10014837261_2506171201_0617120310_02_01.jpg', '東北新幹線 東京～仙台 運転見合わせ 回送列車が自走できず', 'https://www3.nhk.or.jp/news/html/20250617/k10014837261000.html', '2025-06-17 06:16:17'),
(40, 'https://www3.nhk.or.jp/news/html/20250617/K10014837161_2506171125_0617123421_02_01.jpg', '日銀 政策金利0.5％程度に据え置き 国債購入の減額幅縮小へ', 'https://www3.nhk.or.jp/news/html/20250617/k10014837161000.html', '2025-06-17 06:16:17'),
(41, 'https://www3.nhk.or.jp/news/html/20250616/K10014836911_2506170755_0617080005_02_01.jpg', 'イスラエルがイラン国営放送局攻撃 イラン“全面戦争の準備”', 'https://www3.nhk.or.jp/news/html/20250616/k10014836911000.html', '2025-06-17 06:16:17'),
(42, 'https://www3.nhk.or.jp/news/html/20250617/K10014837111_2506171249_0617125137_02_01.jpg', '自転車 交通違反「青切符」反則金額決定 来年4月1日から取締り', 'https://www3.nhk.or.jp/news/html/20250617/k10014837111000.html', '2025-06-17 06:16:18'),
(43, 'https://www3.nhk.or.jp/news/html/20250617/K10014837001_2506171109_0617140816_02_01.jpg', '大谷翔平 2シーズンぶり先発登板 1回1失点 “二刀流”復活', 'https://www3.nhk.or.jp/news/html/20250617/k10014837001000.html', '2025-06-17 06:16:18'),
(44, 'https://www3.nhk.or.jp/news/html/20250617/K10014837401_2506171425_0617145705_02_01.jpg', '“美容施術 HIFUでやけど” 会社が謝罪し解決金で和解成立', 'https://www3.nhk.or.jp/news/html/20250617/k10014837401000.html', '2025-06-17 06:16:18'),
(45, 'https://www3.nhk.or.jp/news/html/20250617/K10014837381_2506171411_0617144854_02_01.jpg', '東京 三宅島 噴火警戒レベル 火口周辺規制示す「2」に引き上げ', 'https://www3.nhk.or.jp/news/html/20250617/k10014837381000.html', '2025-06-17 06:16:18'),
(46, 'https://www3.nhk.or.jp/news/html/20250617/K10014837261_2506171506_0617152912_02_01.jpg', '東北新幹線 東京～仙台 運転見合わせ 回送列車が自走できず', 'https://www3.nhk.or.jp/news/html/20250617/k10014837261000.html', '2025-06-17 06:37:57'),
(47, 'https://www3.nhk.or.jp/news/html/20250617/K10014837161_2506171125_0617123421_02_01.jpg', '日銀 政策金利0.5％程度に据え置き 国債購入の減額幅縮小へ', 'https://www3.nhk.or.jp/news/html/20250617/k10014837161000.html', '2025-06-17 06:37:57'),
(48, 'https://www3.nhk.or.jp/news/html/20250616/K10014836911_2506170755_0617080005_02_01.jpg', 'イスラエルがイラン国営放送局攻撃 イラン“全面戦争の準備”', 'https://www3.nhk.or.jp/news/html/20250616/k10014836911000.html', '2025-06-17 06:37:57'),
(49, 'https://www3.nhk.or.jp/news/html/20250617/K10014837111_2506171249_0617125137_02_01.jpg', '自転車 交通違反「青切符」反則金額決定 来年4月1日から取締り', 'https://www3.nhk.or.jp/news/html/20250617/k10014837111000.html', '2025-06-17 06:37:57'),
(50, 'https://www3.nhk.or.jp/news/html/20250617/K10014837001_2506171109_0617140816_02_01.jpg', '大谷翔平 2シーズンぶり先発登板 1回1失点 “二刀流”復活', 'https://www3.nhk.or.jp/news/html/20250617/k10014837001000.html', '2025-06-17 06:37:57'),
(51, 'https://www3.nhk.or.jp/news/html/20250617/K10014837341_2506171314_0617132828_02_01.jpg', 'モノクロ映画「ゴジラ」をカラー化して販売か 容疑者を逮捕', 'https://www3.nhk.or.jp/news/html/20250617/k10014837341000.html', '2025-06-17 06:37:57'),
(52, 'https://www3.nhk.or.jp/news/html/20250617/K10014837381_2506171513_0617151842_02_01.jpg', '東京 三宅島 噴火警戒レベル 火口周辺規制示す「2」に引き上げ', 'https://www3.nhk.or.jp/news/html/20250617/k10014837381000.html', '2025-06-17 06:37:58'),
(53, 'https://www3.nhk.or.jp/news/html/20250617/K10014837011_2506171555_0617155549_02_01.jpg', '熱中症の疑いで搬送 都内54人 千葉で30人 対策徹底を', 'https://www3.nhk.or.jp/news/html/20250617/k10014837011000.html', '2025-06-17 07:41:15'),
(54, 'https://www3.nhk.or.jp/news/html/20250616/K10014836911_2506170755_0617080005_02_01.jpg', 'イスラエルがイラン国営放送局攻撃 イラン“全面戦争の準備”', 'https://www3.nhk.or.jp/news/html/20250616/k10014836911000.html', '2025-06-17 07:41:15'),
(55, 'https://www3.nhk.or.jp/news/html/20250617/K10014837261_2506171506_0617152912_02_01.jpg', '東北新幹線 東京～仙台 運転見合わせ 回送列車が自走できず', 'https://www3.nhk.or.jp/news/html/20250617/k10014837261000.html', '2025-06-17 07:41:15'),
(56, 'https://www3.nhk.or.jp/news/html/20250617/K10014837161_2506171125_0617123421_02_01.jpg', '【速報中】日銀 植田総裁の記者会見', 'https://www3.nhk.or.jp/news/html/20250617/k10014837161000.html', '2025-06-17 07:41:15'),
(57, 'https://www3.nhk.or.jp/news/html/20250617/K10014837041_2506170850_0617085115_02_01.jpg', 'トランプ大統領 G7サミット切り上げ帰国の途に 中東情勢を受け', 'https://www3.nhk.or.jp/news/html/20250617/k10014837041000.html', '2025-06-17 07:41:16'),
(58, 'https://www3.nhk.or.jp/news/html/20250617/K10014837431_2506171518_0617152223_02_01.jpg', 'マイナ保険証のシステムで不具合 受付できない医療機関も', 'https://www3.nhk.or.jp/news/html/20250617/k10014837431000.html', '2025-06-17 07:41:16'),
(59, 'https://www3.nhk.or.jp/news/html/20250617/K10014837001_2506171109_0617140816_02_01.jpg', '大谷翔平 2シーズンぶり先発登板 1回1失点 “二刀流”復活', 'https://www3.nhk.or.jp/news/html/20250617/k10014837001000.html', '2025-06-17 07:41:16'),
(60, 'https://www3.nhk.or.jp/news/html/20250618/K10014837921_2506180614_0618061440_02_01.jpg', 'トランプ大統領 NSCの開催明らかに イラン イスラエル対応か', 'https://www3.nhk.or.jp/news/html/20250618/k10014837921000.html', '2025-06-17 23:55:29'),
(61, 'https://www3.nhk.or.jp/news/html/20250618/K10014837721_2506172105_0618052214_02_01.jpg', '関税措置 日米閣僚交渉続く 貿易赤字 自動車含めた税率 焦点に', 'https://www3.nhk.or.jp/news/html/20250618/k10014837721000.html', '2025-06-17 23:55:29'),
(62, 'https://www3.nhk.or.jp/news/html/20250618/K10014837751_2506172120_0618060344_02_01.jpg', '全国的に気温上昇 猛暑日の予想も 熱中症対策の徹底を', 'https://www3.nhk.or.jp/news/html/20250618/k10014837751000.html', '2025-06-17 23:55:29'),
(63, 'https://www3.nhk.or.jp/news/html/20250618/K10014837801_2506180548_0618060608_02_01.jpg', 'G7サミット ウクライナ情勢議論も トランプ氏帰国で進展なしか', 'https://www3.nhk.or.jp/news/html/20250618/k10014837801000.html', '2025-06-17 23:55:29'),
(64, 'https://www3.nhk.or.jp/news/html/20250618/K10014837891_2506180045_0618045527_02_01.jpg', '東北・山形新幹線 18日は計22本が全部または一部区間 運休予定', 'https://www3.nhk.or.jp/news/html/20250618/k10014837891000.html', '2025-06-17 23:55:29'),
(65, 'https://www3.nhk.or.jp/news/html/20250618/K10014837791_2506180456_0618052059_02_01.jpg', 'イスラエル国防相 今後もイラン核施設への攻撃を示唆', 'https://www3.nhk.or.jp/news/html/20250618/k10014837791000.html', '2025-06-17 23:55:29'),
(66, 'https://www3.nhk.or.jp/news/html/20250618/K10014837931_2506180720_0618072328_02_01.jpg', '環状7号線で3台関係する事故 4人搬送 うち2人が搬送時意識不明', 'https://www3.nhk.or.jp/news/html/20250618/k10014837931000.html', '2025-06-17 23:55:29'),
(67, 'https://www3.nhk.or.jp/news/html/20250618/K10014837921_2506180614_0618061440_02_01.jpg', 'トランプ大統領 NSCの開催明らかに イラン イスラエル対応か', 'https://www3.nhk.or.jp/news/html/20250618/k10014837921000.html', '2025-06-18 00:09:16'),
(68, 'https://www3.nhk.or.jp/news/html/20250618/K10014837751_2506172120_0618060344_02_01.jpg', '全国的に気温上昇 猛暑日の予想も 熱中症対策の徹底を', 'https://www3.nhk.or.jp/news/html/20250618/k10014837751000.html', '2025-06-18 00:09:17'),
(69, 'https://www3.nhk.or.jp/news/html/20250618/K10014837961_2506180857_0618085747_02_01.jpg', '5月の貿易収支 6376億円の赤字 赤字となるのは2か月連続', 'https://www3.nhk.or.jp/news/html/20250618/k10014837961000.html', '2025-06-18 00:09:17'),
(70, 'https://www3.nhk.or.jp/news/html/20250618/K10014837951_2506180838_0618084331_02_01.jpg', 'LA中心部の外出禁止令が解除 事態収束に向かうかは不透明', 'https://www3.nhk.or.jp/news/html/20250618/k10014837951000.html', '2025-06-18 00:09:17'),
(71, 'https://www3.nhk.or.jp/news/html/20250618/K10014837801_2506180548_0618060608_02_01.jpg', 'G7サミット ウクライナ情勢議論も トランプ氏帰国で進展なしか', 'https://www3.nhk.or.jp/news/html/20250618/k10014837801000.html', '2025-06-18 00:09:17'),
(72, 'https://www3.nhk.or.jp/news/html/20250618/K10014837891_2506180045_0618045527_02_01.jpg', '東北・山形新幹線 18日は計22本が全部または一部区間 運休予定', 'https://www3.nhk.or.jp/news/html/20250618/k10014837891000.html', '2025-06-18 00:09:17'),
(73, 'https://www3.nhk.or.jp/news/html/20250618/K10014837931_2506180720_0618072328_02_01.jpg', '環状7号線で3台関係する事故 4人搬送 うち2人が搬送時意識不明', 'https://www3.nhk.or.jp/news/html/20250618/k10014837931000.html', '2025-06-18 00:09:17'),
(74, 'https://www3.nhk.or.jp/news/html/20250618/K10014837921_2506180614_0618061440_02_01.jpg', 'トランプ大統領 NSCの開催明らかに イラン イスラエル対応か', 'https://www3.nhk.or.jp/news/html/20250618/k10014837921000.html', '2025-06-18 00:48:04'),
(75, 'https://www3.nhk.or.jp/news/html/20250618/K10014837751_2506180909_0618091014_02_01.jpg', '全国的に気温上昇 猛暑日の予想も 熱中症対策の徹底を', 'https://www3.nhk.or.jp/news/html/20250618/k10014837751000.html', '2025-06-18 00:48:04'),
(76, 'https://www3.nhk.or.jp/news/html/20250618/K10014837961_2506180857_0618085747_02_01.jpg', '5月の貿易収支 6376億円の赤字 赤字となるのは2か月連続', 'https://www3.nhk.or.jp/news/html/20250618/k10014837961000.html', '2025-06-18 00:48:04'),
(77, 'https://www3.nhk.or.jp/news/html/20250618/K10014837951_2506180838_0618084331_02_01.jpg', 'LA中心部の外出禁止令が解除 事態収束に向かうかは不透明', 'https://www3.nhk.or.jp/news/html/20250618/k10014837951000.html', '2025-06-18 00:48:04'),
(78, 'https://www3.nhk.or.jp/news/html/20250618/K10014837801_2506180548_0618060608_02_01.jpg', 'G7サミット ウクライナ情勢議論も トランプ氏帰国で進展なしか', 'https://www3.nhk.or.jp/news/html/20250618/k10014837801000.html', '2025-06-18 00:48:04'),
(79, 'https://www3.nhk.or.jp/news/html/20250618/K10014837891_2506180045_0618045527_02_01.jpg', '東北・山形新幹線 18日は計22本が全部または一部区間 運休予定', 'https://www3.nhk.or.jp/news/html/20250618/k10014837891000.html', '2025-06-18 00:48:04'),
(80, 'https://www3.nhk.or.jp/news/html/20250618/K10014837931_2506180720_0618072328_02_01.jpg', '環状7号線で3台関係する事故 4人搬送 うち2人が搬送時意識不明', 'https://www3.nhk.or.jp/news/html/20250618/k10014837931000.html', '2025-06-18 00:48:04');

-- --------------------------------------------------------

--
-- テーブルの構造 `nikkei_index`
--

CREATE TABLE `nikkei_index` (
  `id` int NOT NULL,
  `index_value` decimal(10,2) NOT NULL,
  `change_percent` decimal(5,2) NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `nikkei_index`
--

INSERT INTO `nikkei_index` (`id`, `index_value`, `change_percent`, `timestamp`) VALUES
(3, 38548.70, 237.37, '2025-06-17 11:04:33'),
(4, 38501.08, 189.75, '2025-06-17 11:50:07'),
(5, 38530.84, 219.51, '2025-06-17 12:40:22'),
(7, 38520.87, 209.54, '2025-06-17 15:06:59'),
(8, 38531.95, 220.62, '2025-06-17 15:10:09'),
(9, 38532.62, 221.29, '2025-06-17 15:13:02'),
(10, 38540.66, 229.33, '2025-06-17 15:14:46'),
(11, 38539.50, 228.17, '2025-06-17 15:16:32'),
(12, 38536.74, 225.41, '2025-06-17 15:38:12'),
(13, 38536.74, 225.41, '2025-06-17 16:41:29'),
(14, 38536.74, 225.41, '2025-06-18 08:55:43'),
(15, 38498.65, -38.09, '2025-06-18 09:09:33'),
(16, 38553.33, 16.59, '2025-06-18 09:48:18');

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(3, 'test', '$2y$10$b5DQzXNXCsTD7RjRVfoUEO12s3XXyPFdUCrYJsPQqUYPahvgLvkum', '2025-06-16 04:08:19'),
(7, 'test1', '$2y$10$d5ihcGQB6E5zAzoAo5hrHOy7Dg1NDISljll3IKy4954uvDXpFrWOu', '2025-06-17 07:42:45');

-- --------------------------------------------------------

--
-- テーブルの構造 `weather_data`
--

CREATE TABLE `weather_data` (
  `id` int NOT NULL,
  `min_temp` decimal(5,2) DEFAULT NULL,
  `max_temp` decimal(5,2) DEFAULT NULL,
  `weather` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `weather_data`
--

INSERT INTO `weather_data` (`id`, `min_temp`, `max_temp`, `weather`, `created_at`) VALUES
(1, 24.00, 35.00, '晴', '2025-06-17 01:53:13'),
(2, 24.00, 34.00, '晴', '2025-06-17 04:47:43'),
(3, 24.00, 35.00, '晴', '2025-06-17 06:05:54'),
(4, 24.00, 35.00, '晴', '2025-06-17 06:09:31'),
(5, 24.00, 35.00, '晴', '2025-06-17 06:12:16'),
(6, 24.00, 35.00, '晴', '2025-06-17 06:14:02'),
(7, 24.00, 35.00, '晴', '2025-06-17 06:16:00'),
(8, 24.00, 35.00, '晴', '2025-06-17 06:37:12'),
(9, 24.00, 35.00, '晴', '2025-06-17 07:40:52'),
(10, 26.00, 35.00, '晴時々曇', '2025-06-18 00:05:51'),
(11, 26.00, 35.00, '晴時々曇', '2025-06-18 00:08:50'),
(12, 26.00, 35.00, '晴時々曇', '2025-06-18 00:47:41');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `diaries`
--
ALTER TABLE `diaries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- テーブルのインデックス `exchange_rates`
--
ALTER TABLE `exchange_rates`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `news_top`
--
ALTER TABLE `news_top`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `nikkei_index`
--
ALTER TABLE `nikkei_index`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- テーブルのインデックス `weather_data`
--
ALTER TABLE `weather_data`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `diaries`
--
ALTER TABLE `diaries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- テーブルの AUTO_INCREMENT `exchange_rates`
--
ALTER TABLE `exchange_rates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- テーブルの AUTO_INCREMENT `news_top`
--
ALTER TABLE `news_top`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- テーブルの AUTO_INCREMENT `nikkei_index`
--
ALTER TABLE `nikkei_index`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- テーブルの AUTO_INCREMENT `weather_data`
--
ALTER TABLE `weather_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `diaries`
--
ALTER TABLE `diaries`
  ADD CONSTRAINT `diaries_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
