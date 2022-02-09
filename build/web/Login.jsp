<!DOCTYPE html>


<%@page import="java.util.HashSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="main.*" %>
<%@page import="java.sql.*" %>
<%@page import="main.util.*" %>
<%
    if (request.getParameter("login") != null) {
        
        String result[] = util.login(request.getParameter("username"), request.getParameter("password"));
        if (result[0].equals("logedin")) {
            if(request.getParameter("remember")!=null){
                Cookie ck = new Cookie("username", request.getParameter("username"));
                Cookie ck1 = new Cookie("name", result[2]);
//                86400 is seconds of one day ..
                ck.setMaxAge(86400*30);
                ck1.setMaxAge(86400*30);
                response.addCookie(ck);
                response.addCookie(ck1);
            }
            else{
                session.setAttribute("username", request.getParameter("username"));
                session.setAttribute("name", result[2]);
    
    
            }
            util.alert(out, result[1]);
            out.println("<meta http-equiv='refresh' content='1;URL=index.jsp'>");

        } else {
            util.alert(out, result[1]);
            System.out.println(result[1]);
        }

    }
%>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Register Here</title>
        <link
            href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
            rel="stylesheet"
            id="bootstrap-css"
            />
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
    </head>
    <style>
        .register {
            background: -webkit-linear-gradient(left, #3931af, #00c6ff);
            margin-top: 10px;
            padding: 3%;
        }
        .register-left {
            text-align: center;
            color: #fff;
            margin-top: 4%;
        }
        .register-left input {
            border: none;
            border-radius: 1.5rem;
            padding: 2%;
            width: 60%;
            background: #f8f9fa;
            font-weight: bold;
            color: #383d41;
            margin-top: 30%;
            margin-bottom: 3%;
            cursor: pointer;
        }
        .register-right {
            background: #f8f9fa;
            border-top-left-radius: 10% 50%;
            border-bottom-left-radius: 10% 50%;
        }
        .register-left img {
            margin-top: 15%;
            margin-bottom: 5%;
            width: 25%;
            -webkit-animation: mover 2s infinite alternate;
            animation: mover 1s infinite alternate;
        }
        @-webkit-keyframes mover {
            0% {
                transform: translateY(0);
            }
            100% {
                transform: translateY(-20px);
            }
        }
        @keyframes mover {
            0% {
                transform: translateY(0);
            }
            100% {
                transform: translateY(-20px);
            }
        }
        .register-left p {
            font-weight: lighter;
            padding: 12%;
            margin-top: -9%;
        }
        .register .register-form {
            padding: 10%;
            margin-top: 10%;
        }
        .btnRegister {
            float: right;
            margin-top: 10%;
            border: none;
            border-radius: 1.5rem;
            padding: 2%;
            background: #0062cc;
            color: #fff;
            font-weight: 600;
            width: 50%;
            cursor: pointer;
        }
        .register .nav-tabs {
            margin-top: 3%;
            border: none;
            background: #0062cc;
            border-radius: 1.5rem;
            width: 28%;
            float: right;
        }
        .register .nav-tabs .nav-link {
            padding: 2%;
            height: 34px;
            font-weight: 600;
            color: #fff;
            border-top-right-radius: 1.5rem;
            border-bottom-right-radius: 1.5rem;
        }
        .register .nav-tabs .nav-link:hover {
            border: none;
        }
        .register .nav-tabs .nav-link.active {
            width: 100px;
            color: #0062cc;
            border: 2px solid #0062cc;
            border-top-left-radius: 1.5rem;
            border-bottom-left-radius: 1.5rem;
        }
        .register-heading {
            text-align: center;
            margin-top: 8%;
            margin-bottom: -15%;
            color: #495057;
        }
    </style>
    <body class="register">
        <div class="container">
            <div class="row">
                <div class="col-md-3 register-left">
                    <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
                    <h3>Welcome</h3>
                    <p>You are 30 seconds away from earning your own money!</p>
                    <form action="Register.jsp">
          <input type="submit" name="" value="Register" /><br />
          </form>
                </div>
                <div class="col-md-7 register-right">
                    <div class="tab-content" id="myTabContent">
                        <div
                            class="tab-pane fade show active"
                            id="home"
                            role="tabpanel"
                            aria-labelledby="home-tab"
                            >
                            <h3 class="register-heading">Login Here</h3>
                            <div class="row register-form mx-4">
                                <div class="col-md-8 ">
                                    <form action="Login.jsp" method="POST">
                                        <div class="form-group">

                                            <div class="form-group"  >
                                                <input
                                                    type="text"
                                                    style="width:300px"
                                                    name ="username"
                                                    class="form-control"
                                                    placeholder="Username"

                                                    />
                                            </div>
                                            <div class="form-group">
                                                <input
                                                    type="password"
                                                    class="form-control"
                                                    name="password"
                                                    style="width:300px"
                                                    placeholder="Password  *"
                                                    value=""
                                                    />
                                                <div class="form-check">
  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
  <label class="form-check-label" for="flexCheckDefault">
    Remember Me
  </label>
</div>
                                            </div>



                                            <input type="submit" name="login" class="btnRegister" value="Login" />
                                    </form>
                                </div>
                                <!-- </div> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>var intrest = document.getElementsByName("intrest");
            console.log(intrest.values)
        </script>
    </body>
</html>
