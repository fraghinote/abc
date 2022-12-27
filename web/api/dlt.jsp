<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page contentType="application/json;charset=UTF-8" %>
<%@include file="../common.util.jsp"%>
<%@include file="../common.conn.jsp"%>

<%
    JSONObject payLoad = payload_toJSONObject(request);
    JSONObject shops = payLoad.getJSONObject("shops");

    String ID = shops.getString("ID");
    try(Connection conn = getDataSource("jdbc/test73870").getConnection()){
        int del = del(conn,ID);
        JSONObject msg = new JSONObject();
        if(del == 1){
               msg.put("isOK", "Y");

        }
         out.println(msg);

    }
%>

<%!
    int del(Connection conn,String ID) throws SQLException{
        String sql = "DELETE FROM SHOPS WHERE ID = ? ";
        int updateCount = 0;
        try(PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,ID);
            updateCount = pstmt.executeUpdate();
        }
        return updateCount;
    }




%>
