package main;


import main.Dao;
import java.sql.*;

public class Register_login {

    Connection con;
    PreparedStatement stmt;
    ResultSet rs;
    String query;
    String return_result [];
    public String[] login(String username, String password) throws SQLException {
        
        query = "Select * from students";
        
        try {
        password = util.digest(password);    
            con = Dao.initSql();
            stmt = con.prepareStatement(query);
            rs = stmt.executeQuery();
            while (rs.next()) {                
                if (rs.getString("username").equals(username)) {
                    if(rs.getString("password").equals(password)){
                        return new String[] {"logedin","LogIn Sucess ! Redirecting you to Home ! HOLD ON ",rs.getString("student_name")};
                    }
                    else{
                        return new String[] {"wrongpass","Bruh ! Thats a Wrong Password \\nCan't you Remember a damn password"};
                    }
                   
                }
               
            }
           return new String[] {"nouser","No user Found with that username! "};
        } catch (SQLException e) {
            return new String[] {"error",e.toString()};
        } catch (Exception e) {
            return new String[] {"error",e.toString()};
        }
        finally{
            con.close();
            stmt.close();
        }
       
    }
    public String [] register(String username,String password,String student_name,String college_course){
        query = "Insert Into students VALUES(NULL,?,?,?,?)";
        try{
        con = Dao.initSql();
        stmt = con.prepareStatement(query);
        stmt.setString(1,username);
        stmt.setString(2, student_name);
        stmt.setString(3, college_course);
        stmt.setString(4, util.digest(password));
        stmt.executeUpdate();
        
//        Why return an Array ? the First element indicated error code and second represent Message 
        return new String[] {"registered","Registered Success"};
           
        }
        catch(SQLException e){
            if(e.getErrorCode()==1062){
                return new String[] {"usernameExists","Username Taken Please use Different One"};
            }
            return new String[] {"error",e.toString()};
            
        }
        catch (Exception e){
            return new String[] {"error",e.toString()};
        }
    }
}
