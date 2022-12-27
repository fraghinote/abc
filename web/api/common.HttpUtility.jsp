<%@ page language="java" pageEncoding="UTF-8"%><%@
 page import="java.sql.*, java.util.*" %><%@
 page import="java.io.BufferedReader" %><%@
 page import="java.io.IOException" %><%@
 page import="java.io.InputStream" %><%@
 page import="java.io.InputStreamReader" %><%@
 page import="java.io.OutputStreamWriter" %><%@
 page import="java.net.HttpURLConnection" %><%@
 page import="java.net.URL" %><%@
 page import="java.net.URLEncoder" %>
<%!
//參考資料http://www.codejava.net/java-se/networking/an-http-utility-class-to-send-getpost-request
static public class HttpUtility {

    /**
     * Represents an HTTP connection
     */
     private static HttpURLConnection httpConn;
     
    /**
     * Makes an HTTP request using GET method to the specified URL.
     * 
     * @param requestURL
     *            the URL of the remote server
     * @return An HttpURLConnection object
     * @throws IOException
     *             thrown if any I/O error occurred
     */
 
     public static HttpURLConnection sendGetRequest(String requestURL) throws IOException {
         URL url = new URL(requestURL);
         httpConn = (HttpURLConnection) url.openConnection();
         httpConn.setUseCaches(false);
  
         httpConn.setDoInput(true); // true if we want to read server's response
         httpConn.setDoOutput(false); // false indicates this is a GET request
  
         return httpConn;
     }

    /**
     * Makes an HTTP request using POST method to the specified URL.
     * 
     * @param requestURL
     *            the URL of the remote server
     * @param params
     *            A map containing POST data in form of key-value pairs
     * @return An HttpURLConnection object
     * @throws IOException
     *             thrown if any I/O error occurred
     */
     
    public static HttpURLConnection sendPostRequest(String requestURL,
            Map params) throws IOException {
        URL url = new URL(requestURL);
        httpConn = (HttpURLConnection) url.openConnection();
        HttpURLConnection.setFollowRedirects(false);
        httpConn.setConnectTimeout(5 * 1000);
        httpConn.setUseCaches(false);
 
        httpConn.setDoInput(true); // true indicates the server returns response
 
        StringBuffer requestParams = new StringBuffer();
 
        if (params != null && params.size() > 0) {
 
            httpConn.setDoOutput(true); // true indicates POST request
 
            // creates the params string, encode them using URLEncoder
            Iterator paramIterator = params.keySet().iterator();
            while (paramIterator.hasNext()) {
                String key = (String)paramIterator.next();
                String value = (String)params.get(key);
                if(key!=null && value != null){
                    requestParams.append(URLEncoder.encode(key, "UTF-8"));
                    requestParams.append("=").append(URLEncoder.encode(value, "UTF-8"));
                    requestParams.append("&");
                }
            }
 
            // sends POST data
            OutputStreamWriter writer = null;
            try{
	            writer = new OutputStreamWriter(
	                    httpConn.getOutputStream());
	            writer.write(requestParams.toString());
	            writer.flush();
            }finally{
            	if(writer!=null) {writer.close();}
            }
        }
 
        return httpConn;
    }

    /**
     * Returns only one line from the server's response. This method should be
     * used if the server returns only a single line of String.
     * 
     * @return a String of the server's response
     * @throws IOException
     *             thrown if any I/O error occurred
     */
    public static String readSingleLineRespone() throws IOException {
        InputStream inputStream = null;
        if (httpConn != null) {
            inputStream = httpConn.getInputStream();
        } else {
            throw new IOException("Connection is not established.");
        }
        String response = null;
        BufferedReader reader = null;
        try{
        	reader = new BufferedReader(new InputStreamReader( inputStream));
 
        	response = reader.readLine();
        }finally{
        	 if(reader!=null)reader.close();
        }
       
 
        return response;
    }
 
    /**
     * Returns an array of lines from the server's response. This method should
     * be used if the server returns multiple lines of String.
     * 
     * @return an array of Strings of the server's response
     * @throws IOException
     *             thrown if any I/O error occurred
     */
    public static String[] readMultipleLinesRespone() throws IOException {
        InputStream inputStream = null;
        if (httpConn != null) {
            inputStream = httpConn.getInputStream();
        } else {
            throw new IOException("Connection is not established.");
        }
    
        BufferedReader reader = null;
        List response = null;
        
        try{
        reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
	        response = new ArrayList();
	    
	        String line = "";
	        while ((line = reader.readLine()) != null) {
	            response.add(line);
	        }
        }finally{
       	 	if(reader!=null)reader.close();
       	}
      
        return (String[]) response.toArray(new String[0]);
    }
     
    /**
     * Closes the connection if opened
     */
    public static void disconnect() {
        if (httpConn != null) {
            httpConn.disconnect();
        }
    }
}

%>