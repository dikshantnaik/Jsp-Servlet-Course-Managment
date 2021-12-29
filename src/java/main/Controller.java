package main;

import java.io.PrintWriter;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {


    public void alert(PrintWriter out,String msg) throws Exception{
 
    out.println("<script>alert(\""+msg+"\")</script>");
}
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    {
        try (PrintWriter out = response.getWriter()) {
            if(request.getParameter("logout")!=null){
                util.logout(request,response);
            }
            if(request.getParameter("SubmitReview")!=null){
                out.print("Review");
                String out1 = util.Review(request.getParameter("review"), request.getParameter("course_id"), request.getParameter("username"));
                out.print(out1);
            }
            
        }
        catch(Exception e){
            System.out.println(e);
        }
        
        
    }

  

}
