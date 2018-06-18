
package simbu;
import java.io.*;  
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
  
@WebServlet("/Delete")
public class Delete extends HttpServlet {  
public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
          
String id=request.getParameter("id");
int no=Integer.parseInt(id);
int sumcount=0;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bluescope", "root", "root");
Statement st = conn.createStatement();
st.executeUpdate("DELETE FROM personal WHERE id = '"+no+"'");
response.sendRedirect("Home.jsp");
}
catch(Exception e){}
out.close();  
}
}