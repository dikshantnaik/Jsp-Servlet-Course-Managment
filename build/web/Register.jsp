
<%@page import="java.util.List"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="main.*" %>
<%@page import="java.sql.*" %>


<%

    if (request.getParameter("register") != null) {

        
        String result[] = util.register(request.getParameter("username"), request.getParameter("password"),request.getParameter("name"),request.getParameter("stream"));

        if (result[0].equals("registered")) {
//        alert(out, "Registered..Please Login to Continue");
//        response.sendRedirect("Login.jsp");
            util.alert(out, result[1]);
            out.println("<meta http-equiv='refresh' content='1;URL=Login.jsp'>");//redirects after 3 seconds

        } else {
            util.alert(out, result[1]);
            System.out.println(result[1]);
        }

    }
%>


<!DOCTYPE html>
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
 
  <body class="register">
    <div class="container">
      <div class="row">
        <div class="col-md-3 register-left">
          <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
          <h3>Welcome</h3>
          <p>You are 30 seconds away from earning your own money!</p>
          <form action="Login.jsp">
          <input type="submit" name="" value="Login" /><br />
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
              <h2 class="register-heading">Register </h2>
              <div class="row register-form">
                <div class="col-md-8">
                  <div class="form-group">
                    <form action="Register.jsp" method="get">
                    <input
                      type="text"
                      name ="name"
                      class="form-control"
                      placeholder="Name "
                      value=""
                    />
                  </div>

                  <div class="form-group">
                       <div class="form-group">
                    <input
                      type="text"
                      name="email"
                      class="form-control"
                      placeholder="Email"
                      value=""
                    />
                  </div>
                    <input
                      type="text"
                      name="username"
                      class="form-control"
                      placeholder="Username"
                      value=""
                    />
                  </div>
                 
                  <div class="form-group">
                    <input
                      type="password"
                      name="password"
                      class="form-control"
                      placeholder="Password"
                      value=""
                    />
                  </div>
                  <select
                    class="form-select form-select-sm"
                    aria-label=".form-select example"
                    name = "stream"
                    style="
                      width: 60%;
                      border: 10 solid blue;
                      background-color: white;
                    "
                  >
                    <option selected>Select Stream </option>
                    <option value="Computer Science">Computer Science</option>
                    <option value="Artifical Inteligenc">Artifical Inteligenc</option>
                    <option value="MBA">MBA</option>
                  </select>

                  <input type="submit" name="register" class="btnRegister" value="Register" />
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
</html>
