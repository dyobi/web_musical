<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jsp.dao.UserDao" %>
<%@ page import="jsp.vo.UserVo" %>
<%@ page import="java.sql.SQLException" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");

    int id = (Integer)session.getAttribute("id");
    String name = request.getParameter("name").toUpperCase();
    String tel = request.getParameter("tel");

    boolean res = false;

    String nextUrl;
    boolean process;

    try {
        res = new UserDao().updateInfo(new UserVo(id, null, name, null, tel));
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }

    if (res) {
        session.setAttribute("name", name);
        session.setAttribute("tel", tel);
        process = true;
    } else process = false;
    nextUrl = "mypage.jsp";

    response.sendRedirect("../loading.jsp?nextUrl=" + nextUrl + "&process=" + process);
%>
