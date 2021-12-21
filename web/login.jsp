<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="#">
    <style>
        html, body {
            height: 100%;

            margin: 0;
            padding: 0;

            font-family: 'Barlow', sans-serif;
            font-weight: 300;
        }

        #bgi {
            background-size: cover;
            background-image: url("img/background.png");
            background-position: center;
            min-height: 85%;
            border: 0;
            padding: 0;

            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            justify-content: center;
        }

        .join {
            padding: 4px;
            position: absolute;
            color: white;

            -webkit-user-drag: none;
            -ms-user-select: none;
            -webkit-user-select: none;
            user-select: none;

            -webkit-box-shadow: 0 0 6px #fff;
            box-shadow: 0 0 6px #fff;
        }

        .join:hover {
            filter: sepia(100%) contrast(50%) saturate(500%) hue-rotate(423deg);
        }

        .container {
            width: 320px;
            height: 360px;
            border-radius: 8%;
            margin-top: 120px;
            margin-left: 40px;
            margin-right: 40px;

            display: flex;
            flex-direction: column;
            align-items: center;
            overflow: hidden;

            -webkit-box-shadow: 0 0 12px #fff;
            box-shadow: 0 0 12px #fff;
        }

        .container .title {
            text-align: center;
            width: 320px;
            height: 70px;
            line-height: 70px;
            font-size: 24px;
            background-color: #5E5D63;
            opacity: 0.8;
            color: white;
        }

        .container .container_form {
            width: 100%;
            height: 100%;
            background-color: #2D2D32;
            opacity: 0.8;

            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .container_form .form {
            width: 260px;
            height: 40px;
            color: white;
            font-size: 16px;
            font-weight: 200;
            background-color: #2D2D32;
            border-top: none;
            border-left: none;
            border-right: none;
            border-bottom: 0.5px solid white;
            margin: 22px 0;
        }

        .container_form .submit_btn {
            margin-top: 50px;
            width: 200px;
            height: 40px;
            border: 0 none;
            border-radius: 8px;
            background-color: #5E5D63;
            color: white;
            font-size: 16px;
            font-weight: 200;
            cursor: pointer;

            -webkit-box-shadow: 0 0 6px #fff;
            box-shadow: 0 0 6px #fff;

            transition: opacity, color 0.1s ease-in;
        }

        .container_form .submit_btn:hover {
            opacity: 0.6;
            color: #FF007F;
        }

        input::placeholder {
            opacity: 0.3;
            color: white;
            font-size: 16px;
            font-weight: 200;
        }

        input:focus {
            outline: none;
        }

        @media screen and (min-width: 1200px) {
            .join {
                width: 60px;
                height: 58px;
                right: 40px;
                top: 160px;
            }
        }
        @media screen and (min-width: 1000px) and (max-width: 1199px) {
            .join {
                width: 58px;
                height: 56px;
                right: 34px;
                top: 150px;
            }
        }
        @media screen and (min-width: 800px) and (max-width: 999px) {
            .join {
                width: 56px;
                height: 54px;
                right: 26px;
                top: 136px;
            }
        }
        @media screen and (min-width: 600px) and (max-width: 799px) {
            .join {
                width: 40px;
                height: 38px;
                right: 18px;
                top: 100px;
            }
        }
        @media screen and (max-width: 599px) {
            .join {
                width: 36px;
                height: 34px;
                right: 10px;
                top: 80px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="bgi">
    <a href="join.jsp"><img class="join" src="img/join.png" alt=""></a>
    <div class="container">
        <div class="title">CUSTOMER LOGIN</div>
        <form class="container_form" action="process/loginProcess.jsp" method="post">
            <input class="form" name="email" type="email" placeholder="Email ID" maxlength="30" required>
            <input class="form" name="pwd" type="password" placeholder="Password" maxlength="15" required>
            <input class="submit_btn" type="submit" value="LOGIN">
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>