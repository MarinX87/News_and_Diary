<?php
//ログアウト機能

session_start();
session_unset();
session_destroy();
header("Location: index.php");
exit();
?>
