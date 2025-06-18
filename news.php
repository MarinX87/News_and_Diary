<?php
//ニュース画面


require 'config.php';
//session設定
session_start();

//ログインチェックする
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) 
{
  header("Location: index.php");
  exit();
}

//ログイン成功
else
{
  //test用
  //$userID = $_SESSION['user_id'];

  if($_SESSION['logged_success'] === true)
  {
      $test_alert = "<script type='text/javascript'>alert('ログイン成功しました！');</script>";
      print $test_alert;
      $_SESSION['logged_success'] = false;
  }

}

//天気予報取得
{
  try
  {
    $sql = "SELECT * FROM weather_data ORDER BY created_at DESC LIMIT 1;";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $weather = $stmt->fetch();
  }
  catch (Exception $e) 
  {
    die("データベースエラー: " . htmlspecialchars($e->getMessage()));
  }
}

//日経平均取得
{
  try
  {
    $sql = "SELECT * FROM nikkei_index ORDER BY timestamp DESC LIMIT 1;";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $nikkei = $stmt->fetch();
  }
  catch (Exception $e) 
  {
    die("データベースエラー: " . htmlspecialchars($e->getMessage()));
  }
}

//為替レート取得
{
  try
  {
    $sql = "SELECT * FROM exchange_rates ORDER BY timestamp DESC LIMIT 1;";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $rate = $stmt->fetch();
  }
  catch (Exception $e) 
  {
    die("データベースエラー: " . htmlspecialchars($e->getMessage()));
  }
}

//ニュース取得
{
  try
  {
    $sql = "SELECT * FROM news_top ORDER BY timestamp DESC LIMIT 10;";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $news = $stmt->fetchAll();
  }
  catch (Exception $e) 
  {
    die("データベースエラー: " . htmlspecialchars($e->getMessage()));
  }
}
?>



