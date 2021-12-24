<%@page import="java.util.List"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : Login
    Created on : Dec 20, 2021, 10:55:15 AM
    Author     : student
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="main.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.concurrent.TimeUnit" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Register.jsp" method="post">
        Username  <input type="text" name="username" ><br>  
        Password  <input type="text" name="password">
        <input type="submit" name="register" value ="Login">
        </form>
    </body>
</html>

<%!
    public void alert(JspWriter out,String msg) throws Exception{
 
    out.println("<script>alert(\""+msg+"\")</script>");
}
        %>

<%
    
    if(request.getParameter("register")!=null){
        %>
       
        <%
    Register_login obj = new  Register_login();
    String result= obj.register(request.getParameter("username"), request.getParameter("password"));
    if(result.equals("registered")){
//        alert(out, "Registered..Please Login to Continue");
        response.sendRedirect("Login.jsp");
        
    }
    else{
    alert(out, result);
    }
        
 
    }
    %>
  