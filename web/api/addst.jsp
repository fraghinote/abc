<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@page import="org.json.*" %>
<%@ page contentType="application/json;charset=UTF-8" %>
<%@include file="../common.conn.jsp"%>
<%@include file="../common.util.jsp"%>
<%!

class Test73870{
 boolean addTask(Connection conn,JSONObject data) throws SQLException{
  boolean isSuccess = false;
  String sql = "INSERT INTO CLOUD_IP_LIST ( IP, NAME, APPID) values ( ?, ?, ?)";
    try (PreparedStatement pstmt = conn.prepareStatement(sql)){

      short p=1;
      pstmt.setString(p++, data.optString("IP"));
      pstmt.setString(p++, data.optString("NAME"));
      pstmt.setString(p++, data.optString("APPID"));


      isSuccess = (pstmt.executeUpdate() == 1) ;

    }catch (Exception e){
      System.out.println("e = " + e);
    }
    return isSuccess;
  }
}
%>
<%

  boolean addTask = false;
  try(Connection connection =getDataSource("jdbc/test73870").getConnection()){
 JSONObject payloadData = payload_toJSONObject( request);
    JSONObject data  = new JSONObject();
    data.put("IP",payloadData.optString("IP"));
    data.put("NAME",payloadData.optString("NAME"));
    data.put("APPID",payloadData.optString("APPID"));

    addTask =new Test73870().addTask(connection,data);

  }
  out.print(addTask);
%>
