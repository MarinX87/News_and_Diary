<?php
//phpでpythonを実行する

//session設定
session_start();

header("Content-Type: text/plain");

$baseDir = __DIR__;
$python = "python";

//pythonスクリプト
$scripts = [
    "$baseDir/../python/get_weather.py",
    "$baseDir/../python/get_rate.py",
    "$baseDir/../python/get_news_top.py",
    "$baseDir/../python/get_nikkei.py"
];

//debug用
$results = [];

//実行する
foreach ($scripts as $index => $scriptPath) 
{
    $command = "$python \"$scriptPath\"";
    $output = shell_exec($command);

    $results[] = "スクリプト " . ($index + 1) . " 結果：\n" . ($output ?? "エラー") . "\n";

    sleep(3);
}

//debug用
print implode("\n-------------------\n", $results);


// header("Location: index.php");
// exit();

?>
