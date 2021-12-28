/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main;

import java.security.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

/**
 *
 * @author dikshant
 */
public class util {

    public static void alert(JspWriter out, String msg) throws Exception {

        out.println("<script>alert(\"" + msg + "\")</script>");
    }
    public static void logout(HttpServletRequest request,HttpServletResponse response) throws Exception{
       
        HttpSession session = request.getSession();
        session.invalidate();
        Cookie[] ck = request.getCookies();
        for (int i = 0; i < ck.length; i++) {
            if(ck[i].getName().equals("name") || ck[i].getName().equals("username"))
            {
                ck[i].setMaxAge(0);
                response.addCookie(ck[i]);
                response.sendRedirect("index.jsp");
            }
        }
    }
    public static void rememberMe(HttpServletRequest request,HttpServletResponse response){
        HttpSession session = request.getSession();
        Cookie ck = new Cookie("username",session.getAttribute("username").toString());
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
    
}
