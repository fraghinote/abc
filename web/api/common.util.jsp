<%@page pageEncoding="UTF-8"%>
<%@page import="org.json.*" %>
<%@page import="java.util.*" %>

<%@ page import="java.util.stream.IntStream" %>
<%@ page import="java.sql.*" %>
<%!
  private String clobToString(Clob o) {
    try {
      return o.getSubString(1, (int) o.length());
    } catch (SQLException e) {
      return null;
    }
  }

  String NVL(String value, String toStr) {
    String result=toStr;
    if (value!=null && value.length()>0 && !value.equals("null")){
      result=value;
    }
    return result;
  }
  JSONObject payload_toJSONObject(ServletRequest request) throws Exception{
    String request_jsonObject_string = request.getReader().lines().collect(java.util.stream.Collectors.joining());

    return new JSONObject(NVL(request_jsonObject_string,"{}"));
  }


  String  sqlToString(String sql, Connection conn) throws SQLException {
    String result = "";
    try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
      try(ResultSet rs = preparedStatement.executeQuery()){
        if(rs.next()){
          result = rs.getString(1);
        }
      }
    }
    return result;
  }

//  JSONObject  sqlToObject(String sql, Connection conn) throws SQLException {
//    JSONObject row = new JSONObject();
//    try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
//      try(ResultSet resultSet = preparedStatement.executeQuery()){
//        ResultSetMetaData md = resultSet.getMetaData();
//        int numCols =  md.getColumnCount();
//        Object[] colNames = IntStream.range(0, numCols)
//          .mapToObj(i -> {
//            try {
//              return md.getColumnName(i + 1);
//            } catch (SQLException e) {
//              //e.printStackTrace();
//              return "?";
//            }
//          }).toArray();
//
//
//        if (resultSet.next()) {
//          for(Object name:colNames){
//            String cn = name.toString();
//            try {
//              Object o = resultSet.getObject(cn);
//              if(o instanceof Clob){
//                row.put(cn, clobToString((Clob) o));
//              }else{
//                row.put(cn, resultSet.getObject(cn));
//              }
//
//            } catch (JSONException | SQLException e) {
//              //e.printStackTrace();
//            }
//          }
//
//        }
//      }
//    }
//    return row;
//  }
  ArrayList<Map> sqlToList(String sql, Connection conn, String... params) throws SQLException {
    ArrayList<Map> result = new ArrayList<>();
    try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
      for(int i = 0; i < params.length; i++){
        preparedStatement.setString(i+1, params[i]);
      }
      try(ResultSet resultSet = preparedStatement.executeQuery()){
        ResultSetMetaData md = resultSet.getMetaData();
        int numCols =md.getColumnCount();
        Object[] colNames = IntStream.range(0, numCols)
          .mapToObj(i -> {
            try {
              return md.getColumnName(i + 1);
            } catch (SQLException e) {
              //e.printStackTrace();
              return "?";
            }
          }).toArray();

        long index = 0;
        while(resultSet.next()){
          Map<String, Object> row = new HashMap<>();
          row.put("_index", index++);
          for(Object name:colNames){
            String cn = name.toString();
            try {
              Object o = resultSet.getObject(cn);
              if(o instanceof Clob){
                row.put(cn, clobToString((Clob) o));
              }else{
                row.put(cn, resultSet.getObject(cn));
              }

            } catch (JSONException | SQLException e) {
              //e.printStackTrace();
            }
          }
          result.add(row);
        }
      }
    }
    return result;
  }
  JSONArray sqlToJson(String sql, Connection conn,String... params) throws SQLException {
    JSONArray result = new JSONArray();
    try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
      for(int i = 0; i < params.length; i++){
        preparedStatement.setString(i+1, params[i]);
      }
      try(ResultSet resultSet = preparedStatement.executeQuery()){
        ResultSetMetaData md = resultSet.getMetaData();
        int numCols = md.getColumnCount();
        Object[] colNames = IntStream.range(0, numCols)
          .mapToObj(i -> {
            try {
              return md.getColumnName(i + 1);
            } catch (SQLException e) {
              //e.printStackTrace();
              return "?";
            }
          }).toArray();

        long index = 0;
        while(resultSet.next()){
          JSONObject row = new JSONObject();
          row.put("_index", index++);
          for(Object name:colNames){
            String cn = name.toString();
            try {
              Object o = resultSet.getObject(cn);
              if(o instanceof Clob){
                row.put(cn, clobToString((Clob) o));
              }else{
                row.put(cn, resultSet.getObject(cn));
              }

            } catch (JSONException | SQLException e) {
              //e.printStackTrace();
            }
          }
          result.put(row);
        }

      }
    }
    return result;
  }

//  public String formatQuery(final String sql, Object... arguments) {
//    if (arguments != null && arguments.length == 0) {
//      return sql;
//    }
//    String query = sql;
//    int count = 0;
//    while (query.matches("(.*)\\?(.*)")) {
//      query = query.replaceFirst("\\?", "{" + count + "}");
//      count++;
//    }
//    return java.text.MessageFormat.format(query, arguments);
//  }
%>
