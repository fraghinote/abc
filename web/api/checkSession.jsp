<%@ page import="org.json.JSONObject" %>
<%@page pageEncoding="UTF-8"%>
<%

String  isLoginSuccess = (String)session.getAttribute("isLoginSuccess");
    JSONObject map = new JSONObject();
if("true".equals(isLoginSuccess)){
    map.put("isOK","Y");
}
out.print(map);
%>
