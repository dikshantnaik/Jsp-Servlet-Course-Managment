<%-- 
    Document   : Course
    Created on : 28-Dec-2021, 6:11:23 pm
    Author     : dikshant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="main.*" %>
<%@page import="java.sql.*" %>
<%
    String query = "SELECT * FROM available_course where course_id=" + request.getParameter("course_id");
    Connection con = Dao.initSql();
    PreparedStatement stmt;
    try {

        stmt = con.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();


%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Document</title>
        <link rel="stylesheet" href="./style.css">
    </head>

    <body>
        <%while (rs.next()) {%>
        <div class="content">
            <h1 >COurse</h1>
            <h1><%= rs.getString("course_name")%></h1>

        </div>
        <%
        }%>

        <div class="course_cont">
            <h1>Available Course </h1>


        </div>
    </body>

</html>


<%
    } catch (Exception e) {
//        System.out.println(e);
        out.println(e);
    } finally {
        con.close();

    }
%>