<!doctype html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>News & Diary</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { background-color: #f8f9fa; }
    .navbar-brand { font-size: 2rem; font-weight: bold; letter-spacing: 2px; }
    .info-bar 
    {
      background: linear-gradient(to right, #6dd5fa, #2980b9);
      color: white; padding: 0.75rem 1rem; border-radius: 0.5rem;
      margin-top: 1rem;
    }
    .info-card 
    {
      background: white; color: black; border-left: 5px solid #198754;
      box-shadow: 0 2px 6px rgba(0,0,0,0.05);
      padding: 1rem;
      border-radius: 0.5rem;
      margin-top: 1rem;
    }
    .blog-post img 
    {
      max-width: 100%;
      border-radius: 8px;
    }
    .blog-post 
    {
      background: white;
      border-radius: 0.5rem;
      box-shadow: 0 2px 8px rgba(0,0,0,0.05);
      padding: 1rem;
      margin-bottom: 1.5rem;
    }
  </style>
</head>
<body>

  <!-- ナビバー -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
      <span class="navbar-brand">News and Diary</span>
      <?php
        $username = isset($_SESSION['username']) ? $_SESSION['username'] : 'default';
        ?>
        <div class="d-flex ms-auto align-items-center gap-2">
          <a  class="btn btn-outline-light ms-auto">メールに発送</a>

          <a href="catch.php" class="btn btn-outline-light ms-auto">最新情報取得</a>

          <!-- 日報ボタン -->
          <a href="diary.php" class="btn btn-outline-light ms-auto">日記内容</a>

          <!-- ユーザー状態 -->
          <div class="dropdown">
            <button class="btn btn-outline-light dropdown-toggle" type="button" id="userMenu" data-bs-toggle="dropdown" aria-expanded="false">
              <?php print htmlspecialchars($username); ?>
            </button>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userMenu">
              <li><span class="dropdown-item-text">ログイン中：<?php print htmlspecialchars($username); ?></span></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item text-danger" href="logout.php">ログアウト</a></li>
            </ul>
          </div>
        </div>
    </div>
  </nav>


  <div class="container mt-3">

    <!-- 水平線 -->
    <hr class="my-5">


    <!-- 天気予報 -->
    <div class="info-bar text-center">
       <?php if ($weather && isset($weather['weather'], $weather['min_temp'], $weather['max_temp'])): ?>
        🌤️ 天気予報：
        <?php print htmlspecialchars($weather['weather'], ENT_QUOTES, 'UTF-8'); ?>　
        <?php print htmlspecialchars($weather['min_temp'], ENT_QUOTES, 'UTF-8'); ?>℃ ー
        <?php print htmlspecialchars($weather['max_temp'], ENT_QUOTES, 'UTF-8'); ?>℃
      <?php else: ?>
        🌤️ 天気予報： 情報取得できませんでした。
      <?php endif; ?>
    </div>


    <!-- 水平線 -->
    <hr class="my-5">

    <!-- 日経平均と為替 -->
    <div class="row mt-3">
      <div class="col-12 col-md-6">
        <div class="info-card">
          <h5>📈 日経平均</h5>
          <p>
            <?php if ($nikkei && isset($nikkei['index_value'], $nikkei['change_percent'])): ?>
              日経平均株価：
              <?php print htmlspecialchars($nikkei['index_value'],ENT_QUOTES,'UTF-8'); ?>
              (昨日より <?php if ( $nikkei['change_percent'] > 0): ?>
                        +<?php print htmlspecialchars($nikkei['change_percent'],ENT_QUOTES,'UTF-8'); ?>)
                        <?php else: ?>
                        <?php print htmlspecialchars($nikkei['change_percent'],ENT_QUOTES,'UTF-8'); ?>)
                         <?php endif; ?>
              <?php else: ?>
                日経平均株価： 情報取得できませんでした。
              <?php endif; ?>
          </p>
        </div>
      </div>
      <div class="col-12 col-md-6">
        <div class="info-card">
          <h5>💱 為替</h5>
          <p>1 ドル = 
          <?php if ($rate && isset($rate['usd_to_jpy'])): ?>
          <?php print htmlspecialchars($rate['usd_to_jpy'],ENT_QUOTES,'UTF-8'); ?>
          <?php else: ?>
            為替レート: 情報取得できませんでした。
          <?php endif; ?>
          円</p>
        </div>
      </div>
    </div>
        



    <!-- 水平線 -->
    <hr class="my-5">

    <!-- ニュース分類ナビ -->
    <ul class="nav nav-tabs mt-4" id="newsTab" role="tablist">
      <li class="nav-item" role="presentation">
        <button class="nav-link active" id="top-tab" data-bs-toggle="tab" data-bs-target="#top" type="button" role="tab">
          📰 トップニュース
        </button>
      </li>
    </ul>

    <!-- ニュース内容-->
    <div class="tab-content" id="newsTabContent">
      <div class="tab-pane fade show active" id="top" role="tabpanel">
        <?php if (empty($news)): ?>
          <p>ニュースがまだありません。</p>
        <?php else: ?>
          <?php foreach ($news as $item): ?>
            <div class="blog-post row align-items-center mt-3">
              <div class="col-12 col-md-5">
                <img src="<?= htmlspecialchars($item['image']) ?>" alt="トップニュース画像" class="img-fluid">
              </div>
              <div class="col-12 col-md-7">
                <h3>
                  <a href="<?= htmlspecialchars($item['url']) ?>" target="_blank" rel="noopener noreferrer">
                    <?= htmlspecialchars($item['title']) ?>
                  </a>
                </h3>
                <p class="text-muted"><?= htmlspecialchars($item['timestamp']) ?></p>
              </div>
            </div>
          <?php endforeach; ?>
        <?php endif; ?>
      </div>
    </div>


    <!-- 水平線 -->
    <hr class="my-5">

  </div>

  <!-- Bootstrap Script -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
