package main;

import java.security.*;
import java.sql.*;
import java.util.List;

import javax.servlet.http.*;
import javax.servlet.jsp.JspWriter;

import org.hibernate.JDBCException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.engine.jdbc.spi.SqlExceptionHelper;

import hibernate.HibernateUtil;
import hibernate.Pojo.Student;
import hibernate.*;

public class util {
    static Connection con;
    static PreparedStatement stmt;
    static ResultSet rs;
    static String query;
    static String return_result[];

    public static void alert(JspWriter out, String msg) throws Exception {

	out.println("<script>alert(\"" + msg + "\")</script>");
    }

    @SuppressWarnings("deprecation")
    public static String[] login(String username, String password) {
	try {
	    Session session = HibernateUtil.getSession();
	    Query query = session.createQuery("from Student where username=:susername and password=:spassword");
	    query.setParameter("susername", username);
	    query.setParameter("spassword", password);
	    List<Student> list = query.list();
	    if(list.size()>=1) {
		return new String[] {"logedin","Sucessfully Logedin"};
	    }
	    else {
		return new String[] {"wrongpasss","Invalid Credantials"};
	    }
	    
	} catch (Exception e) {
	    return new String[] { "error", e.toString() };
	}
    }

    public static String[] register(String username, String password, String student_name, String college_course) {
	CallableStatement cstmt = null;
	try {

	    Student s1 = new Student();
	    s1.setStudent_name("Dikshant Naik");
	    s1.setUsername("dikshant");
	    s1.setCollege_course("bscCs");
	    s1.setPassword("password123");
	    Session session = HibernateUtil.getSession();
	    Transaction tx = session.beginTransaction();
	    session.save(s1);
	    tx.commit();

//        Why return an Array ? the First element indicated error code and second represent Message 
	    return new String[] { "registered", "Registered Success" };
	} catch (JDBCException e) {
	    SQLException cause = (SQLException) e.getCause();
	    if (cause.getErrorCode() == 1062) {
		return new String[] { "error", "usernameExist" };
	    } else {
		return new String[] { "error", cause.getMessage() };

	    }
	} catch (Exception e) {
	    return new String[] { "error", e.toString() };
	}
    }

    public static void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {

	HttpSession session = request.getSession();
	session.invalidate();
	Cookie[] ck = request.getCookies();
	for (int i = 0; i < ck.length; i++) {
	    if (ck[i].getName().equals("name") || ck[i].getName().equals("username")) {
		ck[i].setMaxAge(0);
		response.addCookie(ck[i]);
		response.sendRedirect("index.jsp");
	    }
	}
    }

    public static void rememberMe(HttpServletRequest request, HttpServletResponse response) {
	HttpSession session = request.getSession();
	Cookie ck = new Cookie("username", session.getAttribute("username").toString());
	response.addCookie(ck);
    }

    public static String digest(String msg) throws NoSuchAlgorithmException {
	final char[] HEX_ARRAY = "0123456789ABCDEF".toCharArray();
	MessageDigest md = MessageDigest.getInstance("SHA-256");
	md.update(msg.getBytes());
	byte bytes[] = md.digest();

	char[] hexChars = new char[bytes.length * 2];
	for (int j = 0; j < bytes.length; j++) {
	    int v = bytes[j] & 0xFF;
	    hexChars[j * 2] = HEX_ARRAY[v >>> 4];
	    hexChars[j * 2 + 1] = HEX_ARRAY[v & 0x0F];
	}
	return new String(hexChars);
    }

    public static String Review(String review, int course_id, String username) {
	try {
	    CallableStatement cstmt = null;
	    String SQL = "{call InsertReviews(?,?,?)}";
	    con = Database.initSql();
	    cstmt = con.prepareCall(SQL);
	    cstmt.setInt(1, course_id);
	    cstmt.setString(2, username);
	    cstmt.setString(3, review);
	    cstmt.execute();
	    return "Done";
	} catch (Exception e) {
	    System.out.println(e);
	    return e.toString();
	}

    }

    public static void removeItemFromCart(Integer cid, String username) {
	try {
	    con = Database.initSql();
	    CallableStatement cstmt = null;
	    String SQL = "{call removeItemFromCart(?,?)}";
	    con = Database.initSql();
	    cstmt = con.prepareCall(SQL);

	    cstmt.setString(1, username);
	    cstmt.setInt(2, cid);
	    cstmt.execute();

	} catch (SQLException e) {
	    System.out.println(e);
	}
    }

    public static void addItemToCart(String username, String course_id) {
	String query = "INSERT INTO cart VALUES((Select studentid FROM students WHERE username = ?),?)";
	try {
	    Connection con = Database.initSql();
	    PreparedStatement stmt = con.prepareStatement(query);
	    stmt.setString(1, username);
	    stmt.setInt(2, Integer.parseInt(course_id));
	    stmt.executeUpdate();
	    System.out.println(stmt.toString());
	} catch (SQLException e) {
	    System.out.println(e);
	}
    }

    public static void EnrollCourse(String username) {
	try {
	    String Selecting_Query = "SELECT sid,cid FROM cart,students WHERE sid=students.studentid and username = \""
		    + username + "\"";
	    String Insrting_query;
	    String sid;
	    Connection con = Database.initSql();
	    PreparedStatement Select_stmt = con.prepareStatement(Selecting_Query);
	    ResultSet rs = Select_stmt.executeQuery();
	    while (rs.next()) {
		sid = rs.getString("sid");
		Insrting_query = "INSERT INTO `enrolled_course`(id,student_id,course_id) VALUES (NULL,'" + sid + "' , '"
			+ rs.getString("cid") + "')";
		PreparedStatement Insert_stmt = con.prepareCall(Insrting_query);
		Insert_stmt.executeUpdate();
	    }
	    String Delete_Query = "DELETE FROM `cart` WHERE sid=(Select studentid FROM students where username = '"
		    + username + "')";
	    PreparedStatement Delete_stmt = con.prepareStatement(Delete_Query);
	    Delete_stmt.executeUpdate();

	} catch (SQLException e) {
	    System.out.println(e);
	}
    }

    public static void Payment(String username, String name, String card_no, String card_edate, String cvv,
	    String course_price, String trans_fee, String total) {

	String query = "Insert Into payment VALUES(NULL,(SELECT students.studentid FROM students WHERE students.username = ? ),?,?,?,?,?,?,?)";

	try {
	    con = Database.initSql();
	    stmt = con.prepareStatement(query);
	    stmt.setString(1, username);
	    stmt.setString(2, name);
	    stmt.setString(3, card_no);
	    stmt.setString(4, card_edate);
	    stmt.setString(5, cvv);
	    stmt.setString(6, course_price);
	    stmt.setString(7, trans_fee);
	    stmt.setString(8, total);
	    stmt.executeUpdate();
	    util.EnrollCourse(username);

//        Why return an Array ? the First element indicated error code and second represent Message 
	}

	catch (Exception e) {
	    System.out.println(e);
	}

    }

}
