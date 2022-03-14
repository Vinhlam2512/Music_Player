<%-- 
    Document   : register
    Created on : Mar 5, 2022, 7:44:34 AM
    Author     : VINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="./css/login.css">
    </head>
    <body>
        <div class="main">

            <form action="register" method="POST" class="form" id="form-1">
                <h3 class="heading">ĐĂNG KÍ ADMIN</h3>

                <div class="spacer"></div>

                <div class="form-group">
                    <label for="fullname" class="form-label">Tên đầy đủ</label>
                    <input id="fullname" name="fullname" type="text" placeholder="VD: Lâm Vinh" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group ">
                    <label for="email" class="form-label">Email</label>
                    <input id="email" name="email" type="text" placeholder="VD: email@domain.com" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <input id="password" name="password" type="password" placeholder="Nhập mật khẩu" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="password_confirmation" class="form-label">Nhập lại mật khẩu</label>
                    <input id="password_confirmation"  name="password_confirmation" placeholder="Nhập lại mật khẩu" type="password"  class="form-control">
                    <span class="form-message"></span>
                </div>
                <div class="register">
                    <span>Bạn đã có tài khoản?<a href="./login.jsp"> Đăng Nhập</a></span>
                </div>
                <button type="submit" class="form-submit">Đăng ký</button>
            </form>

        </div>
        <script src="./js/validate.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Mong muốn của chúng ta
                Validator({
                    form: '#form-1',
                    formGroupSelector: '.form-group',
                    errorSelector: '.form-message',
                    rules: [
                        Validator.isRequired('#fullname', 'Vui lòng nhập tên đầy đủ của bạn'),
                        Validator.isEmail('#email'),
                        Validator.minLength('#password', 6),
                        Validator.isRequired('#password_confirmation'),
                        Validator.isConfirmed('#password_confirmation', function () {
                            return document.querySelector('#form-1 #password').value;
                        }, 'Mật khẩu nhập lại không chính xác')
                    ],

                });
            });
        </script>
    </body>
</html>
