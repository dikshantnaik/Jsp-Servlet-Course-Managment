<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="main.*" %>
<%@page import="java.sql.*" %>
<%
    String query = "SELECT * FROM available_course";
    Connection con = Dao.initSql();
    PreparedStatement stmt;
    try {

        stmt = con.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();


%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./style.css">
    </head>
    <body>
        <!--<div>TODO write content</d<iv>-->

        <a href="Login.jsp">Login here </a> &nbsp;&nbsp;&nbsp;
        <a href ="Register.jsp">Sign Up </a>
        <form action="Controller" method="post"> <button type="submit" name="logout" > Logout </button></form>

        <div class="course_cont">
            <h1>Available Course </h1>
            <form action="index.php" method="post">
                <%while (rs.next()) { %>
                <div class="course">
                    <h1><%=rs.getString("course_name")%></h1>

                    <h8 style="font-size: 20px;"><br> Prize 1000 Rs</h8>
                    <button class="course_button button5 but_enr" type="submit"name="enrol_course" value="1" /> Enroll Now</button>
                </div>
                <% } %>

        </div></select>
</div>
</body>
</html>

<%
    } catch (Exception e) {
        System.out.println(e);
    } finally {
        con.close();

    }
%>