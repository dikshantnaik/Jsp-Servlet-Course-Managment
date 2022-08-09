package main;

import java.sql.*;

public class TestSql {
    public static void main(String[] args) {
	System.out.println("Hello");
	Connection con = null;
	try {
	    con = Database.initSql();
		CallableStatement cstmt = null;
	            String SQL = "{call removeItemFromCart(?,?)}";	 
	            con = Database.initSql();
	 	   cstmt = con.prepareCall (SQL);
	 	   
	 	   cstmt.setString(1, "admin");
	 	   cstmt.setInt(2, 1);
	 	   cstmt.execute();
//	            return "Done";
	
	   
	}
	catch (SQLException e) {
	   System.out.println(e.toString());
	}
	
    }
}
