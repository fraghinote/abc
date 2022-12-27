<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.HashMap"%>
<%@ page contentType="application/json;charset=UTF-8" %>
<%@include file="../common.util.jsp"%>
<%@include file="../common.conn.jsp"%>
<%
    JSONObject payLoad = payload_toJSONObject(request);
    System.out.println("payLoad = " + payLoad);
    HashMap item = null;
    try(Connection conn = getDataSource("jdbc/test73870").getConnection()){

        JSONObject shops1 = payLoad.getJSONObject("shops1");
        System.out.println("shops1 = " + shops1);
        String value = shops1.getString("value");
        System.out.println("value = " + value);
        String initialValue = shops1.getString("initialValue");
        System.out.println("initialValue = " + initialValue);

        String newvalue = value;
        String newinitialValue = initialValue;
        Long id = shops1.getLong("id");
        System.out.println("id = " + id);
        boolean result = saveSHOP(conn, id, newvalue,newinitialValue);
        JSONObject msg = new JSONObject();

        if(value !=null){
            msg.put("isOK", "Y");
            item = getshop1(conn,id);
            msg.put("shop1",item);

        }
        out.println(msg);


    }
%>

<%!
    boolean saveSHOP(Connection conn , Long ID , String value , String initialValue) throws SQLException{
        String sql = "UPDATE SHOPS SET SHOP = ? WHERE ID = ?";
        try(PreparedStatement pstmt = conn.prepareStatement(sql)){
            boolean isSuccess = false;
            int a=1;
            pstmt.setString(a++, value);
            pstmt.setLong(a++, ID);
            isSuccess = (pstmt.executeUpdate() == 1);

            return isSuccess;
        }
    }

    HashMap getshop1(Connection conn, Long ID) throws SQLException{
        HashMap item = new HashMap();
        String sql1 = "SELECT SHOPS.ID, SHOPS.SHOP FROM SHOPS WHERE SHOPS.ID = ? ";
        try(PreparedStatement pstmt1 = conn.prepareStatement(sql1)){
            int a=1;
            pstmt1.setLong(a++, ID);
            ResultSet rs = pstmt1.executeQuery();
            while (rs.next()){
                a=a+1;
                item.put("INNDEX", a);
                item.put("ID", rs.getLong("ID"));
                item.put("SHOP", rs.getLong("SHOP"));
            }
        }
        return item;
    }



%>

