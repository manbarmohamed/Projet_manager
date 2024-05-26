<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Codecademy Login Page Clone</title>
    <style>
        <%@include file="/WEB-INF/css/login.css"%>
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Login to MedEx</h1>
    </div>
    <form action="login" method="post">
        <label for="un">Email or Username</label>
        <input type="text" name="username" id="un">
        <label for="ps">PassWord</label>
        <input type="password" name="password" id="ps">
        <a href="#">I forgot my password</a>
        <input type="submit" value="Log In">
    </form>
    <div class="footer">
        <h3>Login with another account</h3>
        <div class="images">
            <img src="https://i.ibb.co/0MmX2kM/1.png" alt="">
            <img src="https://i.ibb.co/TtX5dGr/2.png" alt="">
            <img src="https://i.ibb.co/dLbpw73/3.png" alt="">
            <img src="ihttps://i.ibb.co/87bDc5N/4.png" alt="">
            <img src="https://i.ibb.co/m0Ch2Jf/5.jpg" alt="">
        </div>
        <a href="#">not a member yet?<strong>Sign up free</strong></a>
    </div>
</div>
</body>
</html>