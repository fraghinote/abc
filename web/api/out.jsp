<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page contentType="application/json;charset=UTF-8" %>
<%@include file="../common.util.jsp"%>
<%@include file="../common.conn.jsp"%>
<%
    JSONObject payload = payload_toJSONObject(request);
    System.out.println("payload = " + payload);
    JSONObject user = payload.getJSONObject("user");  //user是物件要用JSONObject
    String ID = user.getString("ID");
    //getString為指定位元物件，因此物件有什麼就一定要有什麼。 user是KEY:ID是VALUE
     //{user: {GENDER: "0", INDEX: 1, ID: "521", NAME: "488796"}}

    try(Connection conn = getDataSource("jdbc/test73870").getConnection()){
        int del = del(conn,ID);
        JSONObject msg = new JSONObject();
        if(del == 1){
            msg.put("isOK", "Y");
        }
        out.println(msg);


    }



%>

<%!
    int del(Connection conn , String ID) throws SQLException{
    String sql ="DELETE FROM CONSUMERS WHERE ID = ? ";
    int updateCount = 0;
    try(PreparedStatement pstmt = conn.prepareStatement(sql)){
        pstmt.setString(1,ID);
        updateCount = pstmt.executeUpdate();
    }
    return  updateCount;


    }

%>
