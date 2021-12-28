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
       return con;    
    
}    
 
}




//student Table
//CREATE TABLE `jsp-project`.`students` ( `studentid` INT(50)PRIMARY KEY AUTO_INCREMENT NOT NULL , `username` VARCHAR(100) UNIQUE NOT NULL , `student_name` VARCHAR(100) NOT NULL , `college_course` VARCHAR(100) NOT NULL , `password` VARCHAR(300) NOT NULL ) ENGINE = InnoDB;