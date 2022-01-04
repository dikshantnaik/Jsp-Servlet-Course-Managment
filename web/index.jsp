<%-- 
    Document   : index2
    Created on : 04-Jan-2022, 6:14:31 pm
    Author     : dikshant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="main.*" %>
<%@page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<%
    boolean LogedIn = false;
    String query = "SELECT * FROM available_course";
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
                            <h5 class="text-white p-2 py-1" ><%= session.getValue("name")%></h5>
                            <li class="nav-item">
                                <form action="Controller" method="post"> 
                                    <button href="#learn" class=" btn btn-outline-primary px-3" name="logout" value="logoiut" style="height: 40px;">Log Out</button>
                                </form>
                            </li>


                        </ul>
                        <%                            } else {
                        %>

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

                         





                                <!-- Question Accordion -->
                                <section  id= "course" class="p-5 bg-primary">
                                    <div class="container">
                                        <h1 class="text-center text-white mb-4">Available Courses </h1>
                                        <div class="container mt-5 mb-5">
                                            <div class="d-flex justify-content-center row">
                                                <div class="col-md-10">
                                                    <!-- MAIN CARD -->
                                                    <%while (rs.next()) {%>
                                                    <div class="row bg-light  p-2 border rounded mt-2">
                                                        <div class="col-md-3 mt-1">
                                                            <img
                                                                class="img-fluid img-responsive rounded product-image"
                                                                src="https://prod-discovery.edx-cdn.org/media/course/image/156313d6-f892-4b08-9cee-43ea582f4dfb-7b98c686abcc.small.png"
                                                                />
                                                        </div>
                                                        <div class="col-md-6 mt-1">
                                                            <h3><%= rs.getString("course_name")%></h3>
                                                            <div class="d-flex flex-row">
                                                                <div class="ratings mr-2">
                                                                    <i class="fa fa-star" aria-hidden="true"></i>

                                                                </div>
                                                                <svg style="margin-left: 3px ; margin-top:3px ;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                                                <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                                                </svg> <span class="">5.2</span>
                                                            </div>
                                                            <div class="mt-1 mb-1 spec-1">
                                                                <span>100% cotton</span><span class="dot"></span
                                                                ><span>Light weight</span><span class="dot"></span
                                                                ><span>Best finish<br /></span>
                                                            </div>
                                                            <div class="mt-1 mb-1 spec-1">
                                                                <span>Unique design</span><span class="dot"></span
                                                                ><span>For men</span><span class="dot"></span
                                                                ><span>Casual<br /></span>
                                                            </div>
                                                            <p class="text-justify text-truncate para mb-0">
                                                                There are many variations of passages of Lorem Ipsum available,
                                                                but the majority have suffered alteration in some form, by
                                                                injected humour, or randomised words which don't look even
                                                                slightly believable.<br /><br />
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
                                                                <h4 class="mr-1"><%= rs.getInt("course_prize")%> Rs</h4>

                                                            </div>
                                                            <h6 class="text-success"> *Includes Certificate</h6>
                                                            <div class="d-flex flex-column mt-4">
                                                                <button class="btn btn-primary btn-sm" type="button">
                                                                    Details</button
                                                                ><button
                                                                    class="btn btn-outline-primary btn-sm mt-2"
                                                                    type="button"
                                                                    >
                                                                    Add to Cart
                                                                </button>
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
                                </html>
                                <%
                                    } catch (Exception e) {
                                        System.out.println(e);
                                        out.print(e);
                                    } finally {
                                        con.close();

                                    }
                                %>

