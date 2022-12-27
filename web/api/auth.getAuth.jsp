<%@ page contentType="application/json; charset=utf-8" %>
<%@page pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.util.HashMap" %>
<%@include file="common.HttpUtility.jsp" %>
<%@include file="common.conn.jsp" %>
<%@include file="common.util.jsp" %>
<%
  String sessionId = request.getParameter("sessionId");
  String seq  = request.getParameter("seq");
  String User_id = request.getParameter("User_id");
  String pathname = request.getParameter("pathname");
  String returnRoute = request.getParameter("returnRoute");

pathname = "/spa/";
returnRoute = "/";

//
//out.println("sessionId="+sessionId);
//out.println("seq="+seq);
//out.println("User_id="+User_id);
//out.println("pathname="+pathname);
//out.println("returnRoute="+returnRoute);

  String requestURL = "";


  requestURL = "https://itouch.cycu.edu.tw/active_system/login/sso/login3.jsp";  //去itouch驗證

  try {
    HashMap params = new HashMap();
    params.put("sessionId", sessionId);
    params.put("seq",seq);
    params.put("User_id", User_id);

    HttpUtility.sendPostRequest(requestURL, params);
    String[] responseString = HttpUtility.readMultipleLinesRespone();

    String lines="";
    for (String line : responseString) {
      lines += line;
    }
    System.out.println("lines = " + lines);

    if(lines.trim().startsWith("OK:")){ //登入成功  //trim刪除開頭空白
      HashMap surveyUser = new HashMap();    //初始化使用者基本資料
      surveyUser.put("surveyUserid", User_id);
      session.setAttribute("cycu2000_11.surveyUser",surveyUser);
      System.out.println("surveyUser1213133 = " + surveyUser);
      response.sendRedirect(pathname+"#"+returnRoute);
    }else{
      //System.out.println("登入失敗");
      returnRoute = "login/error";
      response.sendRedirect(pathname+"#"+returnRoute);
    }
  }finally{
    HttpUtility.disconnect();
  }
%>
