<?php
//ログイン画面
require 'config.php';

//session設定
session_start();

//エラーメッセージ
$message = "";

try 
{
  //アクション判断
  if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["action"])) 
  {
      $action = $_POST["action"];

      //ログイン機能
      if ($action === "login") 
      {

          $username = $_POST["loginUsername"] ?? '';
          $password = $_POST["loginPassword"] ?? '';

          $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ?");
          $stmt->execute([$username]);
          $user = $stmt->fetch();

          //ログイン成功
          if ($user && password_verify($password, $user["password"])) 
          {
              $_SESSION['logged_in'] = true;
              $_SESSION['logged_success'] = true;
              $_SESSION['username'] = $user['username'];
              $_SESSION['user_id'] = $user['id'];
              

              header("Location: news.php");
              exit;
          }
          //ログイン失敗（ユーザー名またはパスワードが間違っています）
          else 
          {
              $message = "ユーザー名またはパスワードが間違っています。";
          }

      }
      
      //新規登録機能
      elseif ($action === "register") 
      {
          $username = $_POST["registerUsername"] ?? '';
          $password = $_POST["registerPassword"] ?? '';
          $confirm  = $_POST["registerConfirm"] ?? '';

          //新規登録失敗（二回パスワード一致しません）
          if ($password !== $confirm) 
          {
              $message = "パスワードが一致しません。";
          }
          else 
          {
              $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ?");
              $stmt->execute([$username]);
              $existingUser = $stmt->fetch();

              //新規登録成功
              if (!$existingUser) 
              {
                  $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

                  $stmt = $pdo->prepare("INSERT INTO users (username, password) VALUES (?, ?)");
                  $stmt->execute([$username, $hashedPassword]);

                  $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ?");
                  $stmt->execute([$username]);
                  $newUser = $stmt->fetch();

                  $_SESSION['logged_in'] = true;
                  $_SESSION['logged_success'] = true;
                  $_SESSION['username'] = $newUser['username'];
                  $_SESSION['user_id'] = $newUser['id'];

                  header("Location: news.php");
                  exit;
              }
              //新規登録失敗（ユーザー名重複）
              else 
              {
                  $message = "このユーザー名はすでに使われています。";
              }
          }
      }
  }
}

//エラー処理
catch (Exception $e) 
{
    die("データベースエラー: " . htmlspecialchars($e->getMessage()));
}
?>




<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ログイン / 新規登録</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card shadow">
          <div class="card-body">
            <h2 class="text-center mb-4">News&Diary</h2>

            <?php if (!empty($message)): ?>
              <div class="alert alert-info"><?= htmlspecialchars($message) ?></div>
            <?php endif; ?>

            <ul class="nav nav-tabs mb-3">
              <li class="nav-item">
                <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#login">ログイン</button>
              </li>
              <li class="nav-item">
                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#register">新規登録</button>
              </li>
            </ul>

            <div class="tab-content">
              
              <!-- ログイン -->
              <div class="tab-pane fade show active" id="login">
                <form id="loginForm" method="POST">
                  <input type="hidden" name="action" value="login">
                  <div class="mb-3">
                    <label for="loginUsername" class="form-label">ユーザー名</label>
                    <input type="text" class="form-control" id="loginUsername" name="loginUsername" required>
                  </div>
                  <div class="mb-3">
                    <label for="loginPassword" class="form-label">パスワード</label>
                    <input type="password" class="form-control" id="loginPassword" name="loginPassword" required>
                  </div>
                  <button type="submit" class="btn btn-primary w-100">ログイン</button>
                  <p id="loginMessage" style="color: red; margin-top: 10px;"></p>
                </form>
              </div>

              <!--JavaScript ログインチェック  -->
              <script>
                document.getElementById("loginForm").addEventListener("submit", function (event)
                {
                  const username = document.getElementById("loginUsername").value.trim();
                  const password = document.getElementById("loginPassword").value.trim();
                  const message = document.getElementById("loginMessage");

                  
                  message.textContent = "";

                  // 英文字と数字の正規表現
                  const usernameRegex = /^[a-zA-Z0-9]+$/;

                  if (username === "") 
                  {
                    event.preventDefault();
                    message.textContent = "ユーザー名を入力してください。";
                  } 
                  else if (!usernameRegex.test(username)) 
                  {
                    event.preventDefault();
                    message.textContent = "ユーザー名は英字と数字のみ使用できます。";
                  }
                });
              </script>


              <!-- 新規登録 -->
              <div class="tab-pane fade" id="register">
                <form id="registerForm" method="POST">
                  <input type="hidden" name="action" value="register">
                  <div class="mb-3">
                    <label for="registerUsername" class="form-label">ユーザー名</label>
                    <input type="text" class="form-control" id="registerUsername" name="registerUsername" required>
                  </div>
                  <div class="mb-3">
                    <label for="registerPassword" class="form-label">パスワード</label>
                    <input type="password" class="form-control" id="registerPassword" name="registerPassword" required>
                  </div>
                  <div class="mb-3">
                    <label for="registerConfirm" class="form-label">確認用パスワード</label>
                    <input type="password" class="form-control" id="registerConfirm" name="registerConfirm" required>
                  </div>
                  <button type="submit" class="btn btn-success w-100">新規登録</button>
                  <p id="registerMessage" style="color: red; margin-top: 10px;"></p>
                </form>
              </div>
            </div>

              <!--JavaScript 新規登録チェック  -->
              <script>
                document.getElementById("registerForm").addEventListener("submit", function (event)
                {
                  const username = document.getElementById("registerUsername").value.trim();
                  const password = document.getElementById("registerPassword").value.trim();
                  const confirm = document.getElementById("registerConfirm").value.trim();
                  const message = document.getElementById("registerMessage");

                  
                  message.textContent = "";

                  // 英文字と数字の正規表現
                  const usernameRegex = /^[a-zA-Z0-9]+$/;

                  if (username === "") 
                  {
                    event.preventDefault();
                    message.textContent = "ユーザー名を入力してください。";
                  } 
                  else if (!usernameRegex.test(username)) 
                  {
                    event.preventDefault();
                    message.textContent = "ユーザー名は英字と数字のみ使用できます。";
                  }

                });
              </script>




          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  
</body>
</html>
