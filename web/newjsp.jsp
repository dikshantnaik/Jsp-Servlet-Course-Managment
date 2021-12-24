<%-- 
    Document   : newjsp
    Created on : 24-Dec-2021, 8:50:38 pm
    Author     : dikshant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="main.*" %>
<%@page import="java.sql.*" %>

<%
    Register_login obj = new  Register_login();
    String rs= obj.register("hehe", "adawd");
    
    %>
    <%=rs%>