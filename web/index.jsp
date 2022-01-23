<%-- 
    Document   : index2
    Created on : 04-Jan-2022, 6:14:31 pm
    Author     : dikshant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="main.*" %>
<%@page import="java.sql.*" %>


<%
    boolean LogedIn = false;

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
        session.setAttribute("LogedIn", "true");
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
    </head>
    <body>
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

                <div class="collapse navbar-collapse" id="navmenu">
                    <ul class="navbar-nav ms-auto mx-5 ">


                        <% if (LogedIn) {

                        %>
                        <ul class="navbar-nav ms-auto mx-5 ">

                            <li class="nav-item">
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

        <!-- Showcase -->
        <section
            class="bg-dark text-light p-4 p-lg-0 pt-lg-5 text-center text-sm-start"
            >
            <div class="container">
                <div class="d-sm-flex align-items-center justify-content-between">
                    <div>
                        <%
                            if (LogedIn) {
                        %>
                        <h2>Welcome, <span class="text-warning"> <%=session.getValue("name")%></span></h>
                            <p class="lead my-3">
                                We focus on teaching our students the fundamentals of the latest
                                and greatest technologies to prepare them for their first dev role
                            </p>
                            <a
                                class="btn btn-primary btn-lg"

                                href="#course"
                                >
                                Browse Course  
                            </a>
                            <%
                            } else {
                            %>

                            <h2>Become a Certified <span class="text-warning"> Developer </span></h>
                                <p class="lead my-3">
                                    We focus on teaching our students the fundamentals of the latest
                                    and greatest technologies to prepare them for their first dev role
                                </p>

                                <a
                                    href="Register.jsp"
                                    class="btn btn-primary btn-lg"

                                    >
                                    Register Now  
                                </a>
                                <% } %>



                                </div>
                                <img
                                    class="img-fluid w-50  d-none d-sm-block"
                                    src="img/showcase.svg"
                                    alt=""
                                    />
                                </div>
                                </div>
                                </section>




                                <!--Enroled Course--> 

                                <% if (LogedIn) {%>
                                <!-- Enrolled Course Sections -->
                                <%
                                    String query = "SELECT available_course.course_name,enrolled_date FROM enrolled_course,available_course WHERE enrolled_course.course_id = available_course.course_id and student_id=(SELECT studentid FROM students WHERE username=\"" + session.getAttribute("username") + "\") Group by course_name";
                                    Connection con = Dao.initSql();
                                    PreparedStatement stmt;
                                    try {

                                        stmt = con.prepareStatement(query);
                                        ResultSet rs = stmt.executeQuery();

                                %>
                                <section id="instructors" class="p-5 bg-primary border-bottom">
                                    <div class="container">
                                        <h2 class="text-center text-white">Enrolled Course</h2>

                                        <div class="row g-4">
                                            <% while (rs.next()) {%>
                                            <div class="col-md-6 col-lg-3">
                                                <div class="card bg-light">

                                                    <div class="card-body text-center">
                                                        <img
                                                            src="https://prod-discovery.edx-cdn.org/media/course/image/156313d6-f892-4b08-9cee-43ea582f4dfb-7b98c686abcc.small.png"
                                                            class="img-fluid img-responsive rounded product-image"
                                                            alt=""
                                                            />
                                                        <h5 class="card-title mb-3 my-3"> <%=rs.getString("course_name")%></h5>
                                                        <p class="card-text">

                                                        </p>
                                                    </div>
                                                </div>

                                            </div>
                                            <%}%>

                                        </div>
                                    </div>
                                </section>

                                <%} catch (SQLException e) {
                                            System.out.println(e);
                                        }
                                    }%>


                                <!-- Avalible  COurse  -->
                                <section  id= "course" class="p-5 bg-primary">
                                    <div class="container">
                                        <h1 class="text-center text-white mb-4">Available Courses </h1>
                                        <div class="container mt-5 mb-5">
                                            <div class="d-flex justify-content-center row">
                                                <div class="col-md-10">
                                                    <!-- MAIN CARD -->

                                                    <%
                                                        String query = "SELECT * FROM available_course LIMIT 5";
                                                        Connection con = Dao.initSql();
                                                        PreparedStatement stmt;
                                                        try {

                                                            stmt = con.prepareStatement(query);
                                                            ResultSet rs = stmt.executeQuery();
                                                            while (rs.next()) {%>
                                                    <a style= "
                                                       text-decoration: none;"href="Course.jsp?course_id= <%= rs.getString("course_id")%>" >
                                                        <div class="row bg-light  p-2 border rounded mt-2">
                                                            <div class="col-md-3 mt-1">
                                                                <img
                                                                    class="img-fluid img-responsive rounded product-image my-3"
                                                                    src="https://prod-discovery.edx-cdn.org/media/course/image/156313d6-f892-4b08-9cee-43ea582f4dfb-7b98c686abcc.small.png"
                                                                    />
                                                            </div>
                                                            <div class="col-md-6 mt-1 ">
                                                                <h3 style="color: black"><%= rs.getString("course_name")%></h3>
                                                              
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
                                                                <p style="color: black"class="text-wrap text-truncate para mb-0">
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
                                                                    <h4 class="mr-1" style="color: #B12704;"> ₹ <%= rs.getInt("course_price")%></h4>

                                                                </div>
                                                                <h6 class="text-success"> *Includes Certificate</h6>
                                                                <form action="Course.jsp" >
                                                                    <div class="d-flex flex-column mt-4">

                                                                        <button class="btn btn-primary btn-sm" type="submit">
                                                                            Details</button
                                                                        >
                                                                        <input type="hidden" name="course_id" value="<%= rs.getString("course_id")%>"/>
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
                                                </a>
                                                <!-- End MAIN CARd -->
                                                <% }%>
                                                <div class="text-center">
                                                    <a href="Courses.jsp"class="btn btn-light align-content-center my-4"> More Course </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                </section>

                                <section id="instructors" class="p-5 bg-primary">
                                    <div class="container">
                                        <h2 class="text-center text-white">Our Instructors</h2>
                                        <p class="lead text-center text-white mb-5">
                                            Our instructors all have 5+ years working as a web developer in the
                                            industry
                                        </p>
                                        <div class="row g-4">
                                            <div class="col-md-6 col-lg-3">
                                                <div class="card bg-light">
                                                    <div class="card-body text-center">
                                                        <img
                                                            src="https://randomuser.me/api/portraits/men/11.jpg"
                                                            class="rounded-circle mb-3"
                                                            alt=""
                                                            />
                                                        <h3 class="card-title mb-3">John Doe</h3>
                                                        <p class="card-text">
                                                            Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                                            Assumenda accusamus nobis sed cupiditate iusto? Quibusdam.
                                                        </p>
                                                        <a href="#"><i class="bi bi-twitter text-dark mx-1"></i></a>
                                                        <a href="#"><i class="bi bi-facebook text-dark mx-1"></i></a>
                                                        <a href="#"><i class="bi bi-linkedin text-dark mx-1"></i></a>
                                                        <a href="#"><i class="bi bi-instagram text-dark mx-1"></i></a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6 col-lg-3">
                                                <div class="card bg-light">
                                                    <div class="card-body text-center">
                                                        <img
                                                            src="https://randomuser.me/api/portraits/women/11.jpg"
                                                            class="rounded-circle mb-3"
                                                            alt=""
                                                            />
                                                        <h3 class="card-title mb-3">Jane Doe</h3>
                                                        <p class="card-text">
                                                            Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                                            Assumenda accusamus nobis sed cupiditate iusto? Quibusdam.
                                                        </p>
                                                        <a href="#"><i class="bi bi-twitter text-dark mx-1"></i></a>
                                                        <a href="#"><i class="bi bi-facebook text-dark mx-1"></i></a>
                                                        <a href="#"><i class="bi bi-linkedin text-dark mx-1"></i></a>
                                                        <a href="#"><i class="bi bi-instagram text-dark mx-1"></i></a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6 col-lg-3">
                                                <div class="card bg-light">
                                                    <div class="card-body text-center">
                                                        <img
                                                            src="https://randomuser.me/api/portraits/men/12.jpg"
                                                            class="rounded-circle mb-3"
                                                            alt=""
                                                            />
                                                        <h3 class="card-title mb-3">Steve Smith</h3>
                                                        <p class="card-text">
                                                            Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                                            Assumenda accusamus nobis sed cupiditate iusto? Quibusdam.
                                                        </p>
                                                        <a href="#"><i class="bi bi-twitter text-dark mx-1"></i></a>
                                                        <a href="#"><i class="bi bi-facebook text-dark mx-1"></i></a>
                                                        <a href="#"><i class="bi bi-linkedin text-dark mx-1"></i></a>
                                                        <a href="#"><i class="bi bi-instagram text-dark mx-1"></i></a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6 col-lg-3">
                                                <div class="card bg-light">
                                                    <div class="card-body text-center">
                                                        <img
                                                            src="https://randomuser.me/api/portraits/women/12.jpg"
                                                            class="rounded-circle mb-3"
                                                            alt=""
                                                            />
                                                        <h3 class="card-title mb-3">Sara Smith</h3>
                                                        <p class="card-text">
                                                            Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                                            Assumenda accusamus nobis sed cupiditate iusto? Quibusdam.
                                                        </p>
                                                        <a href="#"><i class="bi bi-twitter text-dark mx-1"></i></a>
                                                        <a href="#"><i class="bi bi-facebook text-dark mx-1"></i></a>
                                                        <a href="#"><i class="bi bi-linkedin text-dark mx-1"></i></a>
                                                        <a href="#"><i class="bi bi-instagram text-dark mx-1"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>


                                <!-- Modal -->

                                <script
                                    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
                                    integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
                                    crossorigin="anonymous"
                                ></script>
                                <script src="https://api.mapbox.com/mapbox-gl-js/v2.1.1/mapbox-gl.js"></script>


                                </body>
                                <footer> Frontend Taken from : https://www.frontendbootcampdemo.com/ 
                                    https://github.com/bradtraversy/bootstrap-bootcamp-website
                                </footer>
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

