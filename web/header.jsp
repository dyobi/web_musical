<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="#">
    <style>

        .header {
            background-size: cover;
            background-image: url("img/header.png");
            background-position: center;
            font-family: 'Barlow', sans-serif;
            font-weight: 300;
            overflow: hidden;
            margin-bottom: 2px;

            display: flex;
            flex-direction: column;
        }

        .header a {
            float: right;
            color: white;
            text-align: center;
            text-decoration: none;

            -webkit-user-drag: none;
            -ms-user-select: none;
            -webkit-user-select: none;
            user-select: none;
        }

        .header a:hover {
            color: #FF007F;
        }

        .header .title {
            color: white;
            position: absolute;
            font-weight: bold;

            -webkit-user-drag: none;
            -ms-user-select: none;
            -webkit-user-select: none;
            user-select: none;
        }

        .logo {
            -webkit-user-drag: none;
            -ms-user-select: none;
            -webkit-user-select: none;
            user-select: none;
        }

        .logo:hover {
            filter: sepia(100%) contrast(50%) saturate(500%) hue-rotate(423deg);
        }

        @media screen and (min-width: 1200px) {
            .nav a {
                padding: 10px 40px;
                font-size: 24px;
            }

            .logo {
                width: 60px;
                padding-right: 40px;
                padding-top: 20px;
            }

            .title {
                font-size: 40px;
                top: 14px;
                left: 20px;
            }
        }

        @media screen and (min-width: 1000px) and (max-width: 1199px) {
            .nav a {
                padding: 10px 34px;
                font-size: 21px;
            }

            .logo {
                width: 58px;
                padding-right: 34px;
                padding-top: 19px;
            }

            .title {
                font-size: 38px;
                top: 13px;
                left: 19px;
            }
        }

        @media screen and (min-width: 800px) and (max-width: 999px) {
            .nav a {
                padding: 10px 24px;
                font-size: 18px;
            }

            .logo {
                width: 56px;
                padding-right: 24px;
                padding-top: 18px;
            }

            .title {
                font-size: 36px;
                top: 12px;
                left: 18px;
            }
        }

        @media screen and (min-width: 600px) and (max-width: 799px) {
            .nav a {
                padding: 6px 18px;
                font-size: 16px;
            }

            .logo {
                width: 40px;
                padding-right: 18px;
                padding-top: 12px;
            }

            .title {
                font-size: 30px;
                top: 8px;
                left: 14px;
            }
        }

        @media screen and (max-width: 599px) {
            .nav a {
                padding: 4px 10px;
                font-size: 12px;
            }

            .logo {
                width: 36px;
                padding-right: 10px;
                padding-top: 10px;
            }

            .title {
                font-size: 26px;
                top: 4px;
                left: 8px;
            }
        }
    </style>
</head>
<body>
<div class="header">
    <div>
        <a href="index.jsp"><img class="logo" src="img/logo.png" alt=""></a>
        <div class="title">мюзикл</div>
    </div>
    <div class="nav">
        <%
            if (session.getAttribute("id") == null) {
        %><a href="login.jsp">Log-in</a><%
    } else {
    %><a href="mypage.jsp">My page</a><%
        }
        ;
    %>
        <a href="review.jsp">Review</a>
        <a href="location.jsp">Location</a>
        <a href="ticket.jsp">Ticket</a>
        <a href="cast.jsp">Cast</a>
    </div>
</div>
</body>
</html>

