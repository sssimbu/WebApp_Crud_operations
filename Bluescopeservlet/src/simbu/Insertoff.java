
package simbu;
import java.io.*;  
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
  
@WebServlet("/Insertoff")
public class Insertoff  extends HttpServlet {  
public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
          
String mobile=request.getParameter("mobile"); 
String address=request.getParameter("address");  
 
 
          
try{  
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:mysql://localhost:3306/bluescope","root","root"); 
  
PreparedStatement ps=con.prepareStatement(  
"insert into official(mobile,address) values(?,?)");  
  
ps.setString(1,mobile);  
ps.setString(2,address);  


          
int i=ps.executeUpdate();  
if(i>0)  
{
out.print("You are successfully registered...");
//response.sendRedirect("Register.html");
RequestDispatcher rd = request.getRequestDispatcher("Homeoff.jsp");
rd.forward(request, response);
}         
}catch (Exception e2) {System.out.println(e2);}  
          
out.close();  

}
}