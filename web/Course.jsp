<%-- 
    Document   : Course
    Created on : 28-Dec-2021, 6:11:23 pm
    Author     : dikshant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="main.*" %>
<%@page import="java.sql.*" %>
<%
    String course_id = request.getParameter("course_id");
    String query = "SELECT * FROM available_course where course_id=" + course_id;
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

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <style>
        .discription {
            font-size: 12px;
        }
        body::before {
            display: block;
            content: "";
            height: 60px;
        }

        #map {
            width: 100%;
            height: 100%;
            border-radius: 10px;
        }

        @media (min-width: 768px) {
            .news-input {
                width: 50%;
            }
        }

        @media (min-width: 1025px) {
            .h-custom {
                height: 100vh !important;
            }
        }

    </style>
    <body
        class="bg-primary text-dark p-4 p-lg-0 pt-lg-5 text-center text-sm-start"
        >
        <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 fixed-top">
            <div class="container">
                <a href="index.jsp" class="btn btn-primary font-weight-bold">Go Back</a>
            </div>
        </nav>

        <section>
            <% while (rs.next()) {%>
            <div
                class="container bg-light p-4"
                style="margin-left: 100px; height: auto"
                >
                <div class="row">
                    <div class="col-8 text">
                        <h1 class="text-center"><%= rs.getString("course_name")%></h1>
                        <span style="font-style: italic; padding-top: 50px; font-size: 35px"
                              >About course
                        </span>
                        <br />
                        <p style="text-align: left">
                            <%= rs.getString("course_discription")%>
                        </p>
                    </div>
                    <div class="col border-left">
                        <div class="row-10" style="margin-bottom: 30px; margin-left: 30px; padding: 20px">
                            <h6 style="">Offered by : <%= rs.getString("offered_by")%></h6>


                            <form action="Controller" method="post">
                                <button
                                    class="btn btn-primary "
                                    name ="addToCart"
                                    value="addToCary"
                                    type="submit"
                                    style="height:70px ; width: 200px"
                                    >
                                    Add to Cart
                                </button
                                <input type="hidden" name="id1" value="1"/>
                                <input type="hidden" name="course_id" value="<%=rs.getString("course_id")%>">

                                <input type="hidden" name="username" value="<%= session.getAttribute("username")%>" />
                            </form>
                        </div>

                        <div class="row">
                            <h5 class="font-weight-bold">- Flexible deadlines</h5>
                            <p style="font-size: smaller; font-style: italic">
                                Reset deadlines in accordance to your schedule.
                            </p>
                        </div>
                        <div class="row">
                            <h5 class="font-weight-bold">- Shareable Certificate</h5>
                            <p style="font-size: smaller; font-style: italic">
                                Earn a certificate upon completion issued by the institution
                                that created the course.
                            </p>
                        </div>
                        <div class="row">
                            <h5 class="font-weight-bold">- 100% online</h5>
                            <p style="font-size: smaller; font-style: italic">
                                Start instantly and learn at your own schedule.
                            </p>
                        </div>
                        <div class="row">
                            <h5 class="font-weight-bold">- English</h5>
                            <p style="font-size: smaller; font-style: italic">
                                Subtitles: Arabic, French, Portuguese (European), Italian,
                                Vietnamese, Korean, German, Russian, English, Spanish
                            </p>
                        </div>
                    </div>
                </div>
                <% }
                    } catch (Exception e) {
//        System.out.println(e);
                        out.println(e);
                    } %>
                <!-- Review Div -->
                <span style="font-style: italic; padding-top: 50px; font-size: 35px"
                      >Reviews
                </span>
                <div class="container">
                    <%
                        
                        
                        String review_query = "SELECT students.student_name,students_revive FROM `review`,students WHERE review.studentid = students.studentid AND course_id = " + course_id ;
                        
                        PreparedStatement stmt1;
                        try {

                            stmt1 = con.prepareStatement(review_query);
                            ResultSet rs = stmt1.executeQuery();
                               while (rs.next()) {

                    %>
                    <div class="card mt-3" style="height: 4cm;">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <img
                                        src="https://image.ibb.co/jw55Ex/def_face.jpg"
                                        class="img img-rounded img-fluid"
                                        style="height: 70px; width: 70px"
                                        />
                                </div>
                                <div class="col-md-10">
                                    <p>
                                        <strong><%=rs.getString("student_name") %></strong>
                                        
                                    </p>
                                    <div class="clearfix"></div>
                                    <p>
                                        <%= rs.getString("students_revive") %>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                                        <%}%>
                </div>
                <div
                    class="container border rounded-0"
                    style="

                    margin-top: 1cm;
                    margin-bottom: 1cm;
                    padding: 1cm;

                    border-radius: 1cm;
                    "
                    >
                    <form action="Controller" method="post">

                        <input type="hidden" name="course_id" value=<%=request.getParameter("course_id")%>>
                        <input type="hidden" name="username" value="<%= session.getAttribute("username")%>">
                        <input
                            class="form-control"
                            type="text"
                            placeholder="Enter your Review"

                            name="review"


                            />
                        <button type="submit" class="btn btn-primary" name="SubmitReview"> Submit Review</button>
                    </form>
                </div>
            </div>
        </section>
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