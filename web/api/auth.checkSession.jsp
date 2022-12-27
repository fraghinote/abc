<%@ page import="org.json.JSONObject"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.sql.Connection"%>
<%@ page contentType="application/json; charset=utf-8" %>
<%@include file="common.conn.jsp"%>
<%@include file="common.util.jsp"%>
<%
System.out.println(" session.getAttribute(\"aaa\") = " + session.getAttribute("aaa"));
//等號右邊(Map)把(session.getAttribute("cycu2000_11.surveyUser")型態轉換成map，這樣等號左邊才讀的到     //元素.getAttribute要給定屬性的值不存在則回傳null
Map surveyUser = (Map) (session.getAttribute("cycu2000_11.surveyUser"));
System.out.println("surveyUser = " + surveyUser);
if(surveyUser == null){
  surveyUser = new HashMap();
  session.setAttribute("cycu2000_11.surveyUser",surveyUser); //元素.setAttribute()如果指定屬性的值如果已經存在，則添加指定名稱和值給新屬性

}

//決定建立surveyUserid

String surveyUserid = (String) surveyUser.get("surveyUserid");
String itouchUserid = (String) session.getAttribute("User_id");
String magicUserid = (String) surveyUser.get("magicUserid");

if(itouchUserid!=null){
  surveyUserid = itouchUserid;
}

if(magicUserid!=null){
  surveyUserid = magicUserid;
}
surveyUser.put("surveyUserid", surveyUserid);
//決定isAdmin
  HashMap adminUser = new HashMap();
  adminUser.put("30363", "admin");
  adminUser.put("30263", "admin");
  adminUser.put("30478", "admin");  //30478 徐藝菁
  adminUser.put("73060", "admin");  //73060 劉季蒝 2115 專任研究助理 • 學生事務處生活輔導組
  adminUser.put("41141", "admin"); // 41141 劉新益教官 1418 上校教官 • 軍訓室
  if(surveyUserid!=null &&  adminUser.containsKey(surveyUserid) ){  //containsKey檢查是否存在指定的Key
    surveyUser.put("isAdmin", true);
    surveyUser.put("adminUserid", surveyUserid);
  }

boolean isAuthed = surveyUserid != null;

session.setAttribute("cycu2000_11.isAuthed",isAuthed);


JSONObject obj = new JSONObject();
obj.put("isAuthed",isAuthed);

obj.put("surveyUser",surveyUser);
System.out.println("surveyUser = " + surveyUser);

out.print(obj.toString());
%>
