<%-- 
    Document   : signup
    Created on : Jun 16, 2024, 9:00:25 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Form</title>   
        <style>
            .header-text{
                margin-left: 10%;
            }
            .signup{
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                align-items: flex-start;

            }
            .col{
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                width: 450px;
                height: 250px;
                margin: 10px;
            }
            .text-box{
                width: 140px;
                height: 30px;
            }
            label {
                width: 100%;
                height: 20px;
                text-align: center;
                justify-content: center;
                display: block;
                margin-bottom: 10px;
            }
            input[type="text"], input[type="password"], input[type="email"] {
                width: 140px;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
            }

        </style>
    </head>
    <body>
        <jsp:include page="/include/header.jsp" />
        <form action="SignupServlet" method="post">
            <h1 class="header-text">ĐĂNG KÍ</h1>
            <div class="signup">
                <div class="col">
                    <label for="username">Tên đăng nhập:</label>
                    <br>
                    <br>
                    <input class="text-box" type="text" id="username" name="username" required>
                    
                </div>
                <div class="col">
                    a
                </div>
                <div class="col">
                    a
                </div>
            </div>
        </form>
    </body>
</html>
