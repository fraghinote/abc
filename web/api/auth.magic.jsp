<%@ page contentType="application/json; charset=utf-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.util.HashMap" %>
<%@include file="common.HttpUtility.jsp" %>
<%@include file="common.conn.jsp" %>
<%@include file="common.util.jsp" %>
<%
JSONObject payloadData = payload_toJSONObject(request);
String magicUserid = payloadData.optString("magicUserid");
String magicYearTerm = payloadData.optString("magicYearTerm");

  HashMap surveyUser = (HashMap)session.getAttribute("cycu2000_11.surveyUser");
  Boolean isAdmin = false;

  isAdmin = surveyUser.get("isAdmin")!=null ? (Boolean)surveyUser.get("isAdmin") : false;
  if(magicUserid == null || !isAdmin ) {
    JSONObject msg = new JSONObject();
    msg.put("done_YN","M");
    msg.put("value","請先用管理者身分登入");
    out.print(msg.toString());
    return;
  }

  if(magicUserid!=null){
    surveyUser.put("magicUserid",magicUserid);
  }
  if (magicYearTerm!=null){
    surveyUser.put("magicYearTerm",magicYearTerm);
  }

  JSONObject msg = new JSONObject();
  msg.put("done_YN","Y");
  out.print(msg.toString());
%>
