<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="jsp.dao.OrderDao" %>
<%@ page import="java.sql.SQLException" %>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy / MM / dd");
    Date date = new Date();
    Calendar cal = Calendar.getInstance();
    cal.setTime(date);
    cal.add(Calendar.DATE, 6);

    int[] arr = {0, 0, 0, 0, 0, 0, 0};

    try {
        arr = new OrderDao().getAvailTickets();
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }

%>
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

            -webkit-user-drag: none;
            -ms-user-select: none;
            -webkit-user-select: none;
            user-select: none;
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
            padding: 60px 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .order_list {
            margin: 10px;
            display: flex;
            flex-direction: row;
            justify-content: space-between;

            background-color: white;
            opacity: 0.8;
            transition: opacity, color 0.1s ease-in;
            cursor: pointer;

            -webkit-box-shadow: 0 0 6px #fff;
            box-shadow: 0 0 6px #fff;
        }

        .order_list:hover {
            opacity: 0.6;
            color: white;
            background-color: #FF007F;
        }

        .ticket_title {
            font-family: 'Shadows Into Light', cursive;
            font-weight: bold;
        }

        .ticket_info {
            display: flex;
            flex-direction: column;
            justify-content: flex-end;

            font-family: 'Barlow', sans-serif;
            font-weight: bold;
        }

        @media screen and (min-width: 1200px) {
            .order_list {
                width: 700px;
                height: 80px;
                border-radius: 12px;
                padding: 12px;
            }

            .ticket_title {
                font-size: 40px;
                line-height: 40px;
            }

            .ticket_info {
                font-size: 18px;
                line-height: 28px;
            }
        }

        @media screen and (min-width: 1000px) and (max-width: 1199px) {
            .order_list {
                width: 600px;
                height: 75px;
                border-radius: 10px;
                padding: 10px;
            }

            .ticket_title {
                font-size: 38px;
                line-height: 38px;
            }

            .ticket_info {
                font-size: 16px;
                line-height: 26px;
            }
        }

        @media screen and (min-width: 800px) and (max-width: 999px) {
            .order_list {
                width: 440px;
                height: 67px;
                border-radius: 8px;
                padding: 8px;
            }

            .ticket_title {
                font-size: 35px;
                line-height: 35px;
            }

            .ticket_info {
                font-size: 13px;
                line-height: 20px;
            }
        }

        @media screen and (min-width: 600px) and (max-width: 799px) {
            .order_list {
                width: 360px;
                height: 60px;
                border-radius: 6px;
                padding: 6px;
            }

            .ticket_title {
                font-size: 30px;
                line-height: 30px;
            }

            .ticket_info {
                font-size: 10px;
                line-height: 18px;
            }
        }

        @media screen and (max-width: 599px) {
            .order_list {
                width: 300px;
                height: 43px;
                border-radius: 5px;
                padding: 5px;
            }

            .ticket_title {
                font-size: 22px;
                line-height: 28px;
            }

            .ticket_info {
                font-size: 8px;
                line-height: 15px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="bgi">
    <div class="container">
        <%
            for (int i = 0; i < 7; i++) {
                out.println("<div class=\"order_list\" onclick=\"location.href='seatView.jsp?date="
                        + sdf.format(cal.getTime()).replace(" / ", "") + "'\">");
                out.println("<div class=\"ticket_title\">THE PANDEMIC</div>");
                out.println("<div class=\"ticket_info\">");
                out.println("<div>" + (100 - arr[i]) + " / 100 Avail.</div>");
                out.println("<div>" + sdf.format(cal.getTime()) + "</div>");
                out.println("</div>");
                out.println("</div>");
                cal.add(Calendar.DATE, -1);
            }
        %>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>