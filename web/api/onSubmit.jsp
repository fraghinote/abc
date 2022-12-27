<%@ page contentType="application/json;charset=UTF-8" %>
<%@include file="../common.conn.jsp"%>
<%@include file="../common.util.jsp"%>

<%
    JSONObject payloadData = payload_toJSONObject(request);
    System.out.println("payloadData = " + payloadData);
    try(Connection conn = getDataSource("jdbc/test73870").getConnection()){
        JSONObject onSubmit = payloadData.getJSONObject("onSubmit");
        System.out.println("onSubmit = " + onSubmit);

        String name = onSubmit.getString("name");
        System.out.println("name = " + name);

        String age = onSubmit.getString("age");
        System.out.println("age = " + age);


        JSONObject msg = new JSONObject();
        if(isLoginSuccess(conn,name,age)){
            session.setAttribute("isLoginSuccess","true");
            HashMap surveyUser = new HashMap();    //初始化使用者基本資料
            surveyUser.put("surveyUserid", "12345");
             session.setAttribute("cycu2000_11.surveyUser",surveyUser);

             System.out.println("surveyUser = " + surveyUser);
            session.setAttribute("account",name);
            session.setAttribute("aaa","bbb");
            msg.put("isOK", "Y");

        }else{

            msg.put("isOK", "N");

        }
        out.println(msg);
    }

%>
<%!
        boolean isLoginSuccess(Connection conn, String name, String password) throws SQLException{
        boolean isSuccess = false;
        String sql = "SELECT ACCONT,PASSWORD FROM CONSUMERS WHERE  ACCONT = ? and PASSWORD = ? ";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)){
            System.out.println("pstmt = " + pstmt);

            pstmt.setString(1, name);
            System.out.println("name = " + name);
            pstmt.setString(2, password);
            System.out.println("password = " + password);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                isSuccess = true;
            }
            return isSuccess;
        }

    }

//    HashMap insert(Connection conn, Long CONSUMERS_ID) throws SQLException{
//        HashMap item = new HashMap();
//
//        String sql = "SELECT ACCONT,PASSWORD FROM CONSUMERS ";
//        try (PreparedStatement pstmt = conn.prepareStatement(sql)){
//            ResultSet result = pstmt.executeQuery();
//            int a=0;
//            pstmt.setLong(a++, CONSUMERS_ID);
//            while (result.next()){
//                a=a+1;
//                item.put("INDEX", a);
//                item.put("ID", result.getString("ID"));
//                item.put("name",result.getString("name"));
//                item.put("age",result.getString("age"));
//
//            }
//                return item;
//        }
//    }
%>
