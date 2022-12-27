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
    String errorMessage = null;
    boolean haveResult = false;



//      Thread.sleep(1000);
      try (Connection conn = getDataSource("jdbc/test73870").getConnection()){
        Test73870 test73870 = new Test73870();
        JSONArray array = test73870.getCONSUMERS(conn);
        //session.setAttribute(uid,array);
        JSONObject result=new JSONObject();

        result.put("d_Message_C", "執行成功");
        result.put("d_Message", "");

        result.put("done_YN", "Y");
        result.put("value", array);
        out.print(result);

        haveResult = true;
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
    JSONArray getCONSUMERS(Connection conn) throws SQLException{
//
        JSONArray array = new JSONArray();
        String sql = "SELECT * FROM CONSUMERS   WHERE ID like '%' order by ID desc ";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)){
            ResultSet result = pstmt.executeQuery();
                int i=0;
                while (result.next()){
                    i=i+1;
                     HashMap item = new HashMap();
                    item.put("INDEX", i);
                    item.put("ID", result.getString("ID"));
                    item.put("NAME", result.getString("NAME"));
                    item.put("GENDER", result.getString("GENDER"));
                    array.put(item);
                }
        }
        return array;
    }
}

%>
