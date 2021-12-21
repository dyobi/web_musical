<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jsp.dao.PostDao" %>
<%@ page import="jsp.vo.PostVo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%
    ArrayList<PostVo> list = null;
    try {
        list = new PostDao().getAllReviews();
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
        @import url('https://fonts.googleapis.com/css2?family=Shadows+Into+Light&display=swap');

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
            top: 24%;
            left: 10%;
            position: absolute;
            margin-bottom: 200px;
            width: 80%;

            color: white;

            font-family: 'Barlow', sans-serif;
            font-weight: 200;
        }

        table {
            border-collapse: collapse;
        }

        th {
            font-weight: 400;
        }

        tr {
            border-bottom: 1px dashed white;
        }

        .center_position {
            text-align: center;
        }

        .review_overflow {
            padding-left: 2%;
            display: block;
            white-space: nowrap;
            word-wrap: normal;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        a, a:visited {
            color: white;
            text-decoration: none;

            transition: opacity, color 0.1s ease-in;
        }

        a:hover {
            opacity: 0.6;
            color: #FF007F;
        }

        button {
            right: 0;
            position: absolute;

            margin: 10px;
            width: 70px;
            height: 30px;
            border-radius: 10px;
            border: 0 none;

            background-color: #5E5D63;
            color: white;
            font-size: 16px;
            font-weight: 100;
            cursor: pointer;

            transition: opacity, color 0.1s ease-in;
        }

        button:hover {
            opacity: 0.6;
            color: #FF007F;
        }

        @media screen and (min-width: 1100px) {
            .container .review_overflow {
                font-size: 18px;
                line-height: 36px;
            }
            .review_overflow {
                max-width: 700px;
            }
        }

        @media screen and (min-width: 1000px) and (max-width: 1199px) {
            .container .review_overflow {
                font-size: 14px;
                line-height: 28px;
            }
            .review_overflow {
                max-width: 500px;
            }
        }

        @media screen and (min-width: 800px) and (max-width: 999px) {
            .container .review_overflow {
                font-size: 14px;
                line-height: 28px;
            }
            .review_overflow {
                max-width: 400px;
            }
        }

        @media screen and (min-width: 700px) and (max-width: 799px) {
            .container .review_overflow {
                font-size: 12px;
                line-height: 24px;
            }
            .review_overflow {
                max-width: 360px;
            }
        }

        @media screen and (max-width: 699px) {
            .container .review_overflow {
                font-size: 12px;
                line-height: 24px;
            }
            .review_overflow {
                max-width: 280px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="bgi">
    <div class="container">
        <table width="100%">
            <tr>
                <th width="8%">No.</th>
                <th width="36%">Title</th>
                <th width="22%">Author</th>
                <th width="26%">Date</th>
                <th width="8%">Views</th>
            </tr>
            <%
                assert list != null;
                for (int i = list.size() - 1; i >= 0 ; i--) {
                    out.println("<tr>");
                    out.println("<td class=\"center_position\">" + (i+1) + "</td>");
                    out.println("<td class=\"review_overflow\"><a href=\"reviewView.jsp?p_id=" + list.get(i).getPost_id() + "&no=" + (i+1) + "\">" + list.get(i).getReview() + "</a></td>");
                    out.println("<td class=\"center_position\">" + list.get(i).getMem_name() + "</td>");
                    out.println("<td class=\"center_position\">" + list.get(i).getDate() + "</td>");
                    out.println("<td class=\"center_position\">" + list.get(i).getViews() + "</td>");
                    out.println("</tr>");
                }
            %>
        </table>
        <%
            if (session.getAttribute("id") !=null) {
                out.println("<button><a href=\"reviewAdd.jsp\">ADD +</a></button>");
            } else {
                out.println("<button><a href=\"login.jsp\">ADD +</a></button>");
            }
        %>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>