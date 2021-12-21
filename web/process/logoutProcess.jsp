<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String nextUrl = "index.jsp";

    session.invalidate();

    response.sendRedirect("../loading.jsp?nextUrl=" + nextUrl + "&process=true");
%>
