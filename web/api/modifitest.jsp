<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="java.sql.SQLException"%>
<%@ page contentType="application/json;charset=UTF-8" %>
<%@include file="../common.conn.jsp"%>
<%@include file="../common.util.jsp"%>
<%!


class Test73870{
  boolean modify(Connection conn,JSONObject data,String oldIP,String oldAPPID) throws SQLException  {
    String sql = "Update CLOUD_IP_LIST SET IP= ?, NAME=?, APPID=?   where IP=? and APPID =? ";
    boolean isSuccess = false;
    try (PreparedStatement pstmt = conn.prepareStatement(sql)){

      int t=1;
      pstmt.setString(t++, data.getString("IP"));
      pstmt.setString(t++, data.optString("NAME"));
      pstmt.setString(t++, data.optString("APPID"));
      pstmt.setString(t++, oldIP);
      pstmt.setString(t++,oldAPPID);

      isSuccess = (pstmt.executeUpdate() == 1) ;

    }

    return isSuccess;
  }
}
%>
<%

JSONObject payloadData = payload_toJSONObject( request);
System.out.println("modifi payloadData = " + payloadData);
JSONObject data  = new JSONObject();
data.put("IP",payloadData.optString("modifiip"));
data.put("NAME",payloadData.optString("modifiip"));
data.put("APPID",payloadData.optString("modifiip"));
String oldIP = payloadData.getJSONObject("selectedItem").getString("IP");
System.out.println("oldIP = " + oldIP);
String oldAPPID = payloadData.getJSONObject("selectedItem").getString("APPID");
System.out.println("oldAPPID = " + oldAPPID);

  try(Connection connection =getDataSource("jdbc/test73870").getConnection()){

  new Test73870().modify(connection,data,oldIP,oldAPPID);

  }

%>

