
package simbu;
import java.io.*;  
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
  
@WebServlet("/Update")
public class Update extends HttpServlet {  
public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
          
int ide=Integer.parseInt(request.getParameter("id"));
//int num=Integer.parseInt(ide);
String name=request.getParameter("name");
String dob=request.getParameter("dob");
//int contact=Integer.parseInt(request.getParameter("contact"));
String married=request.getParameter("married");
String qualification=request.getParameter("qualification");
try{
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bluescope","root", "root");
Statement st=null;
st=conn.createStatement();
//st.executeUpdate("update personal set name='"+name+"',dob='"+dob+"',married="+married+",qualification='"+qualification+"' where id='"+ide+"'");
st.executeUpdate("UPDATE personal SET name='"+name+"',dob='"+dob+"',married='"+married+"',qualification='"+qualification+"' WHERE id='"+ide+"'");
response.sendRedirect("Home.jsp");
}
catch(Exception e){
System.out.println(e);
  }
out.close();  
}
}