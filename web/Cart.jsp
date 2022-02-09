<%-- 
    Document   : Cart
    Created on : 05-Jan-2022, 7:37:01 pm
    Author     : dikshant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="main.*" %>
<%@page import="java.sql.*" %>
<%

    String query = "SELECT cid,course_name,course_price from cart,available_course,students WHERE sid=students.studentid and cid= available_course.course_id and username = \"" + session.getValue("username") + "\"";
    Connection con = Database.initSql();
    PreparedStatement stmt;
    try {

        stmt = con.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();


%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
            />
        <link rel="stylesheet" href="cart.css" />
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body class="bg-primary">
       
        <div class="container" >
            <div class="row" >
                <div class="col-12" style="margin-top:50px">
                    <h1
                        class="card-title text-white font-weight-bold text-center m-b-0"
                        >
                        Your Cart
                    </h1>
                    <div class="card border rounded-0">
                        <div class="card-body text-center"></div>
                        <div class="table-responsive">
                            <table class="table">
                                <thead class="thead-light">
                                    <tr>
                                        <th></th>
                                        <th scope="col">No.</th>
                                        <th scope="col">Course Name</th>
                                        <th scope="col">Price</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <!--Main Items--> 
                                <%int total = 0;
                                    int i = 1;
                                  
                                    while (rs.next()) {

                                        total = total + Integer.parseInt(rs.getString("course_price"));
                                %>
                                <tbody class="customtable">
                                    <tr>

                                        <td></td>
                                        <td><%= i%></td>

                                        <td>
                                            <form action="Course.jsp" method="get">
                                                <button class="btn default"><%= rs.getString("course_name")%></button>
                                                <input type="hidden" name="id" value="<%= rs.getString("cid")%>" />
                                            </form>
                                        </td>
                                        <td><%= rs.getString("course_price")%></td>
                                        <td>
                                            <form action="Controller" method="post">
                                                <input type="hidden" name="course_id" value="<%=rs.getString("cid")%>">
                                                <input type="hidden" name="username" value="<%= session.getAttribute("username")%>">
                                                <button
                                                    class="btn btn-danger btn-sm rounded"
                                                    type="submit"
                                                    name="delete"
                                                    value="<%= rs.getString("cid")%>"
                                                    title="Delete"
                                                    style="width: 100px"
                                                    >
                                                    <i class="fa fa-trash"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </tbody>
                                <% i++;
                                    }%>
                                <!--Main Items End-->
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col"> <span style="font-weight: bold; font-size: large;">Total<span></th>
                                                    <th scope="col"></th>
                                                    <th scope="col"><%= total%></th>
                                                    <th>
                                                        <form action="payment.jsp" method="post">
                                                            <button class="btn btn-success " name = "EnrollCourse" value="true" style="width: 150px">Enroll</button>
                                                            <input type="hidden" name="total" value="<%= total %>"
                                                            <input type="hidden" name="username" value="<%= session.getAttribute("username")%>">
                                                        </form>
                                                    </th>
                                                    </tr>
                                                    </thead>

                                                    </table>
                                                    </div>
                                                    </div>
                                                    </div>
                                                    </div>
                                                    </div>
                                                    </body>
                                                    </html>
                                                    </body>
                                                    </html>
                                                    <%
                                                        } catch (Exception e) {
                                                            System.out.println(e);
                                                            out.print(e);
                                                        } finally {
                                                            con.close();

                                                        }
                                                    %>
