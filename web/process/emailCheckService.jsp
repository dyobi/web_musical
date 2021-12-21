<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jsp.dao.UserDao" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.PrintWriter" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");

    String email = request.getParameter("email");
    PrintWriter outWriter = response.getWriter();

    boolean res = true;

    if (email != null) {
        try {
            res = new UserDao().checkEmail(email);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    outWriter.write(String.valueOf(res));
%>