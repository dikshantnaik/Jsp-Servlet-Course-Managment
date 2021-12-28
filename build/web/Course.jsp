<%-- 
    Document   : Course
    Created on : 28-Dec-2021, 6:11:23 pm
    Author     : dikshant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Document</title>
  <link rel="stylesheet" href="./style.css">
</head>

<body>

  <h1> Welcome, Dikshant</h1>
  <div class="content">
    <h1>Course You have Enrolled </h1>
    <ul>
      <li>Artificial Intelligence </li>
    </ul>
    <ul>
      <li>Data Science</li>
    </ul>
    <ul>
      <li>Python</li>
    </ul>
    <ul>
      <li>Data Science</li>
    </ul>

  </div>

  <div class="course_cont">
    <h1>Available Course </h1>



    <form action="index.php" method="post">
      <div class="course">
        <h1>Artificial Intelligence </h1>
        <h7>Combine the power of Data Science, Machine Learning and Deep Learning to create powerful AI for Real-World
          applications!</h7>
        <h8 style="font-size: 20px;"><br> Prize 1000 Rs</h8><button class="course_button button5 but_enr" type="submit"
          name="enrol_course" value="1" />Enroll Now</button>
      </div>
      <div class="course">
        <h1>Data Science</h1>
        <h7>Launch your career in data science. Gain foundational data science skills to prepare for a career or further
          advanced learning in data science.</h7>
        <h8 style="font-size: 20px;"><br> Prize 5000 Rs</h8><button class="course_button button5 but_enr" type="submit"
          name="enrol_course" value="2" />Enroll Now</button>
      </div>
      <div class="course">
        <h1>Python</h1>
        <h7>Master Python by building 100 projects in 100 days. Learn to build websites, games, apps, plus scraping and
          data science</h7>
        <h8 style="font-size: 20px;"><br> Prize 4412 Rs</h8><button class="course_button button5 but_enr" type="submit"
          name="enrol_course" value="3" />Enroll Now</button>
      </div>
      <div class="course">
        <h1>Ethical Hacking</h1>
        <h7>Get started from scratch and become job ready penetration Tester. Be an Ethical Hacker and Hunt as a Bug
          Bounty Hunters</h7>
        <h8 style="font-size: 20px;"><br> Prize 5777 Rs</h8><button class="course_button button5 but_enr" type="submit"
          name="enrol_course" value="4" />Enroll Now</button>
      </div></select>
  </div>
</body>

</html>