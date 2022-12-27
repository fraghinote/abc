<%@ page import="org.json.JSONArray"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="java.sql.*" %><%@ page import="java.util.HashMap"%>
<%@ page contentType="application/json;charset=UTF-8" %>
<%@include file="../common.conn.jsp"%>
<%@include file="../common.util.jsp"%>
<%
    //String ID = request.getParameter("ID");
    //validate
//    String age = request.getParameter("age");


    JSONObject payload = payload_toJSONObject(request);




    Long ID = null ;
    String errorMessage = null;
    try{
          ID = payload.getLong("ID");


    }catch (JSONException e){
        errorMessage = " 查詢失敗 "+e.getMessage();

    }


    boolean haveResult = false;
    if(ID!=null ){
//      Thread.sleep(1000);
      try (Connection conn = getDataSource("jdbc/test73870").getConnection()){
        Test73870 test73870 = new Test73870();
        System.out.println("ID = " + ID);
        JSONArray array = test73870.getCONSUMPTIONS_VIEW_BY_CONSUMERS_ID(conn,ID);
        System.out.println("array = " + array);

        //session.setAttribute(uid,array);
        JSONObject result=new JSONObject();

        result.put("d_Message_C", "執行成功");
        result.put("d_Message", "");

        result.put("done_YN", "Y");
        result.put("value", array);
        out.print(result);

        haveResult = true;
      }
    }

    if(!haveResult){
        JSONObject result = new JSONObject();
        result.put("done_YN","N");
        result.put("d_Message",errorMessage);
        result.put("d_Message_C",errorMessage);
        out.print(result);

    }

%>

<%!
class Test73870{
  JSONArray getCONSUMPTIONS_VIEW_BY_CONSUMERS_ID (Connection conn, Long ID) throws SQLException{
    JSONArray jsonArray = new JSONArray();
    String sql = " select * from  CONSUMPTIONS_VIEW where CONSUMERS_ID = ? order by CONSUMPTIONS_ID desc ";
    System.out.println("sql = " + sql);
    try(PreparedStatement stat = conn.prepareStatement(sql)){
      stat.setLong(1,ID);
      try (ResultSet result = stat.executeQuery();) {
        int i=0;
        while (result.next()) {
            JSONObject item = new JSONObject();
            i=i+1;
            item.put("INDEX",  i);
            item.put("CONSUMPTIONS_ID", result.getString("CONSUMPTIONS_ID"));
            item.put("CONSUMERS_ID", result.getString("CONSUMERS_ID"));
            item.put("GENDER", result.getString("GENDER"));
            item.put("NAME", result.getString("NAME"));
            item.put("PRODUCT_ID", result.getString("PRODUCT_ID"));
            item.put("ITEM", result.getString("ITEM"));
             item.put("DAY", result.getString("DAY"));
            jsonArray.put(item);
        }
      }
    }
    return jsonArray;
  }



}
%>
