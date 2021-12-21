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
        }

        #bgi {
            background-size: cover;
            background-image: url("img/background.png");
            background-position: center;
            min-height: 85%;
            border: 0;
            padding: 0;
        }

        .container {
            padding-top: 120px;
            margin-bottom: 200px;

            display: flex;
            flex-direction: column;
            align-items: center;

            font-family: 'Barlow', sans-serif;
            font-weight: 200;
        }

        .board {
            padding: 16px;

            resize: none;
            box-sizing: border-box;
            border: 1px dashed white;
            border-radius: 10px;

            background-color: transparent;
            font-size: 16px;
            color: white;
        }

        .submit_btn, .back_link {
            margin: 20px;
            width: 70px;
            height: 30px;
            border-radius: 10px;
            border: 0 none;

            background-color: #5E5D63;
            color: white;
            font-size: 16px;
            font-weight: 100;
            text-decoration: none;
            cursor: pointer;

            transition: opacity, color 0.1s ease-in;
        }

        .submit_btn:hover, .back_link:hover {
            opacity: 0.6;
            color: #FF007F;
        }

        .back_link {
            margin: 0;
        }

        @media screen and (min-width: 1000px) {
            .board {
                width: 600px;
                height: 400px;
            }
        }

        @media screen and (min-width: 800px) and (max-width: 999px) {
            .board {
                width: 510px;
                height: 340px;
            }
        }

        @media screen and (min-width: 600px) and (max-width: 799px) {
            .board {
                width: 420px;
                height: 280px;
            }
        }

        @media screen and (min-width: 400px) and (max-width: 599px) {
            .board {
                width: 340px;
                height: 280px;
            }
        }

        @media screen and (max-width: 399px) {
            .board {
                width: 300px;
                height: 280px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="bgi">
    <form class="container" action="process/insertReviewProcess.jsp" method="post">
        <textarea class="board" name="contents" minlength="20" required></textarea>
        <div>
            <button class="submit_btn"><a class="back_link" href="review.jsp">BACK</a></button>
            <input class="submit_btn" type="submit" value="ADD +">
        </div>
    </form>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>