<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.Locale"%>
<%@ page contentType="application/json;charset=UTF-8" %>
<%@include file="../common.conn.jsp"%>
<%@include file="../common.util.jsp"%>
<%
    JSONObject payloadData = payload_toJSONObject(request);
    System.out.println("payloadData = " + payloadData);

    try(Connection conn = getDataSource("jdbc/test73870").getConnection()){

        JSONObject newUser = payloadData.getJSONObject("newUser");
         System.out.println("newUser = " + newUser);
        String name = newUser.optString("name");
         System.out.println("name = " + name);
        String ge = newUser.optString("ge");
         System.out.println("ge = " + ge);


        HashMap item =newadd(conn,name,ge);
        System.out.println("item1 = " + item);

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





    int c = add(100,200);  //範例
    int d = add(200,400);  //範例

%>

<%!
    int add(int a,int b){  //範例
        int c = a+b;  //範例
         return c;  //範例
    }
    //新增資料進資料庫
     HashMap newadd(Connection conn, String newUser, String ge) throws SQLException{
         HashMap item = new  HashMap();
        boolean isSuccess = false;
        String sql = ("INSERT INTO CONSUMERS (ID, NAME,GENDER ) VALUES (?, ?, ?)");
        try(PreparedStatement pstmt = conn.prepareStatement(sql)){
            int a=1;
            long CONSUMERS_ID = getCONSUMPTION_SQ (conn);
            pstmt.setLong(a++,CONSUMERS_ID);
            System.out.println("ID2 = " + CONSUMERS_ID);
            pstmt.setString(a++, newUser);
            System.out.println("newUser1 = " + newUser);
            pstmt.setString(a++, ge);
            System.out.println("ge = " + ge);
            if(pstmt.executeUpdate() == 1){

                item = getCONSUMERS(conn,CONSUMERS_ID);


            }
//            isSuccess = (pstmt.executeUpdate() == 1);
             return item;

        }

    }

    //資料庫取資料
        HashMap getCONSUMERS(Connection conn, Long CONSUMERS_ID) throws SQLException {
        HashMap item = new HashMap();

        String sql1 = "select CONSUMERS.ID,CONSUMERS.NAME,CONSUMERS.GENDER from CONSUMERS where CONSUMERS.ID = ? ";
        try(PreparedStatement pstmt1 = conn.prepareStatement(sql1)) {
            int a=1;
            pstmt1.setLong(a++ , CONSUMERS_ID);
            ResultSet rs = pstmt1.executeQuery(); //ResultSet資料庫按下執行敘述句
            while (rs.next()){
                a=a+1;
                item.put("INDEX", a);
                item.put("ID", rs.getString("ID"));
                item.put("NAME", rs.getString("NAME"));
                item.put("GENDER", rs.getString("GENDER"));

            }
        }
        return item;
    }
%>




























<%--<%!--%>

<%--    boolean addTask(Connection conn,JSONObject data) throws SQLException{--%>
<%--        boolean isSuccess = false;--%>
<%--        String sql = ("INSERT INTO CONSUMERS(ID, NAME) VALUES (?, ?) ");--%>
<%--        try(PreparedStatement pstmt = conn.prepareStatement(sql)){--%>
<%--            int i=1;--%>
<%--            pstmt.setString(i++, data.optString("ID"));--%>
<%--            pstmt.setString(i++, data.optString("NAME"));--%>
<%--            isSuccess = (pstmt.executeUpdate() == 1);--%>

<%--        }catch (Exception e){--%>
<%--            System.out.println("sql = " + sql);--%>
<%--        }--%>
<%--        return isSuccess;--%>
<%--    }--%>

<%--%>--%>
