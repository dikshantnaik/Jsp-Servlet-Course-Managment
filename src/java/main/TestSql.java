package main;

import java.sql.*;
import java.sql.Connection;
import java.sql.SQLException;

public class TestSql {
    public static void main(String[] args) {
	System.out.println("Hello");
	Connection con = null;
	CallableStatement cstmt = null;
	try {
//	   String SQL = "{call Register(?, ?, ?,?)}";
	   String SQL = "{? = call login(?,?)}";
	   
	   con = Database.initSql();
	   cstmt = con.prepareCall (SQL);
	  cstmt.registerOutParameter(1, Types.INTEGER);

	   cstmt.setString(2, "adm2in");
	   cstmt.setString(3, "admin");
	   cstmt.execute();
	   System.out.println(cstmt.getInt(1));
	   
	}
	catch (SQLException e) {
	   System.out.println(e.toString());
	}
	
    }
}
