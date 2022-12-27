<%@ page import="org.json.JSONObject"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page contentType="application/json;charset=UTF-8" %>
<%@include file="../common.util.jsp"%>
<%@include file="../common.conn.jsp"%>
<%--<%--%>
<%--  JSONObject payload = payload_toJSONObject(request);--%>
<%--  int index = payload.optInt("index");--%>
<%--  System.out.println("index = " + index);--%>
<%--  String uid = payload.optString("uid");--%>
<%--  System.out.println("uid = " + uid);--%>

<%--  JSONArray array = (JSONArray) session.getAttribute(uid);--%>
<%--  JSONObject item = array.getJSONObject(index);--%>
<%--  String IP = item.getString("IP");--%>
<%--  String APPID = item.getString("APPID");--%>
<%--  try (Connection conn = getDataSource("jdbc/test73870").getConnection()){--%>
<%--    int del=del(conn,IP,APPID);--%>
<%--    System.out.println("del = " + del);--%>
<%--  }catch(Exception e){--%>
<%--    System.out.println("e = " + e);--%>
<%--    throw e;--%>
<%--  }--%>
<%--%>--%>
<%--<%!--%>
<%--  int del(Connection conn, String IP ,String APPID) throws SQLException{--%>
<%--    int updateCount = 0;--%>
<%--    try (PreparedStatement pstmt = conn.prepareStatement(--%>
<%--      "delete from CLOUD_IP_LIST " +--%>
<%--       "where IP = ? and APPID = ? "))--%>
<%--      {--%>
<%--        pstmt.setString(1,IP);--%>
<%--        pstmt.setString(2,APPID);--%>
<%--        updateCount = pstmt.executeUpdate();--%>
<%--      }--%>
<%--    return  updateCount;--%>
<%--  }--%>
<%--%>--%>


<%!
    int del(Connection conn , String IP, String APPID) throws SQLException{
      String sql = "delete CLOUD_IP_LIST " + "where IP = ? and APPID = ? ";
      int updateCount = 0;
      try(PreparedStatement pstmt = conn.prepareStatement(sql)){

        pstmt.setString(1,IP);
        pstmt.setString(2,APPID);
        updateCount = pstmt.executeUpdate();
      }
      return updateCount;


    }

%>

<%
  JSONObject payload = payload_toJSONObject(request);
  int index = payload.optInt("index");
  System.out.println("index = " + index);
  String uid = payload.optString("uid");
  System.out.println("uid = " + uid);

  JSONArray array = (JSONArray) session.getAttribute(uid);
  JSONObject item = array.getJSONObject(index);
  String IP = item.getString("IP");
  String APPID = item.getString("APPID");
  try(Connection conn = getDataSource("jdbc/test73870").getConnection()){
  int del=del(conn,IP,APPID);
    System.out.println("del = " + del);

  }catch (Exception e){
    System.out.println("e = " + e);
    throw e;
  }


%>

