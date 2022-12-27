<%@ page contentType="application/json; charset=utf-8" %>
<%@page pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.util.HashMap" %>
<%@include file="common.HttpUtility.jsp" %>
<%@include file="common.conn.jsp" %>
<%@include file="common.util.jsp" %>
<%

  String UserNm = request.getParameter("UserNm");
  System.out.println("UserNm = " + UserNm);
  String UserPasswd = request.getParameter("UserPasswd");
  System.out.println("UserPasswd = " + UserPasswd);

  String pathname = "/spa/";
  String returnRoute = "/";


  out.println("UserNm="+UserNm);
  out.println("UserPasswd="+UserPasswd);


    if( UserNm != null ){ //登入成功
      HashMap surveyUser = new HashMap();   //初始化使用者基本資料
      surveyUser.put("surveyUserid", UserNm);
      session.setAttribute("cycu2000_11.surveyUser",surveyUser);

      response.sendRedirect(pathname+"#"+returnRoute); //sendRedirect轉址

    }else{
      //System.out.println("登入失敗");
      returnRoute = "login/error";
      response.sendRedirect(pathname+"#"+returnRoute);
    }

//
//  String requestURL = "";
//
//
//  requestURL = "https://itouch.cycu.edu.tw/active_system/login/sso/login3.jsp";
//
//  try {
//    HashMap params = new HashMap();
//    params.put("User_id", User_id);
//    params.put("password", password);
//
//    HttpUtility.sendPostRequest(requestURL, params);
//    String[] responseString = HttpUtility.readMultipleLinesRespone();
//
//    String lines="";
//    for (String line : responseString) {
//      lines += line;
//    }
//    System.out.println("lines = " + lines);
//
//    if(lines.trim().startsWith("OK:")){ //登入成功
//      HashMap surveyUser = new HashMap();    //初始化使用者基本資料
//      surveyUser.put("surveyUserid", User_id);
//      session.setAttribute("cycu2000_11.surveyUser",surveyUser);
//      response.sendRedirect(pathname+"#"+returnRoute);
//    }else{
//      //System.out.println("登入失敗");
//      returnRoute = "login/error";
//      response.sendRedirect(pathname+"#"+returnRoute);
//    }
//  }finally{
//    HttpUtility.disconnect();
//  }
%>
