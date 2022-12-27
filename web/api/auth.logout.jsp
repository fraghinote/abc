<%@ page import="org.json.JSONObject"%><%@ page contentType="application/json; charset=utf-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<%@include file="common.conn.jsp"%>
<%
session.removeAttribute("cycu2000_11.surveyUser");
session.removeAttribute("User_id");
response.sendRedirect("../spa/");
%>
