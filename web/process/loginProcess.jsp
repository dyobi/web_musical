<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jsp.dao.UserDao" %>
<%@ page import="jsp.vo.UserVo" %>
<%@ page import="java.sql.SQLException" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");

    String email = request.getParameter("email").toLowerCase();
    String pwd = request.getParameter("pwd");

    UserVo res = new UserVo();

    String nextUrl;
    boolean process;

    try {
        res = new UserDao().selectUser(email, pwd);
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }

    if (res == null) {
        nextUrl = "login.jsp";
        process = false;
    } else {
        session.setAttribute("id", res.getId());;
        session.setAttribute("email", res.getEmail());
        session.setAttribute("name", res.getName());
        session.setAttribute("tel", res.getTel());

        nextUrl = "index.jsp";
        process = true;
    }
    response.sendRedirect("../loading.jsp?nextUrl=" + nextUrl + "&process=" + process);
%>