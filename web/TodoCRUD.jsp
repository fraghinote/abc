<%@ page import="org.apache.commons.lang.exception.ExceptionUtils" %>
<%@ page import="java.util.UUID" %>
<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ page pageEncoding="UTF-8"%>
<%@include file="common.conn.jsp"%>
<%@include file="common.util.jsp"%>
<%@include file="_ST_CLOUD_IP_LIST.jsp"%>
<% %>
<%= "asdasdsdd"%>
<%
  out.clear();
  response.setContentType("application/json");
  response.setCharacterEncoding("UTF-8");
  String method = request.getParameter("method");

  try {
    Thread.sleep(1000);
    ST_CLOUD_IP_LIST ipList = new ST_CLOUD_IP_LIST();
    if("query".equals(method)){
      try (Connection conn = getDataSource("jdbc/st").getConnection()) {
        JSONArray array = ipList.getList(conn);
        JSONObject result=new JSONObject();
        result.put("d_Message_C", "執行成功");
        result.put("d_Message", "");
        result.put("done_YN", "Y");
        result.put("value", array);
        out.print(result);
      }
    }else if("add".equals(method)){
      JSONObject payloadData = payload_toJSONObject((ServletRequest) request);
      System.out.println("method = " + method);
      System.out.println("payloadData = " + payloadData);
      try(Connection connection = getDataSource("jdbc/st").getConnection()){
        JSONObject item = ipList.add(connection,payloadData);
        JSONObject result=new JSONObject();
        result.put("d_Message_C", "執行成功");
        result.put("d_Message", "");
        result.put("done_YN", "Y");
        result.put("value", item);
        out.print(result);
      }

    }else if("modify".equals(method)){
      JSONObject payloadData = payload_toJSONObject((ServletRequest) request);
      System.out.println("method = " + method);
      System.out.println("payloadData = " + payloadData);
      try(Connection conn = getDataSource("jdbc/st").getConnection()){
        String oldIP = payloadData.optString("oldIP");
        String oldAPPID = payloadData.optString("oldAPPID");
        String IP = payloadData.optString("IP");
        String APPID = payloadData.optString("APPID");
        int updateCount = ipList.modify(conn,oldIP,oldAPPID,payloadData);
        JSONObject result=new JSONObject();
        if(updateCount>0){
          result.put("d_Message_C", "執行成功");
          result.put("done_YN", "Y");
          result.put("value", ipList.item(conn,IP,APPID));
        }else{
          result.put("d_Message_C", "執行失敗");
          result.put("done_YN", "N");
          result.put("value", "updateCount == 0");
        }
        out.print(result);
      }
    }else if("delete".equals(method)){
      JSONObject payloadData = payload_toJSONObject((ServletRequest) request);
      System.out.println("method = " + method);
      System.out.println("payloadData = " + payloadData);
      try(Connection connection = getDataSource("jdbc/st").getConnection()){
        String IP = payloadData.optString("IP");
        String APPID = payloadData.optString("APPID");
        int updateCount = ipList.del(connection,IP,APPID);
        JSONObject result=new JSONObject();
        if(updateCount>0){
          result.put("d_Message_C", "執行成功");
          result.put("done_YN", "Y");
          result.put("value", payloadData);
        }else {
          result.put("d_Message_C", "執行失敗");
          result.put("done_YN", "N");
          result.put("value", "updateCount == 0" + payloadData);
        }
        out.print(result);

      }
    }else{
      JSONObject result=new JSONObject();
      result.put("d_Message_C", "執行錯誤。");
      result.put("d_Message", " empty method  ");
      result.put("done_YN", "N");
      out.print(result);
    }
  }catch (Exception e){
    String s = ExceptionUtils.getStackTrace(e);
    JSONObject result=new JSONObject();
    result.put("d_Message_C", "執行錯誤。");
    result.put("d_Message", s);
    result.put("done_YN", "N");
    out.print(result);
  }
%>
