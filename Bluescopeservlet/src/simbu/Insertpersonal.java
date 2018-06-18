
package simbu;
import java.io.*;  
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
  
@WebServlet("/Insertpersonal")
public class Insertpersonal  extends HttpServlet {  
public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
          
String name=request.getParameter("name"); 
String dob=request.getParameter("dob");  
String married=request.getParameter("married"); 
String qualification=request.getParameter("qualification"); 
 
          
try{  
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:mysql://localhost:3306/bluescope","root","root"); 
  
PreparedStatement ps=con.prepareStatement(  
"insert into personal(name,dob,married,qualification) values(?,?,?,?)");  
  
ps.setString(1,name);  
ps.setString(2,dob);  
ps.setString(3,married);
ps.setString(4,qualification);

          
int i=ps.executeUpdate();  
if(i>0)  
{
out.print("You are successfully registered...");
//response.sendRedirect("Register.html");
RequestDispatcher rd = request.getRequestDispatcher("Homepersonal.jsp");
rd.forward(request, response);
}         
}catch (Exception e2) {System.out.println(e2);}  
          
out.close();  

}
}