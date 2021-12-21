<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jsp.dao.PostDao" %>
<%@ page import="java.sql.SQLException" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    int p_id = Integer.parseInt(request.getParameter("p_id"));

    String nextUrl = "review.jsp";
    boolean process = false;

    if ((Integer)session.getAttribute("id") == id) {
        try {
            process = new PostDao().deleteReview(p_id);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    response.sendRedirect("../loading.jsp?nextUrl=" + nextUrl + "&process=" + process);
%>