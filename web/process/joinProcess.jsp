<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jsp.dao.UserDao" %>
<%@ page import="jsp.vo.UserVo" %>
<%@ page import="java.sql.SQLException" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");

    String email = request.getParameter("email").toLowerCase();
    String name = request.getParameter("name").toUpperCase();
    String pwd = request.getParameter("pwd1");
    String tel = request.getParameter("tel");

    boolean res = false;

    String nextUrl;
    boolean process;

    try {
        res = new UserDao().insertUser(new UserVo(0, email, name, pwd, tel));
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }

    if (res) {
        nextUrl = "login.jsp";
        process = true;
    } else {
        nextUrl = "mypage.jsp";
        process = false;
    }
    response.sendRedirect("../loading.jsp?nextUrl=" + nextUrl + "&process=" + process);
%>
