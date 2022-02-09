package main;

import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    public void alert(PrintWriter out, String msg) throws Exception {

        out.println("<script>alert(\"" + msg + "\")</script>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try (PrintWriter out = response.getWriter()) {

            if (request.getParameter("logout") != null) {
                util.logout(request, response);
                response.sendRedirect("index.jsp");
            }
            if (request.getParameter("SubmitReview") != null) {

                String out1 = util.Review(request.getParameter("review"), request.getParameter("course_id"), request.getParameter("username"));

                String path = "Course.jsp?course_id=" + request.getParameter("course_id");
                response.sendRedirect(path);

            }
            if (request.getParameter("delete") != null) {
                util.removeItemFromCart(request.getParameter("course_id"), request.getParameter("username"));
                response.sendRedirect("Cart.jsp");
            }
            if (request.getParameter("addToCart") != null) {
                util.addItemToCart(request.getParameter("username"), request.getParameter("course_id"));
                response.sendRedirect("index.jsp");
            }
            if (request.getParameter("EnrollCourse") != null) {
                util.EnrollCourse(request.getParameter("username"));
                response.sendRedirect("Cart.jsp");

            }
            if (request.getParameter("payment") != null) {
               util.Payment(request.getParameter("username"), request.getParameter("name"), request.getParameter("card_no"),
                        request.getParameter("edate"), request.getParameter("cvv"), request.getParameter("course_price"),
                         request.getParameter("fee"), request.getParameter("total"));
                response.sendRedirect("index.jsp");
                

            }

        } catch (Exception e) {
            System.out.println(e);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse respone) {
        String param = request.getParameter("course_id");
        System.out.println(param);
    }

}
