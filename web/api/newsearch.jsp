<%@ page contentType="application/json;charset=UTF-8" %>
<%@include file="../common.conn.jsp"%>
<%@include file="../common.util.jsp"%>
<%
    JSONObject payload = payload_toJSONObject(request);
    System.out.println("payload = " + payload);
    String addres = null;
    String errorMessage = null;
    try{
        addres = payload.getString("search");
    }catch (JSONException e){
        errorMessage = "查詢失敗 "+e.getMessage();
    }

    boolean isAgeVald = false;
    try{
        String age = payload.getString("age");
        int ageInt = Integer.parseInt(age);
        isAgeVald = true;
    }catch (Exception e){
        JSONObject result = new JSONObject();
        errorMessage += "查詢失敗 "+e.getMessage();
    }

    boolean haveResult = false;
    if(addres!=null && addres.length()<15 ){try(Connection conn = getDataSource("jdbc/test73870").getConnection())
    {
        Test73870 teat73870 = new Test73870();
        JSONArray array = teat73870.getList(conn, addres);
        JSONObject result = new JSONObject();
        result.put("d_Message_c", "執行成功");
        result.put("d_Message", "");
        result.put("done_YN", "Y");
        result.put("value",array);
        out.print(result);

        haveResult = true;
    }
    }
    {
        if(!haveResult){
            JSONObject result = new JSONObject();
            result.put("done_YN","N");
            result.put("d_Message",errorMessage);
            result.put("d_Message_c",errorMessage);
            out.print(result);
        }
    }
%>

<%!

class Test73870{
    JSONArray getList(Connection conn, String addres) throws SQLException
    {
        JSONArray jsonArray = new JSONArray();
        String sql = " SELECT ADDRES, ID, SHOP FROM SHOPS  WHERE ADDRES LIKE ?   ";
            //可以同時查ADDRES跟SHOP
//        String sql = " SELECT ADDRES, ID, SHOP FROM SHOPS  WHERE ADDRES LIKE ? OR SHOP = ?  ";
        try(PreparedStatement pstmt = conn.prepareStatement(sql))
        {
            pstmt.setString(1, addres+"%");
//            pstmt.setString(2, addres+"%");    //同時查ADDRES跟SHOP需要開啟


            try(ResultSet result = pstmt.executeQuery();)
            {
                int t=0;
                while (result.next())
                    {
                        JSONObject item = new JSONObject();
                        t=t+1;
                        item.put("INDEX" ,1);
                        item.put("ID", result.getString("ID"));
                        item.put("SHOP", result.getString("SHOP"));
                        item.put("ADDRES", result.getString("ADDRES"));
                        jsonArray.put(item);

                    }
            }
            return jsonArray;


        }
    }
}




%>
