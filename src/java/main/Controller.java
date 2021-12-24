package main;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.concurrent.TimeUnit;
/**
 *
 * @author dikshant
 */
@WebServlet(urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {


    public void alert(PrintWriter out,String msg) throws Exception{
 
    out.println("<script>alert(\""+msg+"\")</script>");
}
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    {
        Register_login obj = new Register_login();
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            if (request.getParameter("register")!=null) {
                String result = obj.register(request.getParameter("username"),request.getParameter("password"));
                out.print(result);
alert(out, result);
            }
            if (request.getParameter("login")!=null) {
               String result =  obj.login(request.getParameter("username"),request.getParameter("password"));
               
                alert(out, result);
                

            }
            
        }
        catch(Exception e){
            System.out.println(e);
        }
        
        
    }

  

}
