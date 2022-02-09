package main;



import java.sql.*;


public  class Database {
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

