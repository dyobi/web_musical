<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jsp.dao.PostDao" %>
<%@ page import="jsp.vo.PostVo" %>
<%@ page import="java.sql.SQLException" %>
<%
    int id = Integer.parseInt(request.getParameter("p_id"));
    PostVo postVo = null;

    try {
        postVo = new PostDao().selectReview(id);
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }

    Cookie[] cookies = request.getCookies();
    Cookie viewCookie = null;

    if (cookies != null && cookies.length > 0) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("VIEWCOOKIE")) {
                viewCookie = cookie;
            }
        }
    }

    if (viewCookie == null) {
        Cookie newCookie = new Cookie("VIEWCOOKIE", "|" + id + "|");
        response.addCookie(newCookie);
        try {
            boolean i = new PostDao().increasingViews(id);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    } else {
        String value = viewCookie.getValue();
        if (!value.contains("|" + id + "|")) {
            value += "|" + id + "|";
            viewCookie.setValue(value);
            response.addCookie(viewCookie);

            try {
                boolean i = new PostDao().increasingViews(id);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
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
            padding-top: 100px;
            margin-bottom: 200px;

            display: flex;
            flex-direction: column;
            align-items: center;

            font-family: 'Barlow', sans-serif;
            font-weight: 200;
        }

        .author_info {
            display: flex;
            flex-direction: row;

            color: #C3C2C1;
            margin-bottom: 14px;
            text-align: center;
            font-size: 16px;
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

        .back_link_btn, .back_link {
            margin: 20px;
            width: 80px;
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

        .back_link_btn:hover, .back_link:hover {
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

            .author_info {
                width: 600px;
            }
        }

        @media screen and (min-width: 800px) and (max-width: 999px) {
            .board {
                width: 510px;
                height: 340px;
            }

            .author_info {
                width: 510px;
            }
        }

        @media screen and (min-width: 600px) and (max-width: 799px) {
            .board {
                width: 420px;
                height: 280px;
            }

            .author_info {
                width: 420px;
            }
        }

        @media screen and (min-width: 400px) and (max-width: 599px) {
            .board {
                width: 340px;
                height: 280px;
            }

            .author_info {
                width: 340px;
            }
        }

        @media screen and (max-width: 399px) {
            .board {
                width: 300px;
                height: 280px;
            }

            .author_info {
                width: 300px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<% assert postVo != null; %>
<div id="bgi">
    <div class="container">
        <div class="author_info">
            <div style="width: 25%;">No.<%=request.getParameter("no")%></div>
            <div style="width: 25%;">By. <%=postVo.getMem_name()%></div>
            <div style="width: 25%;"><%=postVo.getDate()%></div>
            <div style="width: 25%;">views <%=postVo.getViews()%></div>
        </div>
        <textarea class="board" readonly onfocus="this.blur()"><%=postVo.getReview()%></textarea>
        <%
            if (session.getAttribute("id") != null && (Integer)session.getAttribute("id") == postVo.getMem_id()) {
                out.println("<div>");
                out.println("<button class=\"back_link_btn\"><a class=\"back_link\" href=\"review.jsp\">BACK</a></button>");
                out.println("<button class=\"back_link_btn\"><a class=\"back_link\" href=\"process/deleteReviewProcess.jsp?p_id="
                        + postVo.getPost_id() + "&id=" + postVo.getMem_id() + "\">DELETE</a></button>");
                out.println("</div>");
            } else {
                out.println("<button class=\"back_link_btn\"><a class=\"back_link\" href=\"review.jsp\">BACK</a></button>");
            }
        %>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>