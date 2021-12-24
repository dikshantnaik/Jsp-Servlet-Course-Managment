<%-- 
    Document   : Login
    Created on : Dec 20, 2021, 10:55:15 AM
    Author     : student
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Controller" method="post">
        Username  <input type="text" name="username" ><br>  
        Password  <input type="text" name="password">
        <input type="submit" name="login" value ="Login">
        </form>
    </body>
</html>


