<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.HashMap"%>
<%@ page contentType="application/json;charset=UTF-8" %>
<%@include file="../common.util.jsp"%>
<%@include file="../common.conn.jsp"%>
<%
  JSONObject payload = payload_toJSONObject(request);
  String CONSUMPTIONS_ID = payload.getString("CONSUMPTIONS_ID");
  System.out.println("CONSUMPTIONS_ID = " + CONSUMPTIONS_ID);
  String CONSUMERS_ID = payload.getString("CONSUMERS_ID");
  System.out.println("CONSUMERS_ID = " + CONSUMERS_ID);
  try(Connection conn = getDataSource("jdbc/test73870").getConnection()){
    //conn=getDataSource("jdbc/test73870").getConnection()
    int del = del(conn,CONSUMPTIONS_ID,CONSUMERS_ID);
    //為了簡化conn變數寫一大串資料在其他行，int裡則是用conn代替一大串資料
    JSONObject msg = new JSONObject();

    if(del == 1){
      msg.put("isOK", "Y");
    }
    out.println(msg);
  }

%>

<%!
  int del(Connection conn , String CONSUMPTIONS_ID, String CONSUMERS_ID) throws SQLException{
    String sql = "delete from CONSUMPTIONS where ID = ? and CONSUMER_ID = ? ";
    int updateCount = 0;
    try(PreparedStatement pstmt = conn.prepareStatement(sql)){
      pstmt.setString(1,CONSUMPTIONS_ID);
      pstmt.setString(2,CONSUMERS_ID);
      updateCount = pstmt.executeUpdate();
    }

    return  updateCount;
  }

%>


