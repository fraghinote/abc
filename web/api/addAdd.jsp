<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@page import="org.json.*" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.LocalDateTime"%><%@ page import="java.util.HashMap"%>
<%@ page contentType="application/json;charset=UTF-8" %>
<%@include file="../common.conn.jsp"%>
<%@include file="../common.util.jsp"%>
<%!
class Test73870{

  boolean onItemClick(Connection conn, JSONObject data) throws SQLException{
    boolean isSuccess = false;
    String sql = ("INSERT INTO CONSUMERS(ID) values (?)");
    try(PreparedStatement pstmt = conn.prepareStatement(sql)){

      int t=1;
      pstmt.setString(t++ , data.optString("ID"));
      isSuccess = (pstmt.executeUpdate() == 1 );

    }catch (Exception e){
    System.out.println("sql = " + sql);
    }
   return isSuccess;
  }

  HashMap addCONSUMPTIONS(Connection conn,String CONSUMER_ID,String PRODUCT_ID) throws SQLException{
      HashMap item = new  HashMap();


    String sql = ("INSERT INTO CONSUMPTIONS(ID,CONSUMER_ID,PRODUCT_ID,DAY) " +
     "           values ( ? , ?,?,?) ");

    try(PreparedStatement pstmt = conn.prepareStatement(sql)){
      long tempseq = getCONSUMPTION_SQ(conn);
      java.sql.Timestamp DAY = java.sql.Timestamp.valueOf(LocalDateTime.now());  //紀錄目前填寫時間
      int t=1;
      pstmt.setLong(t++ , tempseq);
      pstmt.setString(t++ , CONSUMER_ID);
      pstmt.setString(t++ , PRODUCT_ID);
      pstmt.setTimestamp(t++,DAY);
      if( pstmt.executeUpdate() == 1 ){
        System.out.println("tempseq = " + tempseq);
        item = getCONSUMPTIONS_VIEW_BY_CONSUMPTION_ID(conn,tempseq);
      }
    }
   return item;
  }


}
%>
<%
  String addConsumptions = request.getParameter("addConsumptions");

  if(addConsumptions != null ){

    JSONObject msg = new JSONObject();
    msg.put("isOK","N");
    try(Connection connection =getDataSource("jdbc/test73870").getConnection()){
      JSONObject payloadData = payload_toJSONObject( request);
        String  CONSUMER_ID = payloadData.optString("CONSUMER_ID");
        String PRODUCT_ID = payloadData.optString("PRODUCT_ID");
        HashMap map = new Test73870().addCONSUMPTIONS(connection,CONSUMER_ID,PRODUCT_ID);
        System.out.println("map = " + map);
        if(map.get("CONSUMPTIONS_ID")!=null){
          msg.put("isOK","Y");
          msg.put("map",map);

        }
    }
    out.println(msg);

  }else{
    boolean onItemClick = false;
    try(Connection connection =getDataSource("jdbc/test73870").getConnection()){
   JSONObject payloadData = payload_toJSONObject( request);
      JSONObject data  = new JSONObject();
      data.put("ID",payloadData.optString("ID"));


      onItemClick =new Test73870().onItemClick(connection,data);

    }
    out.print(onItemClick);
  }
%>




