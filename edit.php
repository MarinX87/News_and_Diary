<?php
//編集機能

require 'config.php';

//session設定
session_start();

//ログインチェック
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) 
{
  header("Location: index.php");
  exit();
}


$id = $_GET['id'] ?? "";
$userId = $_SESSION['user_id'] ?? "";

try
{
    // データ取得
    $stmt = $pdo->prepare("SELECT * FROM diaries WHERE id = ? AND user_id = ?");
    $stmt->execute([$id, $userId]);
    $entry = $stmt->fetch();

    if (!$entry) 
    {
        echo "日記が見つかりません。";
        exit();
    }

}
catch (Exception $e) 
{
  die("データベースエラー: " . htmlspecialchars($e->getMessage()));
}
?>


<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>編集</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
  <div class="container mt-5">
    <h1 class="mb-4">日記編集</h1>

    <form action="update.php" method="post">
      <input type="hidden" name="id" value="<?= htmlspecialchars($entry['id']) ?>">
      <div class="mb-3">
        <textarea name="content" class="form-control" rows="10"><?= htmlspecialchars($entry['content']) ?></textarea>
      </div>
      <button type="submit" class="btn btn-primary">更新する</button>
      <a href="diary.php" class="btn btn-secondary">戻る</a>
    </form>
  </div>
</body>
</html>
