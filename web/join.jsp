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

        .goback {
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

        .goback:hover {
            filter: sepia(100%) contrast(50%) saturate(500%) hue-rotate(423deg);
        }

        .container {
            width: 320px;
            height: 470px;
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

        .container_form {
            padding-top: 12px;
        }

        .container_form .form {
            width: 260px;
            height: 34px;
            color: white;
            font-size: 16px;
            font-weight: 200;
            background-color: #2D2D32;
            border-top: none;
            border-left: none;
            border-right: none;
            border-bottom: 0.5px solid white;
            margin: 11px 0;
        }

        .container_form .submit_btn {
            margin-top: 28px;
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
            .goback {
                width: 60px;
                right: 36px;
                top: 160px;
            }
        }

        @media screen and (min-width: 1000px) and (max-width: 1199px) {
            .goback {
                width: 58px;
                right: 30px;
                top: 150px;
            }
        }

        @media screen and (min-width: 800px) and (max-width: 999px) {
            .goback {
                width: 56px;
                right: 20px;
                top: 136px;
            }
        }

        @media screen and (min-width: 600px) and (max-width: 799px) {
            .goback {
                width: 40px;
                right: 14px;
                top: 100px;
            }
        }

        @media screen and (max-width: 599px) {
            .goback {
                width: 36px;
                right: 6px;
                top: 80px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="bgi">
    <a href="login.jsp"><img class="goback" src="img/goback.png" alt=""></a>
    <div class="container">
        <div class="title">WELCOME :)</div>
        <form class="container_form" action="process/joinProcess.jsp" method="post">
            <input class="form" id="email" name="email" type="email" placeholder="Email ID" maxlength="30" oninvalid="this.setCustomValidity('')" oninput="this.setCustomValidity('Please input your email in the format.')" required>
            <input class="form" id="name" name="name" type="text" placeholder="Name" maxlength="20" required>
            <input class="form" id="pwd1" name="pwd1" type="password" placeholder="Pwd 8 to 15 digits including numbers" minlength="8" maxlength="15" required>
            <input class="form" id="pwd2" name="pwd2" type="password" placeholder="Pwd 8 to 15 digits including numbers" minlength="8" maxlength="15" required>
            <input class="form" id="tel" name="tel" type="text" placeholder="010-1234-5678" maxlength="15" required>
            <input class="submit_btn" id="submit" type="submit" value="JOIN">
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script>
    $(function () {
        $("#email").focusout(function () {
            var email = $("#email").val();
            var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
            if (!reg_email.test(email)) {
                $("#email").css("border-bottom", "0.5px solid red");
            } else {
                $.ajax({
                    url: "process/emailCheckService.jsp",
                    type: "post",
                    data: {email: email},
                    dataType: 'json',
                    success: function(res) {
                        if (Boolean(res)) {
                            $("#email").css("border-bottom", "0.5px solid red");
                        } else {
                            $("#email").css("border-bottom", "0.5px solid green");
                        }
                    },
                    error: function(err) {
                        console.log(err);
                    }
                });
            }
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
        });

        $("#name").keyup(function () {
            $(this).val($(this).val().replace(/[^a-zA-Zㄱ-ㅣ가-힣]/g, ""));
        });

        $("#tel").keyup(function () {
            $(this).val($(this).val().replace(/[^\d\-]/g, ""));
        });
    });
</script>
</html>