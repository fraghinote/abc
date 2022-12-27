<%@page pageEncoding="UTF-8"%>
<%@page import="org.json.*" %>
<%@page import="java.sql.*" %>
<%@ page import="java.util.HashMap" %>
<%!
  String NVL(String value, String toStr) throws Exception{
    String result=toStr;
    if (value!=null && value.length()>0 && !value.equals("null")){
      result=value;
    }
    return result;
  }
  JSONObject payload_toJSONObject(HttpServletRequest request) throws Exception{
    String request_jsonObject_string = request.getReader().lines().collect(java.util.stream.Collectors.joining());
    JSONObject data = new JSONObject(NVL(request_jsonObject_string,"{}"));
    return data;
  }
    HashMap getCONSUMPTIONS_VIEW_BY_CONSUMPTION_ID(Connection conn, Long CONSUMPTION_ID) throws SQLException {
        HashMap item = new HashMap();

        String sql1 = "select  CONSUMPTIONS_ID,CONSUMERS_ID,NAME,GENDER,PRODUCT_ID,ITEM,DAY  from CONSUMPTIONS_VIEW where CONSUMPTIONS_ID = ? ";
        try(PreparedStatement pstmt1 = conn.prepareStatement(sql1)) {
            int a=1;
            pstmt1.setLong(a++ , CONSUMPTION_ID);
//        ResultSet資料庫按下執行敘述句
            ResultSet rs = pstmt1.executeQuery();
            while (rs.next()){
                a=a+1;
                item.put("INDEX", a);
                item.put("CONSUMPTIONS_ID", rs.getString("CONSUMPTIONS_ID"));
                item.put("CONSUMERS_ID", rs.getString("CONSUMERS_ID"));
                item.put("NAME", rs.getString("NAME"));
                item.put("GENDER", rs.getString("GENDER"));
                item.put("PRODUCT_ID", rs.getString("PRODUCT_ID"));
                item.put("ITEM", rs.getString("ITEM"));
                item.put("DAY", rs.getString("DAY"));
            }
        }
        return item;
    }
    long getCONSUMPTION_SQ(Connection conn)throws SQLException{
        Long SEQ=-1L;                                              //取sequence序號
        String sql = "select CONSUMPTION_SQ.nextval  from dual";  //nextval 會取目前流水編號  dual在oracle中是個虛擬表
        try(PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet resultSet = pstmt.executeQuery();             //資料庫按下執行敘述句
        ){
            if(resultSet.next()){
                SEQ = resultSet.getLong(1);
            }
        }
        return SEQ;
    }
%>
