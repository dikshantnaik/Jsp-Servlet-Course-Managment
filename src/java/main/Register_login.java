package main;


import main.Dao;
import java.sql.*;

public class Register_login {

    Connection con;
    PreparedStatement stmt;
    ResultSet rs;
    String query;

    public String login(String username, String password) throws SQLException {
        query = "Select * from users";
        try {
            con = Dao.initSql();
            stmt = con.prepareStatement(query);
            rs = stmt.executeQuery();
            while (rs.next()) {                
                if (rs.getString("username").equals(username)) {
                    if(rs.getString("password").equals(password)){
                        return "logedin";
                    }
                    else{
                        return "wrongpass";
                    }
                   
                }
               
            }
           return "nouser";
        } catch (SQLException e) {
            return e.toString();
        } catch (Exception e) {
            return e.toString();
        }
        finally{
            con.close();
            stmt.close();
        }
       
    }
    public String register(String username,String password){
        query = "Insert Into users(username,password) VALUES(?,?)";
        try{
        con = Dao.initSql();
        stmt = con.prepareStatement(query);
        stmt.setString(1,username);
        stmt.setString(2, util.digest(password));
        stmt.executeUpdate();
        return "registered";
        }
        catch(SQLException e){
            if(e.getErrorCode()==1062){
                return "usernameExists";
            }
            return e.toString();
            
        }
        catch (Exception e){
            
            return e.toString();
        }
    }
}
