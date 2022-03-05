<%-- 
    Document   : login
    Created on : Mar 5, 2022, 7:44:22 AM
    Author     : VINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="./login.css">
    </head>
    <body>
        <div class="main">
            <form action="login" method="POST" class="form" id="form-2">
                <h3 class="heading">ĐĂNG NHẬP</h3>

                <div class="spacer"></div>

                <div class="form-group">
                    <label for="email" class="form-label">Email</label>
                    <input id="email" name="email" type="text" placeholder="VD: email@domain.com" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <input id="password" name="password" type="password" placeholder="Nhập mật khẩu" class="form-control">
                    <span class="form-message"></span>
                </div>
                <span class="form-message">${errMessage}</span>
                <button class="form-submit">Đăng nhập</button>
                <div class="register">
                    <span>Bạn chưa có tài khoản?<a href="./register.jsp"> Đăng Kí</a></span>
                </div>
            </form>
        </div>
    </body>
    <script src="./validate.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            Validator({
                form: '#form-2',
                formGroupSelector: '.form-group',
                errorSelector: '.form-message',
                rules: [
                    Validator.isEmail('#email'),
                    Validator.minLength('#password', 6),
                ],
            });
        });
    </script>
</html>
