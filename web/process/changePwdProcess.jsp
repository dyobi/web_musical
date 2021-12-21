<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jsp.dao.UserDao" %>
<%@ page import="java.sql.SQLException" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");

    int id = (Integer)session.getAttribute("id");
    String pwd1 = request.getParameter("pwd1");
    String pwd2 = request.getParameter("pwd2");

    boolean res = false;

    String nextUrl;
    boolean process;

    if (pwd1.equals(pwd2)) {
        try {
            res = new UserDao().updatePwd(id, pwd1);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    if (res) process = true;
    else process = false;
    nextUrl = "mypage.jsp";

    response.sendRedirect("../loading.jsp?nextUrl=" + nextUrl + "&process=" + process);
%>
