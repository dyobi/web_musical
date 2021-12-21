<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jsp.dao.OrderDao" %>
<%@ page import="jsp.vo.OrderVo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%
    ArrayList<OrderVo> list = null;

    if (session.getAttribute("id") == null) {
        response.sendRedirect("loading.jsp?nextUrl=login.jsp&process=false");
    } else {
        int id = (Integer)session.getAttribute("id");

        try {
            list = new OrderDao().getMyOrder(id);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
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
            padding-top: 120px;
            margin-bottom: 200px;

            display: flex;
            flex-direction: column;
            align-items: center;

            color: white;

            font-family: 'Barlow', sans-serif;
            font-weight: 200;
            font-size: 18px;
            line-height: 30px;
        }

        table {
            border-collapse: collapse;
        }

        th {
            font-weight: 400;
        }

        tr {
            border-bottom: 1px dashed white;
            text-align: center;
        }

        button {
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
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="bgi">
    <div class="container">
        <div style="width: 800px">
            <table width="800px">
                <tr>
                    <th width="18%">Purchase ID</th>
                    <th width="18%">Name</th>
                    <th width="10%">Seat No.</th>
                    <th width="31%">Performance Date</th>
                    <th width="31%">Purchase Date</th>
                </tr>
                <%
                    assert list != null;
                    for (int i = 0; i < list.size(); i++) {
                        out.println("<tr>");
                        out.println("<td>" + list.get(i).getBuy_id() + "</td>");
                        out.println("<td>" + list.get(i).getName() + "</td>");
                        out.println("<td>" + list.get(i).getSeat_num() + "</td>");
                        out.println("<td>" + list.get(i).getP_date() + "</td>");
                        out.println("<td>" + list.get(i).getBuy_date() + "</td>");
                        out.println("</tr>");
                    }
                %>
            </table>
            <button onclick="location.href='mypage.jsp'">BACK</button>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>