<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jsp.vo.PostVo" %>
<%@ page import="jsp.dao.PostDao" %>
<%@ page import="java.sql.SQLException" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");

    String nextUrl = "review.jsp";
    boolean process = false;

    int id = (Integer)session.getAttribute("id");
    String name = session.getAttribute("name").toString();
    String review = request.getParameter("contents");

    try {
        process = new PostDao().insertReview(new PostVo(0, id, name, review, null, 0));
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }

    response.sendRedirect("../loading.jsp?nextUrl=" + nextUrl + "&process=" + process);
%>