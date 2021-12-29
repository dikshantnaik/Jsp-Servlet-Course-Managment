package main;



import java.sql.*;


public  class Dao {
static Connection con;
static String username = "root";
static String password = "";
static String database = "jsp-project"; 
 
   public static Connection initSql(){
       try{
           String dbUrl = "jdbc:mysql://localhost:3306/"+database;
           Class.forName("com.mysql.cj.jdbc.Driver");
           con=DriverManager.getConnection(dbUrl,username,password);              
           
       }catch(Exception e){
           System.out.println(e);
       }
       if(con==null){
              System.out.println("Start the Database");
       }
    
       return  con;
}    
 
}




//student Table
//CREATE TABLE `jsp-project`.`students` ( `studentid` INT(50)PRIMARY KEY AUTO_INCREMENT NOT NULL , `username` VARCHAR(100) UNIQUE NOT NULL , `student_name` VARCHAR(100) NOT NULL , `college_course` VARCHAR(100) NOT NULL , `password` VARCHAR(300) NOT NULL ) ENGINE = InnoDB;

//Review Table
//CREATE TABLE `review` (
//  `id` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
//  `course_id` int(11) DEFAULT NULL,
//  `studentid` int(11) DEFAULT NULL,
//  `rating` float DEFAULT 0 CHECK (`rating` >= 0 and `rating` <= 10),
//  `students_revive` varchar(100) DEFAULT NULL,
//   FOREIGN KEY(studentid) REFERENCES students(studentid),
//    FOREIGN KEY(course_id) REFERENCES available_course(course_id)
