

<%@page import="java.sql.*"%>
<%@page import ="main.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean LogedIn=false;
    if (session.getAttribute("username") != null && session.getAttribute("name") != null) {
        LogedIn = true;
        session.setAttribute("LogedIn", "true");
    }
%>


<% if (LogedIn) {%>
<!-- Enrolled Course Sections -->
<%
    String query = "SELECT available_course.course_name,enrolled_date FROM enrolled_course,available_course WHERE enrolled_course.course_id = available_course.course_id and student_id=(SELECT studentid FROM students WHERE username=\"" + session.getAttribute("username") + "\") Group by course_name";
    Connection con = Database.initSql();
    PreparedStatement stmt;
    try {

        stmt = con.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();

%>
<section id="instructors" class="p-5 bg-primary border-bottom">
    <div class="container">
        <h2 class="text-center text-white">Enrolled Course</h2>
        <% 
           ResultSetMetaData rsmd =  rs.getMetaData();
           
           
         %>

        <div class="row g-4">
            <% while (rs.next()) {%>
            <div class="col-md-6 col-lg-3">
                <div class="card bg-light">

                    <div class="card-body text-center">
                        <img
                            src="https://prod-discovery.edx-cdn.org/media/course/image/156313d6-f892-4b08-9cee-43ea582f4dfb-7b98c686abcc.small.png"
                            class="img-fluid img-responsive rounded product-image"
                            alt=""
                            />
                        <h5 class="card-title mb-3 my-3"> <%=rs.getString("course_name")%></h5>
                    
                    </div>
                </div>

            </div>
            <%}%>

        </div>
    </div>
</section>

<%} catch (SQLException e) {
            System.out.println(e);
        }
    }%>
