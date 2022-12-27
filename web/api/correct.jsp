<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.HashMap"%>
<%@ page contentType="application/json;charset=UTF-8" %>
<%@include file="../common.util.jsp"%>
<%@include file="../common.conn.jsp"%>
<%
    JSONObject payload = payload_toJSONObject(request);
    System.out.println("payload = " + payload);

    HashMap item = null;
    try(Connection conn = getDataSource("jdbc/test73870").getConnection()){
        JSONObject shops = payload.getJSONObject("shops");
        String shopname = shops.getString("shopname");
        String shopaddres = shops.getString("shopaddres");


        String newNAME = shopname;
        String newaaddres = shopaddres;
        Long ID = shops.getLong("ID");
        boolean result = correct(conn, ID, newNAME,shopaddres);
        JSONObject msg = new JSONObject();

        if (shopname != null){
            msg.put("isOK", "Y");
            item = getSHOPS(conn,ID);
            msg.put("shops",item);
        }
        out.println(msg);


    }


%>

<%!
    boolean correct(Connection conn, Long ID, String shopname,String shopaddres) throws SQLException{
        String sql = "UPDATE SHOPS SET SHOP = ?, ADDRES = ? WHERE ID = ?";
        try(PreparedStatement pstmt = conn.prepareStatement(sql)){
            boolean isSuccess = false;
            int t=1;
            pstmt.setString(t++, shopname);
            pstmt.setString(t++, shopaddres);
            pstmt.setLong(t++, ID);
            isSuccess = (pstmt.executeUpdate() == 1);

            return isSuccess;
        }

    }

    HashMap getSHOPS(Connection conn, Long ID) throws SQLException{
        HashMap item = new HashMap();
        String sql1 = "SELECT SHOPS.ID, SHOPS.SHOP, SHOPS.ADDRES FROM SHOPS WHERE SHOPS.ID = ? ";
        try(PreparedStatement pstmt1 = conn.prepareStatement(sql1)){
            int t=1;
            pstmt1.setLong(t++, ID);
            ResultSet rs = pstmt1.executeQuery();
            while (rs.next()){
                t=t+1;
                item.put("INDEX", t);
                item.put("ID", rs.getLong("ID"));
                item.put("SHOP", rs.getLong("SHOP"));
                item.put("ADDRES", rs.getLong("ADDRES"));
            }
            return item;
        }



    }




%>


