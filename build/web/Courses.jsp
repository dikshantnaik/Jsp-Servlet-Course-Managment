

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
    <link rel="stylesheet" href="./reg_css.css">
</head>
<body>
  
  <?php 
include("./dbms_connect.php");
echo "<h1> Welcome, ".$_SESSION["name"] ."</h1>";

echo "<div class=\"content\" >";

echo "<h1>Course You have Enrolled </h1>";


 $sql = "SELECT * from available_course,enroled_course,student WHERE enroled_course.student_id=student.student_id AND enroled_course.avail_course_id=available_course.course_id AND student_email=\"".$_SESSION["email"]."\";";
 
 if($result =mysqli_query($conn,$sql)){
  if(mysqli_num_rows($result)==0){
    echo "<br>You dont have any Course Enrold ";
  }
   elseif(mysqli_num_rows($result) > 0){
      
     
     while($row = mysqli_fetch_array($result)){
        
        echo "<ul>";
        echo "<li>".$row["course_name"]."</li>";        
        echo "</ul>";
      }
      
    }
  }
  else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($conn);
  }
  ?>


</div>

  <div class="course_cont">
    <h1>Available Course </h1>



   <?php

       
       if($_SESSION["error"]){
        echo '<script>alert(\"".$_SESSION["error"]."\")</script>';

       }
       $sql = "SELECT * FROM available_course ;";
       if($result =mysqli_query($conn,$sql)){
         if(mysqli_num_rows($result) > 0){
            
           
             echo "<form action=\"index.php\" method=\"post\">";
           while($row = mysqli_fetch_array($result)){
             echo "<div class=\"course\">";
             echo "<h1>" . $row["course_name"]."</h1>";
        
             
             echo "<h7>".$row["course_discription"]."</h7>";
             echo "<h8 style=\"font-size: 20px;\"><br> Prize ".$row["course_prize"]." Rs</h8>";
             echo "<button class=\"course_button button5 but_enr\" type=\"submit\" name=\"enrol_course\" value=\"".$row["course_id"]."\" />Enroll Now</button>";
             echo "</div>";
            }
            echo "</select>";
          }
        }
        else{
          echo "ERROR: $sql. " . mysqli_error($conn);
        }
        ?>
        
        </div>
</body>
</html>
