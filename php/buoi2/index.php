<?php
//session: lưu server
// Thông tin đăng nhập, giỏ hàng...
session_start();
$_SESSION["name"] = "Nguyen Thi Thuy 123";

echo $_SESSION["name"];


//cookie: 
// lưu ở phía máy chủ người dùng
// dùng cho những thông tin ít quan trọng
$cookieName = "user";
$cookieValue = "NguyenThiThuy";
// 86400 = 30 ngay

setcookie($cookieName, $cookieValue, time()+(86400),"/");
if(isset($_COOKIE[$cookieName])) {
    echo "cookie đã tồn tại";
}
else{
    echo "cookie chưa tồn tại";
}
?>