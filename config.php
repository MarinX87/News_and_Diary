<?php
//データベースを連続する
$host = 'localhost';
$db   = 'diary_app';
$user = 'rezouser'; 
$pass = 'Rezo_0000';     
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = 
[
  PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
];

try 
{
  $pdo = new PDO($dsn, $user, $pass, $options);
} 
catch (PDOException $e) 
{
   exit('DB接続エラー: ' . $e->getMessage());
}
?>
