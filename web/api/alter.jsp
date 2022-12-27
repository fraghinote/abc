<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.HashMap"%>
<%@ page contentType="application/json;charset=UTF-8" %>
<%@include file="../common.util.jsp"%>
<%@include file="../common.conn.jsp"%>
<%
    JSONObject payload = payload_toJSONObject(request);


    HashMap item =null;
    try(Connection conn = getDataSource("jdbc/test73870").getConnection()){
    JSONObject user = payload.getJSONObject("user");
    String NAME = user.getString("NAME");
    String GENDER = user.getString("GENDER");


    String newNAME = NAME;
    String newGENDER = GENDER;
    System.out.println("newGENDER = " + newGENDER);
    Long ID = user.getLong("ID");

    boolean result = newmd (conn, ID, newNAME, newGENDER);
    JSONObject msg = new JSONObject();

    if( NAME != null){

        msg.put("isOK", "Y");
        item = getCONSUMERS(conn, ID);
        msg.put("user",item);

//        {GENDER: "0", INDEX: 1, ID: "509", NAME: "6665"}

    }
    out.println(msg);

}


%>


<%!
    boolean newmd(Connection conn, Long ID, String newNAME, String newGENDER) throws SQLException{

//        System.out.println("ID = " + ID);
//        System.out.println("oldNAME = " + oldNAME);
//        System.out.println("newNAME = " + newNAME);
System.out.println("newGENDER = " + newGENDER);

        String sql = "UPDATE CONSUMERS SET NAME = ? , GENDER = ? WHERE ID = ? ";
        try(PreparedStatement pstmt = conn.prepareStatement(sql)){
            boolean isSuccess = false;
            int t=1;
            pstmt.setString(t++, newNAME);
            System.out.println("newNAME = " + newNAME);
            pstmt.setString(t++, newGENDER);
            System.out.println("newGENDER = " + newGENDER);
            pstmt.setLong(t++, ID);
            System.out.println("ID = " + ID);
            isSuccess = (pstmt.executeUpdate() == 1);

             return isSuccess;


        }

    }

    HashMap getCONSUMERS(Connection conn , Long ID) throws SQLException{
        HashMap item = new HashMap();
        String sql = "SELECT CONSUMERS.ID, CONSUMERS.NAME, CONSUMERS.GENDER FROM CONSUMERS WHERE CONSUMERS.ID = ? ";
        try(PreparedStatement pstmt = conn.prepareStatement(sql)){
            int t=1;
            pstmt.setLong(t++, ID);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                t=t+1;
                item.put("INDEX", t);
                item.put("ID", rs.getLong("ID"));
                item.put("NAME",rs.getString("NAME"));
                item.put("GENDER",rs.getString("GENDER"));

            }
            return item;

        }
    }


%>
