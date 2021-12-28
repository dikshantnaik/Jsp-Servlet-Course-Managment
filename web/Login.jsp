<%-- 
    Document   : Login
    Created on : Dec 20, 2021, 10:55:15 AM
    Author     : student
--%>


<%@page import="java.util.HashSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="main.*" %>
<%@page import="java.sql.*" %>
<%@page import="main.util.*" %>


<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Enrol for a Course</title>
        <link rel="stylesheet" href="style.css" />
    </head>
    <body>
        <div class="bg-image home-bg"></div>
        <div class="container form cont_login"><br>
            <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LOGIN</h2>

            <!-- <div style="font-size: 1.5em"> -->
            <form action="Login.jsp" method="get"><br><br>
                <input name = "username" type="text" class="field_log" placeholder="Username"> <br><br>
                <input type="password" name="password" id="password "class="field_log"  placeholder="Password" /> <br>
                <input type="submit" value="login" name="login" class="button5 button5_log">
                <input type="checkbox" name="remember"> Remember Me
            </form>
            <!-- </div> -->

        </div><a href="Register.jsp"> Don't have account Login here </a>
    </body>
</html>


<%
    if (request.getParameter("login") != null) {
        Register_login obj = new Register_login();
        String result[] = obj.login(request.getParameter("username"), request.getParameter("password"));
        if (result[0].equals("logedin")) {
            if(request.getParameter("remember")!=null){
                Cookie ck = new Cookie("username", request.getParameter("username"));
                Cookie ck1 = new Cookie("name", result[2]);
                response.addCookie(ck);
                response.addCookie(ck1);
            }
            else{
                session.setAttribute("username", request.getParameter("username"));
                session.setAttribute("name", result[2]);
    
    
            }
            util.alert(out, result[1]);
            out.println("<meta http-equiv='refresh' content='1;URL=index.jsp'>");

        } else {
            util.alert(out, result[1]);
            System.out.println(result[1]);
        }

    }
%>