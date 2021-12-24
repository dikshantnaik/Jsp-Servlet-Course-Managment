package main;



import java.sql.*;


public  class Dao {
static Connection con;
static String username = "root";
static String password = "";

 
   public static Connection initSql(){
       try{
           String dbUrl = "jdbc:mysql://localhost:3306/test_jsp";
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection(dbUrl,username,password);              
           
       }catch(Exception e){
           System.out.println(e);
       }
       return con;    
    
}    
 
}
