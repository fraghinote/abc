<%@ page import="org.json.JSONArray"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.UUID"%>
<%@ page contentType="application/json;charset=UTF-8" %>
<%@include file="../common.conn.jsp"%>
<%@include file="../common.util.jsp"%>
<%
//    String ip = request.getParameter("condition");
//    validatebutton
//    String age = request.getParameter("age");


    JSONObject payload = payload_toJSONObject(request);
    System.out.println("payload = " + payload);

    String ip = null ;
    System.out.println("ip = " + ip);
    String errorMessage = null;
    try{
          ip = payload.getString("condition");
    }catch (JSONException e){
        errorMessage = " 查詢失敗 "+e.getMessage();
    }

    boolean isAgeValid = false;

    try{
         String age = payload.getString("age");
        int ageInt = Integer.parseInt(age);
        isAgeValid =true;
    }catch (Exception e){
        JSONObject result = new JSONObject();
         errorMessage +=  " 查詢失敗 "+e.getMessage();

    }

    boolean haveResult = false;
    if(ip!=null && ip.length()< 15  ){try (Connection conn = getDataSource("jdbc/test73870").getConnection())
       {
         Test73870 test73870 = new Test73870();
        JSONArray array = test73870.getList(conn,ip);
        String uid = UUID.randomUUID().toString();
        session.setAttribute(uid,array);
        JSONObject result=new JSONObject();
        result.put("d_Message_C", "執行成功");
        result.put("d_Message", "");
        result.put("uid", uid);
        result.put("done_YN", "Y");
        result.put("value", array);
        out.print(result);
        System.out.println("uid = " + uid);
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
         JSONArray getList(Connection conn,String IP) throws SQLException{
            JSONArray jsonArray = new JSONArray();
            String sql ="select IP,NAME,APPID, DESTINATION, LIB_VERSION, IS_PRIMARY_APPID, HIT_COUNT, to_char(LAST_HIT,'YYYY-MM-DD') LAST_HIT from CLOUD_IP_LIST " +
             " where ip like ? or name = ? and APPID = ? " +
              " order by  ins_date desc ";
            try (PreparedStatement stat = conn.prepareStatement(sql);){

                stat.setString(1,IP+"%");
                stat.setString(2,IP+"%");
                stat.setString(3,"APPID");
                try (ResultSet result = stat.executeQuery();) {
                    int i=0;
                    while (result.next()) {
                        JSONObject item = new JSONObject();
                        i=i+1;
                        item.put("INDEX",  i);
                        item.put("IP", result.getString("IP"));
                        item.put("NAME", result.getString("NAME"));
                        item.put("APPID", result.getString("APPID"));
                        item.put("DESTINATION", result.getString("DESTINATION"));
                        item.put("LIB_VERSION", result.getString("LIB_VERSION"));
                        item.put("IS_PRIMARY_APPID", result.getString("IS_PRIMARY_APPID"));
                        item.put("HIT_COUNT", result.getString("HIT_COUNT"));
                        jsonArray.put(item);
                    }
                }
            }
            return jsonArray;
        }
}
%>
