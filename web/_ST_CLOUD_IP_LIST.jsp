<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.sql.*" %><%
   class ST_CLOUD_IP_LIST {
     //取得CLOUD_IP_LIST清單

     JSONArray getList(Connection conn) throws SQLException {
       JSONArray jsonArray = new JSONArray();
       String sql = "SELECT IP, NAME, APPID, DESTINATION, LIB_VERSION, IS_PRIMARY_APPID, HIT_COUNT, to_char(LAST_HIT,'YYYY-MM-DD') LAST_HIT from st.CLOUD_IP_LIST_TEST";

//               " where IP = ?  ";

       try (PreparedStatement pstmt = conn.prepareStatement(sql);) {
//         pstmt.setString(1 ,"140.135.5.37");
         try (ResultSet rs = pstmt.executeQuery();) {
           while (rs.next()) {
             JSONObject item = new JSONObject();
             item.put("IP", rs.getString("IP"));
             item.put("NAME", rs.getString("NAME"));
             item.put("APPID", rs.getString("APPID"));
             item.put("DESTINATION", rs.getString("DESTINATION"));
             item.put("LIB_VERSION", rs.getString("LIB_VERSION"));
             item.put("IS_PRIMARY_APPID", rs.getString("IS_PRIMARY_APPID"));
             item.put("HIT_COUNT", rs.getString("HIT_COUNT"));
             item.put("LAST_HIT", rs.getString("LAST_HIT"));
             jsonArray.put(item);
           }
         }
       }
       return jsonArray;
     }


     JSONObject add(Connection conn, JSONObject data) throws SQLException {
      String IP = data.optString("IP");
      String APPID = data.optString("APPID");
      String sql =    "INSERT INTO CLOUD_IP_LIST_TEST ( IP, NAME, APPID, DESTINATION, LIB_VERSION, IS_PRIMARY_APPID, HIT_COUNT, LAST_HIT)" +
        "values  (? ,? ,? ,?  ,? ,? ,? ,? ) ");
       try (PreparedStatement pstmt = conn.prepareStatement(    sql     ) {
         short p = 1;
         pstmt.setString(p++, data.optString("IP"));
         pstmt.setString(p++, data.optString("NAME"));
         pstmt.setString(p++, data.optString("APPID"));
         pstmt.setString(p++, data.optString("DESTINATION"));
         pstmt.setString(p++, data.optString("LIB_VERSION"));
         pstmt.setString(p++, data.optString("IS_PRIMARY_APPID"));
         pstmt.setInt(p++, data.optInt("HIT_COUNT",0));
         DateTimeFormatter pattern = DateTimeFormatter.ofPattern("yyyy-MM-dd");
         LocalDate date = LocalDate.parse(data.optString("LAST_HIT",LocalDate.now().toString()),pattern);
         pstmt.setDate(p++, Date.valueOf(date));
         pstmt.execute();
       }
      return item(conn,IP,APPID);

     }
     JSONObject item(Connection conn,String IP,String APPID) throws  SQLException{
       JSONObject item = new JSONObject();
       try (PreparedStatement pstmt = conn.prepareStatement(
         "SELECT IP, NAME, APPID, DESTINATION, LIB_VERSION, IS_PRIMARY_APPID, HIT_COUNT, to_char(LAST_HIT,'YYYY-MM-DD') LAST_HIT from st.CLOUD_IP_LIST_TEST "+
           " where IP = ? and APPID = ? "
       )) {
         pstmt.setString(1,IP);
         pstmt.setString(2,APPID);
         try (ResultSet rs = pstmt.executeQuery();) {
           if (rs.next()) {
             item.put("IP", rs.getString("IP"));
             item.put("NAME", rs.getString("NAME"));
             item.put("APPID", rs.getString("APPID"));
             item.put("DESTINATION", rs.getString("DESTINATION"));
             item.put("LIB_VERSION", rs.getString("LIB_VERSION"));
             item.put("IS_PRIMARY_APPID", rs.getString("IS_PRIMARY_APPID"));
             item.put("HIT_COUNT", rs.getString("HIT_COUNT"));
             item.put("LAST_HIT", rs.getString("LAST_HIT"));
           }
         }
       }
       return  item;
     }

     int modify(Connection conn,String oldIP,String oldAPPID, JSONObject data) throws SQLException {
       String IP = data.optString("IP");
       String APPID = data.optString("APPID");
       int updateCount = 0;
       try (PreparedStatement pstmt = conn.prepareStatement(
         "update CLOUD_IP_LIST_TEST set IP=?, NAME=?, APPID=?, DESTINATION=?, LIB_VERSION=?, IS_PRIMARY_APPID=?, HIT_COUNT=?, LAST_HIT=?" +
           " where IP = ? and APPID = ?  ")
       ) {
         int p = 1;

         pstmt.setString(p++, data.optString("IP"));
         pstmt.setString(p++, data.optString("NAME"));
         pstmt.setString(p++, data.optString("APPID"));
         pstmt.setString(p++, data.optString("DESTINATION"));
         pstmt.setString(p++, data.optString("LIB_VERSION"));
         pstmt.setString(p++, data.optString("IS_PRIMARY_APPID"));
         pstmt.setInt(p++, data.optInt("HIT_COUNT",0));
         DateTimeFormatter pattern = DateTimeFormatter.ofPattern("yyyy-MM-dd");
         LocalDate date = LocalDate.parse(data.optString("LAST_HIT",LocalDate.now().toString()),pattern);
         pstmt.setDate(p++, Date.valueOf(date));
         pstmt.setString(p++, oldIP);
         pstmt.setString(p++, oldAPPID);
         System.out.println("modify3.oldIP = " + oldIP);
         System.out.println("modify3.oldAPPID = " + oldAPPID);
         updateCount = pstmt.executeUpdate();
         System.out.println("modify4.oldIP = " + oldIP);
         System.out.println("modify4.oldAPPID = " + oldAPPID);



       }
       return updateCount;

     }

     int del(Connection conn,String IP, String APPID) throws  SQLException {
        int updateCount = 0;
       try (PreparedStatement pstmt = conn.prepareStatement(
         " delete from CLOUD_IP_LIST_TEST " +
           " where IP = ? and APPID = ?  ")
       ){
         pstmt.setString(1,IP);
         pstmt.setString(2,APPID);

         updateCount = pstmt.executeUpdate();
       }
       return updateCount;
     }
   }
%>
