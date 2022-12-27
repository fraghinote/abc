<%@ page import="org.json.JSONObject"%><%@ page import="java.util.*"%><%@ page import="java.time.LocalDateTime"%><%@ page import="java.time.LocalDate"%><%@ page import="java.time.format.DateTimeFormatter"%><%@ page contentType="application/json; charset=utf-8" %>
<%request.setCharacterEncoding("UTF-8");%><%
String oldToken = request.getParameter("pageToken");
//建立一個map 儲存所有的token
Map tokenMap = (Map)session.getAttribute("cycu2000h_11.tokenMap");
Map timeTokenMap = (Map)session.getAttribute("cycu2000h_11.timeTokenMap");
if (tokenMap == null) {
    tokenMap = new HashMap(); session.setAttribute("cycu2000h_11.tokenMap", tokenMap);
    timeTokenMap = new TreeMap(); session.setAttribute("cycu2000h_11.timeTokenMap", timeTokenMap);
}
//如果oldToken 存在map中 , 更新map裡面的時間
//如果oldToken存在於tokenMap中
String token = null;
if (oldToken != null){
  if( tokenMap.containsKey(oldToken)) {  //更新token的使用時間
      LocalDateTime oldTime = (LocalDateTime)tokenMap.get(oldToken);
      timeTokenMap.remove(oldTime);
      LocalDateTime newTime = LocalDateTime.now();
      timeTokenMap.put(newTime, oldToken);
      tokenMap.put(oldToken,newTime);
      token = oldToken;
      //System.out.println("oldToken = " + oldToken);
  }
}else{
  // 產生一個新 token
  String newToken = UUID.randomUUID().toString();
  // 將<時間,token>放入map
  LocalDateTime now = LocalDateTime.now();
  timeTokenMap.put(now,newToken);
  tokenMap.put(newToken,now);
  token=newToken;

  //建立好新token後 建立儲存所有資料的map
  Map tokenItems = (Map)session.getAttribute(token+".items");
  if(tokenItems==null){
    tokenItems = new HashMap();
    session.setAttribute(token+".items",tokenItems);
  }
}



if(token == null){
  JSONObject json = new JSONObject();
  json.put("status", "token isInvalid");
  json.put("done_YN", "N");
  out.print(json);
}else{
  JSONObject json = new JSONObject();
  json.put("value", token);
  json.put("done_YN", "Y");
  out.print(json);
}

//DEBUG 列出所有的token照時間排序  並且標記 超過時間的token放到list當中
Iterator<Map.Entry> iterator = timeTokenMap.entrySet().iterator();
List<LocalDateTime> time2delete=new ArrayList();
while(iterator.hasNext()){
   Map.Entry entry =  iterator.next();
    LocalDateTime time = (LocalDateTime)entry.getKey();
    String token1 = (String)entry.getValue();
    //System.out.println("time="+ time.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss")) +", token = " + token1);
    //請出超過時間30分鐘的token
    if(time.plusMinutes(30).isBefore(LocalDateTime.now())){
      tokenMap.remove(token1);
      Map itemMap = (Map) session.getAttribute(token1+".items");
      itemMap.clear();
      session.removeAttribute(token1+".items");
      time2delete.add(time);
    }
}
//從list中 刪除超過時間的token
for(LocalDateTime localDateTime: time2delete){
  if(localDateTime!=null) timeTokenMap.remove(localDateTime);
  //System.out.println("time="+ localDateTime +"超過時間刪除 ");
}


%>
