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
    Connection con = Database.initSql();
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
        <!--<div>TODO write content</d<iv>-->


        <a href="Login.jsp">Login here </a> &nbsp;&nbsp;&nbsp;
        <a href ="Register.jsp">Sign Up </a>
        <form action="Controller" method="post"> <button type="submit" name="logout" > Logout </button></form>
        <div class="content">
            <%
                Cookie[] ck = request.getCookies();
                if (ck!=null){
                for (int i = 0; i < ck.length; i++) {
                    if (ck[i].getName().equals("name")) {
                        session.setAttribute("name", ck[i].getValue());
                    } else if (ck[i].getName().equals("username")) {
                        session.setAttribute("username", ck[i].getValue());
                    }
                }
                }

            %>
            <%            if (session.getAttribute("username") != null && session.getAttribute("name")!=null) {

            %>
            <h1> Welcome, <%= session.getAttribute("name")%></h1>
            <% } %>
        </div>

    </div>
    <div class="course_cont">
        <h1>Available Course </h1>
        <form action="Course.jsp" method="get">
            <%while (rs.next()) {%>
            <div class="course">
                <h1><%=rs.getString("course_name")%></h1>

                <h8 style="font-size: 20px;"><br> <%= rs.getInt("course_price")%></h8>
                <button class="course_button button5 but_enr" type="submit"name="course_id" value="<%= rs.getInt("course_id")%>"/> Enroll Now</button>
            </div>
            <% } %>

    </div></select>
</div>
</body>
</html>

<%
    }catch (Exception e) {
        System.out.println(e);
out.print(e);
    }finally {
        con.close();

    }
%>