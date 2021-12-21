<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires",0);
    if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<%
    String nextUrl = request.getParameter("nextUrl");
    boolean process = Boolean.parseBoolean(request.getParameter("process"));
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="#">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <style>
        html, body {
            height: 100%;

            margin: 0;
            padding: 0;
        }

        #bgi {
            background-size: cover;
            background-image: url("img/background.png");
            background-position: center;
            min-height: 85%;
            border: 0;
            padding: 0;
        }

        .loader {
            border: 14px solid #f3f3f3;
            border-radius: 50%;
            width: 120px;
            height: 120px;
            animation: spin 2s linear infinite;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            opacity: 0.5;
        }

        .loading_icon {
            width: 50px;
            height: 50px;
            top: calc(50% - 25px);
            left: calc(50% - 25px);
            position: absolute;

            -webkit-animation: fadeinout 1s linear forwards;
            animation: fadeinout 1s linear forwards;
        }

        @keyframes spin {
            0% {
                transform: translate(-50%, -50%) rotate(0deg);
            }
            100% {
                transform: translate(-50%, -50%) rotate(360deg);
            }
        }

        @-webkit-keyframes fadeinout {
            0%, 100% {
                opacity: 0;
            }
            50% {
                opacity: 1;
            }
        }

        @keyframes fadeinout {
            0%, 100% {
                opacity: 0;
            }
            50% {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="bgi">
    <div class="loader"></div>
    <img class="loading_icon" alt="">
</div>
<jsp:include page="footer.jsp"/>
</body>
<script>

    function goUrl() {
        window.location.href = '<%=nextUrl%>';
    }

    $(function () {
        setTimeout("goUrl()", 1400);
        var $loading_icon = $(".loading_icon");

        if (<%=process%>) {
            console.log("hi")
            $(".loader").css('border-top', '14px solid #9BC6A7');
            $loading_icon.attr('src', 'img/success.png');
            $loading_icon.css('filter', 'sepia(100%) contrast(50%) saturate(500%) hue-rotate(423deg)');
        } else {
            $(".loader").css('border-top', '14px solid #FF69B4');
            $loading_icon.attr('src', 'img/failure.png');
            $loading_icon.css('filter', 'grayscale(100%) brightness(40%) sepia(100%) hue-rotate(-50deg) saturate(600%) contrast(0.8)');
        }
    });

    $(".loader").fadeOut(1800);
</script>
</html>