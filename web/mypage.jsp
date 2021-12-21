<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

        .logout {
            position: absolute;

            -webkit-user-drag: none;
            -ms-user-select: none;
            -webkit-user-select: none;
            user-select: none;
        }

        .logout:hover {
            filter: sepia(100%) contrast(50%) saturate(500%) hue-rotate(423deg);
        }

        .order_list {
            position: absolute;
            margin-bottom: 60px;
            width: 160px;
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

        .order_list:hover {
            opacity: 0.6;
            color: #FF007F;
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

        @media screen and (min-width: 815px) {
            .order_list {
                top: 680px;
            }
        }

        @media screen and (max-width: 814px) {
            .order_list {
                top: 130px;
            }
        }

        @media screen and (min-width: 1200px) {
            .logout {
                width: 60px;
                right: 36px;
                top: 160px;
            }
        }
        @media screen and (min-width: 1000px) and (max-width: 1199px) {
            .logout {
                width: 58px;
                right: 30px;
                top: 150px;
            }
        }
        @media screen and (min-width: 800px) and (max-width: 999px) {
            .logout {
                width: 56px;
                right: 20px;
                top: 136px;
            }
        }
        @media screen and (min-width: 600px) and (max-width: 799px) {
            .logout {
                width: 40px;
                right: 14px;
                top: 100px;
            }
        }
        @media screen and (max-width: 599px) {
            .logout {
                width: 36px;
                right: 6px;
                top: 80px;
            }
        }
    </style>
</head>
<body>
<%
    String userName = "User Name";
    String tel = "010-1234-5678";

    if (session.getAttribute("name") != null && session.getAttribute("tel") != null) {
        userName = session.getAttribute("name").toString();
        tel = session.getAttribute("tel").toString();
    }
%>
<jsp:include page="header.jsp"/>
<div id="bgi">
    <a href="process/logoutProcess.jsp"><img class="logout" src="img/logout.png" alt=""></a>
    <button onclick="location.href='viewOrder.jsp'" class="order_list">ORDER LIST</button>
    <div class="container">
        <div class="title">PASSWORD</div>
        <form class="container_form" action="process/changePwdProcess.jsp" method="post">
            <input class="form" id="pwd1" name="pwd1" type="password" placeholder="Password" maxlength="15" required>
            <input class="form" id="pwd2" name="pwd2" type="password" placeholder="Password" maxlength="15" required>
            <input class="submit_btn" type="submit" value="CHANGE">
        </form>
    </div>
    <div class="container">
        <div class="title">PERSONAL INFO</div>
        <form class="container_form" action="process/changeInfoProcess.jsp" metho="post">
            <input class="form" id="name" name="name" type="text" maxlength="15" required>
            <input class="form" id="tel" name="tel" type="text" maxlength="15" required>
            <input class="submit_btn" type="submit" value="CHANGE">
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script>
    $(function () {
        $("#name").attr("placeholder", "<%=userName%>");
        $("#tel").attr("placeholder", "<%=tel%>");

        $("#name").keyup(function () {
            $(this).val($(this).val().replace(/[^a-zA-Zㄱ-ㅣ가-힣]/g, ""));
        });

        $("#tel").keyup(function () {
            $(this).val($(this).val().replace(/[^\d\-]/g, ""));
        });

        $("input").keyup(function () {
            var pwd1 = $("#pwd1").val();
            var pwd2 = $("#pwd2").val();

            if (pwd1 !== "" && pwd2 !== "") {
                if (pwd1 === pwd2) {
                    $("#submit").removeAttr("disabled");
                } else {
                    $("#submit").attr("disabled", "disabled");
                }
            }
        });

        $("#pwd1").keyup(function () {
            $("#pwd1").on("change", function () {
                var v = this.value;
                $(this).css("border-bottom", function () {
                    if (!/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,15}$/.test(v)) {
                        return "0.5px solid red";
                    } else {
                        return "0.5px solid green";
                    }
                });
            }).change();
        });

        $("#pwd2").keyup(function () {
            $("#pwd2").on("change", function () {
                var v = this.value;
                $(this).css("border-bottom", function () {
                    if (v === $("#pwd1").val()) {
                        return "0.5px solid green";
                    } else {
                        return "0.5px solid red";
                    }
                });
            }).change();
        })
    });
</script>
</html>
