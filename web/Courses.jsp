

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="main.*" %>
<%@page import="java.sql.*" %>

<%
    boolean LogedIn = false;
    String query = "SELECT * FROM available_course ";
    Connection con = Dao.initSql();
    PreparedStatement stmt;
    try {

        stmt = con.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();
           Cookie[] ck = request.getCookies();
        if (ck != null) {
            for (int i = 0; i < ck.length; i++) {
                if (ck[i].getName().equals("name")) {
                    session.setAttribute("name", ck[i].getValue());
                } else if (ck[i].getName().equals("username")) {
                    session.setAttribute("username", ck[i].getValue());
                }
            }
        }

        if (session.getAttribute("username") != null && session.getAttribute("name") != null) {
            LogedIn = true;
            session.setAttribute("LogedIn","true");
        }
%>

<!DOCTYPE html>
<html lang="en">
     <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="style2.css" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"
            />
        <link
            href="https://api.mapbox.com/mapbox-gl-js/v2.1.1/mapbox-gl.css"
            rel="stylesheet"
            />

        <title >Course Management </title>
    </head >
    <body class="bg-primary">

<!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 fixed-top">
            <div class="container ">
                <a href="index.jsp" class="navbar-brand font-weight-bold">Course Management</a>

                <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navmenu"
                    >
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse"  id="navmenu">
                    <ul class="navbar-nav ms-auto mx-5 " >


                        <% if (LogedIn) {

                        %>
                        <ul class="navbar-nav ms-auto mx-5 " >

                            <li class="nav-item" >
                                <form action="Controller" method="post"> 
                                    <a href="Cart.jsp" class="btn btn-primary" style="width:150px"> My Cart</a>
                                    <button class=" btn btn-outline-danger px-3" name="logout" value="logoiut" style="height: 40px;">Log Out</button>
                                </form>
                            </li>


                        </ul>
                        <%} else {%>

                        <ul class="navbar-nav ms-auto mx-5 ">
                            <li class="nav-item">
                                <a href="Register.jsp" class=" btn bg-primary text-white border rounded-1" style="height: 50px;">Register Now</a>
                            </li>
                            <li class="nav-item">
                                <a href="Login.jsp" class="btn btn-outline-primary mx-2" style="height: 50px;">Login</a>
                            </li>

                        </ul>
                        <%
                            }
                        %>

                    </ul>
                </div>
            </div>
        </nav>
                        
        <!-- Avalible  COurse  -->
        <section  id= "course" class="p-5 bg-primary">
            <div class="container align-content-center">
                <h1 class="text-center text-white mb-4">Available Courses </h1>
                <div class="container mt-5 mb-5">
                    <div class="d-flex justify-content-center row">
                        <div class="col-md-10">
                            <!-- MAIN CARD -->
                            <%while (rs.next()) {%>
                            <div class="row bg-light  p-2 border rounded mt-2">
                                <div class="col-md-3 mt-1">
                                    <img
                                        class="img-fluid img-responsive rounded product-image my-3"
                                        src="https://prod-discovery.edx-cdn.org/media/course/image/156313d6-f892-4b08-9cee-43ea582f4dfb-7b98c686abcc.small.png"
                                        />
                                </div>
                                <div class="col-md-6 mt-1 ">
                                    <h3><%= rs.getString("course_name")%></h3>
                                    <div class="d-flex flex-row">
                                        <div class="ratings mr-2">
                                            <i class="fa fa-star" aria-hidden="true"></i>

                                        </div>
                                        <svg style="margin-left: 3px ; margin-top:3px ;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                        <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                        </svg> <span class="">5.2</span>
                                    </div>
                                    <!--                                                            <div class="mt-1 mb-1 spec-1">
                                                                                                    <span>100% cotton</span><span class="dot"></span
                                                                                                    ><span>Light weight</span><span class="dot"></span
                                                                                                    ><span>Best finish<br /></span>
                                                                                                </div>
                                                                                                <div class="mt-1 mb-1 spec-1">
                                                                                                    <span>Unique design</span><span class="dot"></span
                                                                                                    ><span>For men</span><span class="dot"></span
                                                                                                    ><span>Casual<br /></span>
                                                                                                </div>-->
                                    <p class="text-wrap text-truncate para mb-0">
                                        There are many variations of passages of Lorem Ipsum available,
                                        .<br /><br />
                                    </p>
                                </div>
                                <div
                                    class="
                                    align-items-center align-content-center
                                    col-md-3
                                    border-left
                                    mt-1
                                    "
                                    >
                                    <div class="d-flex flex-row text-center " style="margin-left: 50px">
                                        <h4 class="mr-1"><%= rs.getInt("course_price")%> Rs</h4>

                                    </div>
                                    <h6 class="text-success"> *Includes Certificate</h6>
                                    <form action="Course.jsp" >
                                        <div class="d-flex flex-column mt-4">

                                            <button class="btn btn-primary btn-sm" type="submit">
                                                Details</button
                                            >
                                            <input type="hidden" name="id" value="<%= rs.getString("course_id")%>"/>
                                            <input type="hidden" name="name" value="<%= session.getAttribute("username")%>" />     
                                    </form>
                                    <form action="Controller" method="post" style="width: 500px;margin-left: 1px">
                                        <button
                                            class="btn btn-outline-primary btn-sm mt-2"
                                            name ="addToCart"
                                            value="addToCary"
                                            type="submit"
                                            style="width: 200px"
                                            >
                                            Add to Cart
                                        </button
                                        <input type="hidden" name="id1" value="1"/>
                                        <input type="hidden" name="course_id" value="<%=rs.getString("course_id")%>">

                                        <input type="hidden" name="username" value="<%= session.getAttribute("username")%>" />
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- End MAIN CARd -->
                        <% }%>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
 <%
                                    } catch (Exception e) {
                                        System.out.println(e);
                                        out.print(e);
                                    } finally {
                                        if (con != null) {
                                            con.close();
                                        } else {
                                            util.alert(out, "Please Start or check the DB connection");

                                        }

                                    }
                                %>
