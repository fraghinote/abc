<%@ page contentType="application/json;charset=UTF-8" %>
<%@include file="../common.conn.jsp"%>
<%@include file="../common.util.jsp"%>

<%
    JSONObject payloadData = payload_toJSONObject(request);
    System.out.println("payloadData = " + payloadData);
    try(Connection conn = getDataSource("jdbc/test73870").getConnection()){

        JSONObject shops = payloadData.getJSONObject("shops");
        System.out.println("shops = " + shops);

        String shopname = shops.optString("shopname");
        System.out.println("shopname = " + shopname);

        String shopaddres = shops.optString("shopaddres");
        System.out.println("shopaddres = " + shopaddres);


        HashMap item =addshop(conn,shopname,shopaddres);


        JSONObject msg = new JSONObject();
            if(item != null)
            {
                msg.put("isOK","Y");
                msg.put("value",item);

            }else
            {
                 msg.put("isOK","N");
            }

            //取資料


        out.println(msg);



    }

%>
<%!
   HashMap addshop(Connection conn, String shops, String shopaddres) throws SQLException{
       HashMap item = new HashMap();
       boolean isSuccess = false;
       String sql = ("INSERT INTO SHOPS (ID, SHOP, ADDRES) VALUES (?, ?, ?)");
       try(PreparedStatement pstmt = conn.prepareStatement(sql)){
           int s=1;
           long SHOPS_ID = getCONSUMPTION_SQ (conn);
           pstmt.setLong(s++, SHOPS_ID);
           pstmt.setString(s++, shops);
           pstmt.setString(s++, shopaddres);
           if(pstmt.executeUpdate() == 1){

               item = getSHOPS(conn,SHOPS_ID);
           }
            return item;


       }
   }

   HashMap getSHOPS(Connection conn, Long SHOPS_ID) throws SQLException{
       HashMap item = new HashMap();

       String sql1 = "select SHOPS.ID,SHOPS.SHOP,SHOPS.ADDRES from SHOPS WHERE SHOPS.ID = ? ";
       try(PreparedStatement pstmt1 = conn.prepareStatement(sql1)){
           int a=1;
           pstmt1.setLong(a++, SHOPS_ID);
           ResultSet rs = pstmt1.executeQuery();
           while (rs.next()){
               a=a+1;
               item.put("INDEX", a);
               item.put("ID", rs.getString("ID"));
               item.put("SHOP", rs.getString("SHOP"));
               item.put("ADDRES", rs.getString("ADDRES"));
           }

       }
        return item;
   }

%>

