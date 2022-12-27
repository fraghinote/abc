<%@ page import="org.json.JSONArray"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.UUID"%>
<%@ page import="static sun.security.x509.PolicyInformation.ID"%>
<%@ page contentType="application/json;charset=UTF-8" %>
<%@include file="../common.conn.jsp"%>
<%@include file="../common.util.jsp"%>
<%
    JSONObject payload = payload_toJSONObject(request);
    System.out.println("payload = " + payload);
    String shop = null;
    String errorMessage = null;
    try{
        shop = payload.getString("search");
    }catch (JSONException e){
        errorMessage = "查詢失敗 "+e.getMessage();
    }

    boolean isAgeValid = false;

    try{
        String age = payload.getString("age");
        int ageInt = Integer.parseInt(age);
        isAgeValid = true;
    }catch (Exception e){
        JSONObject result = new JSONObject();
        errorMessage += " 查詢失敗 "+e.getMessage();
    }

    boolean haveResult = false;
    if(shop!=null && shop.length()<15 ){try (Connection conn = getDataSource("jdbc/test73870").getConnection())
    {
        Test73870 test73870 = new Test73870();
        JSONArray array =  test73870.getList(conn, shop);

        JSONObject result = new JSONObject();
        result.put("d_Message_C", "執行成功");
        result.put("d_Message", "");
        result.put("done_YN", "Y");
        result.put("value",array);
        out.print(result);

        haveResult =true;
    }
    }
    if(!haveResult){
        JSONObject result = new JSONObject();
        result.put("done_YN","N");
        result.put("d_Message",errorMessage);
        result.put("d_Message_c",errorMessage);
        out.print(result);
    }

%>
<%!
class Test73870{
    JSONArray getList(Connection conn, String shop) throws SQLException
    {
        JSONArray jsonArray = new JSONArray();
            String sql = " SELECT SHOP, ID, ADDRES FROM SHOPS WHERE SHOP LIKE ? OR ID = ? AND ADDRES = ? ";
                try(PreparedStatement pstmt = conn.prepareStatement(sql))
                    {
                        pstmt.setString(1, shop+"%");
                        pstmt.setString(2, "id");
                        pstmt.setString(3, "addres");
                            try(ResultSet result =  pstmt.executeQuery();)
                            {
                                int a=0;
                                while (result.next())
                                    {
                                        JSONObject item = new JSONObject();
                                        a=a+1;
                                        item.put("INDEX" ,1);
                                        item.put("ID", result.getString("ID"));
                                        item.put("SHOP",result.getString("SHOP"));
                                        item.put("ADDRES", result.getString("ADDRES"));
                                        jsonArray.put(item);

                                    }
                            }
                        return jsonArray;
                    }
    }
}

%>



























