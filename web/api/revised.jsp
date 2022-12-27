<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.HashMap"%>
<%@ page contentType="application/json;charset=UTF-8" %>
<%@include file="../common.util.jsp"%>
<%@include file="../common.conn.jsp"%>

<%
JSONObject payload = payload_toJSONObject(request);


HashMap item =null;
try(Connection conn = getDataSource("jdbc/test73870").getConnection()){
    JSONObject data = new JSONObject();
    JSONObject selectedRecord  = payload.getJSONObject("selectedRecord");
    JSONObject modify =payload.getJSONObject("modify");

    long CONSUMPTIONS_ID = selectedRecord.getLong("CONSUMPTIONS_ID");
    String oldPRODUCT_ID = selectedRecord.getString("PRODUCT_ID");
    String newPRODUCT_ID = modify.getString("ID");

    boolean result = modify  (conn, CONSUMPTIONS_ID, oldPRODUCT_ID, newPRODUCT_ID);
    JSONObject msg = new JSONObject();
    if( modify != null){
        msg.put("isOK", "Y");

        item = getCONSUMPTIONS_VIEW_BY_CONSUMPTION_ID(conn,CONSUMPTIONS_ID);
        msg.put("map",item);
//        {ITEM: '蛋餅', ID: '5', PRICE: '5', SHOP_ID: 3, label: '5.蛋餅'}

    }
    out.println(msg);




}


%>
<%!

    boolean modify(Connection conn,  long CONSUMPTIONS_ID, String oldPRODUCT_ID, String newPRODUCT_ID) throws SQLException{

        System.out.println("CONSUMPTIONS_ID = " + CONSUMPTIONS_ID);
        System.out.println("oldPRODUCT_ID = " + oldPRODUCT_ID);
        System.out.println("newPRODUCT_ID = " + newPRODUCT_ID);

        String sql = "UPDATE CONSUMPTIONS SET PRODUCT_ID = ? WHERE ID = ? ";
        try(PreparedStatement pstmt = conn.prepareStatement(sql)){
            boolean isSuccess = false;
            int a=1;
            pstmt.setString(a++, newPRODUCT_ID);
            pstmt.setLong(a++, CONSUMPTIONS_ID);
            isSuccess = (pstmt.executeUpdate() == 1);

            return isSuccess;
        }
    }

%>

