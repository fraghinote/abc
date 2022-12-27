<%@ page import="javax.sql.DataSource" %><%@ page import="javax.naming.Context" %><%@ page import="javax.naming.InitialContext" %><%@page pageEncoding="UTF-8" %><%!
  DataSource getDataSource(String dn) throws javax.naming.NamingException{
    Context initContext = new InitialContext();
    return  (DataSource) initContext.lookup( "java:comp/env/"+dn);
  }
%><%
  if (request.getProtocol().compareTo("HTTP/1.0")==0)
    response.setHeader("Pragma","no-cache");
  else
  if (request.getProtocol().compareTo("HTTP/1.1")==0)
    response.setHeader("Cache-Control","no-cache");

  response.setDateHeader("Expires",0);
  response.addHeader("Cache-Control", "private, max-age=0, no-cache");
%>
