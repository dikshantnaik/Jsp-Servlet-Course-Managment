/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main;

import java.security.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.jsp.JspWriter;

/**
 *
 * @author dikshant
 */
public class util {

    public static void alert(JspWriter out, String msg) throws Exception {

        out.println("<script>alert(\"" + msg + "\")</script>");
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

    public static String Review(String review, String course_id, String username) {
        try {
            String query = "INSERT INTO review VALUES(NULL,?,(SELECT studentid FROM students WHERE username = ?),NULL,?)";
            Connection con = Dao.initSql();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, course_id);
            stmt.setString(2, username);
            stmt.setString(3, review);
            stmt.executeUpdate();
            return "Done";
        } catch (Exception e) {
            System.out.println(e);
            return e.toString();
        }

    }

    public static void removeItemFromCart(String cid, String username) {
        try {
            String query = "DELETE FROM cart WHERE sid = (SELECT studentid from students WHERE username=\"" + username + "\") and  cid= " + cid;

            Connection con = Dao.initSql();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.execute();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void addItemToCart(String username, String course_id) {
        String query = "INSERT INTO cart VALUES((Select studentid FROM students WHERE username = ?),?)";
        try {
            Connection con = Dao.initSql();
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
            String Selecting_Query = "SELECT sid,cid FROM cart,students WHERE sid=students.studentid and username = \"" + username + "\"";
            String Insrting_query;
            String sid ;
            Connection con = Dao.initSql();
            PreparedStatement Select_stmt = con.prepareStatement(Selecting_Query);
            ResultSet rs = Select_stmt.executeQuery();
            while (rs.next()) {
                 sid = rs.getString("sid");
                Insrting_query = "INSERT INTO `enrolled_course`(id,student_id,course_id) VALUES (NULL,'" + sid + "' , '" + rs.getString("cid") + "')";
                PreparedStatement Insert_stmt = con.prepareCall(Insrting_query);
                Insert_stmt.executeUpdate();
            }
            String Delete_Query = "DELETE FROM `cart` WHERE sid=(Select studentid FROM students where username = '"+username+"')";
            PreparedStatement Delete_stmt = con.prepareStatement(Delete_Query);
            Delete_stmt.executeUpdate();
            

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
