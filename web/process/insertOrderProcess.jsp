<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="jsp.dao.OrderDao" %>
<%@ page import="jsp.vo.OrderVo" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");

    String nextUrl = "viewOrder.jsp";
    boolean process = false;

    int id = (Integer)session.getAttribute("id");
    String name = session.getAttribute("name").toString();
    String p_date = request.getParameter("p_date");
    int seat = Integer.parseInt(request.getParameter("seat"));

    try {
        process = new OrderDao().insertOrder(new OrderVo(0, id, name, seat, p_date, ""));
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        nextUrl = "seatView.jsp?date=" + p_date;
    }

    response.sendRedirect("../loading.jsp?nextUrl=" + nextUrl + "&process=" + process);
%>