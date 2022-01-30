<%-- 
    Document   : navbar
    Created on : 23-Jan-2022, 9:41:20 pm
    Author     : dikshant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    boolean LogedIn = false;
    if(session.getAttribute("username")!=null){
     LogedIn = true;
}
    %>
    <head >
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
    </head>
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
