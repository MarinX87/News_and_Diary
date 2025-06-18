<?php
//削除機能

require 'config.php';

//session設定
session_start();

//ログインチェック
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) 
{
  header("Location: index.php");
  exit();
}

try
{
  if (isset($_GET['id']) && isset($_SESSION['user_id'])) 

  {
    $id     = $_GET['id'];
    $userId = $_SESSION['user_id'];

    $sql  = "DELETE FROM diaries WHERE id = ? AND user_id = ?";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$id, $userId]);
  }
}
catch (Exception $e) 
{
  die("データベースエラー: " . htmlspecialchars($e->getMessage()));
}


header("Location: diary.php");
exit();
?>
