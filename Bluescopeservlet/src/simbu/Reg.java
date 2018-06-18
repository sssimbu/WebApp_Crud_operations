
package simbu;
import java.io.*;  
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
  
@WebServlet("/Reg")
public class Reg extends HttpServlet {  
public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
          
String name=request.getParameter("name"); 
String email=request.getParameter("email");  
String password=request.getParameter("password");  
 
          
try{  
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:mysql://localhost:3306/bluescope","root","root"); 
  
PreparedStatement ps=con.prepareStatement(  
"insert into register values(?,?,?)");  
  
ps.setString(1,name);  
ps.setString(2,email);  
ps.setString(3,password);  
  
          
int i=ps.executeUpdate();  
if(i>0)  
{
out.print("You are successfully registered...");
//response.sendRedirect("Register.html");
RequestDispatcher rd = request.getRequestDispatcher("index.html");
rd.forward(request, response);
}         
}catch (Exception e2) {System.out.println(e2);}  
          
out.close();  
}
}