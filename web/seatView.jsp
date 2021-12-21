<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jsp.dao.OrderDao" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%
    String p_date = request.getParameter("date");

    ArrayList<Integer> list = null;
    try {
        list = new OrderDao().getAvailSeats(p_date);
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="#">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Anton&display=swap');

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
            display: flex;
            flex-direction: row;
            justify-content: center;
            flex-wrap: wrap;
            padding: 100px 80px;
        }

        .front {
            margin: auto;
            width: 60%;
            display: flex;
            flex-direction: column;
            align-items: center;

            color: black;
            font-family: 'Anton', sans-serif;
            font-size: 50px;
            line-height: 48px;
            font-weight: 300;
            background-color: white;
        }

        .movie-container {
            margin: 80px 0px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column
        }

        .row {
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 10px;
        }

        .seat {
            background-color: white;
            height: 30px;
            width: 30px;
            margin: 3px;
            border-radius: 5px;

            font-size: 20px;
            line-height: 30px;
            cursor: pointer;
            text-decoration: none;
            color: black;

            transition: opacity, color 0.2s ease-in;
        }

        .seat:hover {
            opacity: 0.7;
            color: white;
            background-color: #FF007F;
        }

        .seat:nth-of-type(5), .occupied:nth-of-type(5) {
            margin-right: 18px;
        }

        .seat:nth-last-of-type(5), .occupied:nth-last-of-type(5) {
            margin-left: 18px;
        }

        .occupied {
            height: 30px;
            width: 30px;
            margin: 3px;
            border-radius: 5px;

            font-size: 20px;
            line-height: 30px;
            text-decoration: none;
            color: black;

            background-color: #0054FF;
        }

        button {
            position: absolute;
            margin: 20px;
            width: 70px;
            height: 30px;
            border-radius: 10px;
            border: 0 none;

            background-color: #5E5D63;
            color: white;
            font-size: 12px;
            font-weight: 100;
            cursor: pointer;

            transition: opacity, color 0.1s ease-in;
        }

        button:hover {
            opacity: 0.6;
            color: #FF007F;
        }

        @media screen and (min-width: 1000px) {
            .container button {
                right: 10%;
                top: 160px;
            }
        }

        @media screen and (min-width: 800px) and (max-width: 999px) {
            .container button {
                right: 5%;
                top: 130px;
            }
        }

        @media screen and (max-width: 799px) {
            .container button {
                right: 3%;
                top: 100px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="bgi">
    <div class="container">
        <button onclick="location.href='ticket.jsp'">BACK</button>
        <div class="front">STAGE</div>
        <div class="movie-container">
            <%
                for (int i = 0; i < 100; i += 20) {
                    out.println("<div class=\"row\">");
                    for (int j = 1; j <= 20; j++) {
                        if (list != null && list.contains(i+j)) {
                            out.println("<div class=\"occupied\" align=\"center\">" + (i + j) + "</div>");
                        } else {
                            out.println("<div onclick=\"order(" + (i + j) + ")\" class=\"seat\" align=\"center\">" + (i + j) + "</div>");
                        }
                    }
                    out.println("</div>");
                }
            %>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script>
    var IMP = window.IMP;
    IMP.init('imp50087203');

    function requestPay(seat) {
        IMP.request_pay({
            pg: 'kakaopay',
            pay_method: 'kakaopay',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: 'Musical Ticket',
            amount: 100,
            buyer_email: '<%=session.getAttribute("email")%>',
            buyer_name: '<%=session.getAttribute("name")%>',
            buyer_tel: '<%=session.getAttribute("tel")%>',
            buyer_addr: '220 Yampa Way, Fremont, CA',
            buyer_postcode: '94555'
        }, function(res) {
            if (res.success) {
                location.href='process/insertOrderProcess.jsp?p_date=' + '<%=p_date%>' + '&seat=' + seat;
            } else {
                location.href='loading.jsp?nextUrl=seatView.jsp?date=' + '<%=p_date%>' + '&process=false';
            }
        });
    };

    function order(seat) {
        if ('<%=session.getAttribute("id")%>' === "null") {
            location.href='login.jsp';
        } else {
            requestPay(seat);
        }
    };

</script>
</html>