<?php
//更新機能

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

  if ($_SERVER['REQUEST_METHOD'] === 'POST') 
  {
      $id = $_POST['id'];
      $content = trim($_POST['content']);
      $userId = $_SESSION['user_id'];

    if ($id && $content && $userId) 
    {
      $sql  = "UPDATE diaries SET content = ? WHERE id = ? AND user_id = ?";
      $stmt = $pdo->prepare($sql);
      $stmt->execute([$content, $id, $userId]);
    }

    header("Location: diary.php");
    exit();
  }

}
catch (Exception $e) 
{
  die("データベースエラー: " . htmlspecialchars($e->getMessage()));
}

?>
