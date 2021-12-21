<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="#">
    <title>Insert title here</title>
</head>
<style>

    .footer {
        width: 100%;
        bottom: 0;

        font-size: 10px;

        background-color: black;
        color: white;
        overflow: hidden;

        display: flex;
        justify-content: center;
        align-items: center;

        padding: 4px 0;
        margin-top: 1px;

        -webkit-user-drag: none;
        -ms-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }

    @media screen and (min-width: 800px) {
        .footer_box {
            padding: 4px 40px;
        }

        .footer_box > img {
            width: 50px;
        }
    }

    @media screen and (min-width: 540px) and (max-width: 799px) {
        .footer_box {
            padding: 4px 20px;
        }

        .footer_box > img {
            width: 46px;
        }
    }

    @media screen and (max-width: 539px) {
        .footer_box {
            padding: 4px 10px;
        }

        .footer_box > img {
            width: 40px;
        }
    }

</style>

<body>

<div class="footer">
    <div class="footer_box">
        <img src="img/logo.png" style="-webkit-user-drag: none;" align="center" alt="">
    </div>
    <div class="footer_box">
        대표자명 서영준 사업자등록번호 202-000-00000 통신판매업신고번호 제 0001-서울종로-1000호<br>
        서울 종로구 돈화문로 26 단성사 3층<br>
        3th floor, 26, Donhwamun-ro, Jongro-gu, Seoul, KOREA<br>
        TEL. 02-3672-6900<br><br>
        Copyright 2021 KG3 CO., Inc All rights reserved.
    </div>
</div>
</body>
</html>