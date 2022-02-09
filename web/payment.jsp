<%-- 
    Document   : payment
    Created on : 30-Jan-2022, 8:36:33 pm
    Author     : dikshant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Snippet - BBBootstrap</title>
        <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css' rel='stylesheet'>
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
       
        <% int course_price = Integer.parseInt(request.getParameter("total"));
//        2 % Charge 
           double fees = 0.02 * course_price ;
           double total = fees + course_price;
        %>
    </head>
    <body oncontextmenu='return false' class='snippet-body'>
        <div class="container bg-light d-md-flex align-items-center">
            <div class="card box1 shadow-sm p-md-5 p-md-5 p-4">
                
                <div class="d-flex flex-column">
                    <div class="d-flex align-items-center justify-content-between text"> <h6 class="">Course Price </h6> <h6>$<%=course_price%></h6> </div>
                    <div class="d-flex align-items-center justify-content-between text"> <h6 class="">Transaction fee 2%</h6><h6 class="ps-1">$<%=fees%></h6> </div>
                    <div class="d-flex align-items-center justify-content-between text mb-4"> <h5>Total</h5> <h5 class="ps-1">$<%= total %></h5> </div>
                    <div class="border-bottom mb-4"></div>
                    
                    
                   
                </div>
            </div>
            <div class="card box2 shadow-sm">
                <div class="d-flex align-items-center justify-content-between p-md-5 p-4"> <span class="h5 fw-bold m-0">Payment methods</span>
                    <div class="btn btn-primary bar"><span class="fas fa-bars"></span></div>
                </div>
                <ul class="nav nav-tabs mb-3 px-md-4 px-2">
                    <li class="nav-item"> <a class="nav-link px-2 active" aria-current="page" href="#">Credit Card</a> </li>
                    
                </ul>
                
                <form action="Controller" method="post">
                    <div class="row">
                        <div class="col-12">
                            <div class="d-flex flex-column px-md-5 px-4 mb-4"> <span>Credit Card</span>
                                <div class="inputWithIcon"> <input class="form-control" name = "card_no" type="text" placeholder="5136 1845 5468 3894"> <span class=""> <img src="https://www.freepnglogos.com/uploads/mastercard-png/mastercard-logo-logok-15.png" alt=""></span> </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="d-flex flex-column ps-md-5 px-md-0 px-4 mb-4"> <span>Expiration<span class="ps-1">Date</span></span>
                                <div class="inputWithIcon"> <input name = "edate" type="date" class="form-control" value="05/20">  </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="d-flex flex-column pe-md-5 px-md-0 px-4 mb-4"> <span>Code CVV</span>
                                <div class="inputWithIcon"> <input name="cvv" type="password" class="form-control" > <span class="fas fa-lock"></span> </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="d-flex flex-column px-md-5 px-4 mb-4"> <span>Name</span>
                                <div class="inputWithIcon"> <input class="form-control text-uppercase" name="name" type="text" placeholder=""> <span class="far fa-user"></span> </div>
                            </div>
                        </div>
                        <div class="col-12 px-md-5 px-4 mt-3">
                            <input  type="hidden" name="username" value="<%=session.getAttribute("username")%>">
                            <input  type="hidden" name="course_price" value="<%=course_price %>">
                            <input  type="hidden" name="total" value="<%=total%>">
                            <input  type="hidden" name="fee" value="<%=fees%>">
                            <button type="submit" name= "payment" value="payment" class="btn btn-primary w-100">Pay $<%=total%>.00</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script type='text/javascript' src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js'></script>
        <script type='text/javascript' src=''></script>
        <script type='text/javascript' src=''></script>
        <script type='text/Javascript'></script>
         <style>
             

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                list-style: none;
                font-family: 'Montserrat', sans-serif
            }

            body {
               background: rgb(2,0,36);
background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(1,86,152,1) 9%, rgba(1,142,226,1) 23%, rgba(1,136,218,1) 33%, rgba(2,125,217,1) 54%, rgba(2,117,216,1) 73%, rgba(0,212,255,1) 100%);
            }

            .container {
                margin: 20px auto;
                width: 800px;
                padding: 30px
            }

            .card.box1 {
                width: 350px;
                height: 500px;
                /*background-color: #3ecc6d;*/
                background: rgb(55,186,212);
background: linear-gradient(90deg, rgba(55,186,212,1) 7%, rgba(60,155,236,1) 64%);
                color: #baf0c3;
                border-radius: 0
            }

            .card.box2 {
                width: 450px;
                height: 580px;
                background-color: #ffffff;
                border-radius: 0
            }

            .text {
                font-size: 13px
            }

            .box2 .btn.btn-primary.bar {
                width: 20px;
                background-color: transparent;
                border: none;
                color: #3c9bec
            }

            .box2 .btn.btn-primary.bar:hover {
                color: #baf0c3
            }

            .box1 .btn.btn-primary {
                background-color: #57c97d;
                width: 45px;
                height: 45px;
                display: flex;
                justify-content: center;
                align-items: center;
                border: 1px solid #ddd
            }

            .box1 .btn.btn-primary:hover {
                background-color: #f6f8f7;
                color: #57c97d
            }

            .btn.btn-success {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background-color: #ddd;
                color: black;
                display: flex;
                justify-content: center;
                align-items: center;
                border: none
            }

            .nav.nav-tabs {
                border: none;
                border-bottom: 2px solid #ddd
            }

            .nav.nav-tabs .nav-item .nav-link {
                border: none;
                color: black;
                border-bottom: 2px solid transparent;
                font-size: 14px
            }

            .nav.nav-tabs .nav-item .nav-link:hover {
                border-bottom: 2px solid #3c9bec;
                color: #05cf48
            }

            .nav.nav-tabs .nav-item .nav-link.active {
                border: none;
                border-bottom: 2px solid #3c9bec
            }

            .form-control {
                border: none;
                border-bottom: 1px solid #ddd;
                box-shadow: none;
                height: 20px;
                font-weight: 600;
                font-size: 14px;
                padding: 15px 0px;
                letter-spacing: 1.5px;
                border-radius: 0
            }

            .inputWithIcon {
                position: relative
            }

            img {
                width: 50px;
                height: 20px;
                object-fit: cover
            }

            .inputWithIcon span {
                position: absolute;
                right: 0px;
                bottom: 9px;
                color: #57c97d;
                cursor: pointer;
                transition: 0.3s;
                font-size: 14px
            }

            .form-control:focus {
                box-shadow: none;
                border-bottom: 1px solid #ddd
            }

            .btn-outline-primary {
                color: black;
                background-color: #ddd;
                border: 1px solid #ddd
            }

            .btn-outline-primary:hover {
                background-color: #05cf48;
                border: 1px solid #ddd
            }

            .btn-check:active+.btn-outline-primary,
            .btn-check:checked+.btn-outline-primary,
            .btn-outline-primary.active,
            .btn-outline-primary.dropdown-toggle.show,
            .btn-outline-primary:active {
                color: #baf0c3;
                background-color: #3ecc6d;
                box-shadow: none;
                border: 1px solid #ddd
            }

            .btn-group>.btn-group:not(:last-child)>.btn,
            .btn-group>.btn:not(:last-child):not(.dropdown-toggle),
            .btn-group>.btn-group:not(:first-child)>.btn,
            .btn-group>.btn:nth-child(n+3),
            .btn-group>:not(.btn-check)+.btn {
                border-radius: 50px;
                margin-right: 20px
            }

            form {
                font-size: 14px
            }

            form .btn.btn-primary {
                width: 100%;
                height: 45px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                background-color: #3ecc6d;
                border: 1px solid #ddd
            }

            form .btn.btn-primary:hover {
                background-color: #05cf48
            }

            @media (max-width:750px) {
                .container {
                    padding: 10px;
                    width: 100%
                }

                .text-green {
                    font-size: 14px
                }

                .card.box1,
                .card.box2 {
                    width: 100%
                }

                .nav.nav-tabs .nav-item .nav-link {
                    font-size: 12px
                }
            }</style>
    </body>
    
</html>