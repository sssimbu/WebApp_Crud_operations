
package simbu;
import java.io.*;  
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
  
@WebServlet("/Login")
public class Login extends HttpServlet {  
public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
          
String userid = request.getParameter("email1");    
String pwd = request.getParameter("password");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bluescope", "root", "root");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from register where email='" + userid + "' and password='" + pwd + "'");
if (rs.next()) {
   // session.setAttribute("userid", userid);
    //out.println("welcome " + userid);
    //out.println("<a href='logout.jsp'>Log out</a>");
    response.sendRedirect("Home.jsp");
} else {
    out.println("Invalid password <a href='index.html'>try again</a>");
}}
catch(Exception e)
{
	System.out.println(e);
}
}
}

