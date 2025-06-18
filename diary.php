<?php
//日記画面
require 'config.php';

//session設定
session_start();

//ログインチェックする
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) 
{
  header("Location: index.php");
  exit();
}

//日記内容
$entries = [];

//検索キーワード
$keyword = $_GET['q'] ?? '';




try 
{
  $userId = $_SESSION['user_id'];

  //検索画面
  if ($keyword) 
  {
    $sql = "SELECT * FROM diaries WHERE user_id = ? AND content LIKE ? ORDER BY id DESC";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$userId, '%' . $keyword . '%']);
    $entries = $stmt->fetchAll();
  }
  else 
  {
    //一覧画面
    $sql = "SELECT * FROM diaries WHERE user_id = ? ORDER BY id DESC";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$userId]);
    $entries = $stmt->fetchAll();
  }

  //日記を追加する
  if ($_SERVER['REQUEST_METHOD'] === 'POST') 
  {
    $content = trim($_POST['content']);
    if ($content) 
    {
      $sql = "INSERT INTO diaries (user_id, content) VALUES (?, ?)";
      $stmt = $pdo->prepare($sql);
      $stmt->execute([$userId, $content]);

      header("Location: diary.php");
      exit();
    }
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
  <title>Diary</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { background-color: #f8f9fa; }
    .navbar-brand { font-size: 2rem; font-weight: bold; letter-spacing: 2px; }
    .entry-card 
    {
      background: white;
      border-left: 5px solid #0d6efd;
      border-radius: 0.5rem;
      box-shadow: 0 2px 6px rgba(0,0,0,0.05);
      padding: 1rem;
      margin-bottom: 1.5rem;
    }
    textarea.form-control { resize: vertical; min-height: 120px; }
  </style>
</head>
<body>

<!-- ナビ -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <span class="navbar-brand">Diary</span>
    <?php $username = $_SESSION['username'] ?? 'default'; ?>
    <div class="d-flex ms-auto align-items-center gap-2">
      <a href="news.php" class="btn btn-outline-light">ニュース画面</a>
      <div class="dropdown">
        <button class="btn btn-outline-light dropdown-toggle" type="button" data-bs-toggle="dropdown">
          <?= htmlspecialchars($username) ?>
        </button>
        <ul class="dropdown-menu dropdown-menu-end">
          <li><span class="dropdown-item-text">ログイン中：<?= htmlspecialchars($username) ?></span></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item text-danger" href="logout.php">ログアウト</a></li>
        </ul>
      </div>
    </div>
  </div>
</nav>

<!-- メイン -->
<div class="container mt-4">
  <hr class="my-5">   

    <!-- 検索フォーム -->
    <form method="get" class="mb-4" onsubmit="return trimInput()">
      <div id="search" class="input-group">
        <input type="text" id="q" name="q" class="form-control" placeholder="何探したい..." value="<?= htmlspecialchars($keyword ?? '') ?>">
        <button class="btn btn-outline-secondary" type="submit">検索</button>
      </div>
    </form>

    <script>
      function trimInput() 
      {
        const input = document.getElementById('q');
        input.value = input.value.trim(); // 前後の空白を除去
        return true; // フォーム送信を続ける
      }
    </script>

  <hr class="my-5">

  <!-- 投稿フォーム -->
  <?php if (!isset($keyword) || $keyword === ''): ?>
    <form method="post" class="mb-4">
      <textarea class="form-control mb-2" name="content" rows="8" placeholder="メモ・日記を書いてください..."></textarea>
      <button class="btn btn-primary">提出</button>
    </form>
  <?php else: ?>
    <p class="text-muted">🔍 キーワード： “<strong><?= htmlspecialchars($keyword) ?></strong>” の検索結果：</p>
  <?php endif; ?>

  <hr class="my-5">

  <!-- 日報リスト -->
  <?php if (empty($entries)): ?>
    <p class="text-muted">📭 データが見つかりません。</p>
  <?php else: ?>
    <?php foreach ($entries as $entry): ?>
      <div class="entry-card">
        <div class="form-control mb-2 bg-light" style="white-space: pre-wrap;">
          <?= nl2br(htmlspecialchars($entry['content'])) ?>
        </div>

        <div class="d-flex justify-content-between align-items-center">
          <small class="text-muted">🕒 <?= $entry['created_at'] ?></small>
          <div>
            <a href="edit.php?id=<?= $entry['id'] ?>" class="btn btn-outline-secondary btn-sm me-1">編集</a>
            <a href="delete.php?id=<?= $entry['id'] ?>" class="btn btn-danger btn-sm" onclick="return confirm('本当に削除しますか？');">削除</a>
          </div>
        </div>
      </div>
    <?php endforeach; ?>
  <?php endif; ?>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

