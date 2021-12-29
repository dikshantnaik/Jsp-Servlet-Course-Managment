<%-- 
    Document   : Course
    Created on : 28-Dec-2021, 6:11:23 pm
    Author     : dikshant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="main.*" %>
<%@page import="java.sql.*" %>
<%
    String  course_id = request.getParameter("course_id");
    String query = "SELECT * FROM available_course where course_id=" +course_id;
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
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>

    <body>
        <%while (rs.next()) {%>
        <div class="content">
            <h1 >COurse</h1>
            <h1><%= rs.getString("course_name")%></h1>
            <p> <%= rs.getString("course_discription")%></p>
        </div>
        <%
        }%>

        <div class="course_cont">
            
            <<form action="Controller" method="post">
           <input class="form-control" type="text" placeholder="Review" name="review">
           <input type="hidden" name="username" value="<%=  session.getAttribute("username") %>">
           <input type="hidden" name="course_id" value="<%= course_id%>">
           <input type="submit" name ="SubmitReview" value="Submit Review"> 
</form>

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