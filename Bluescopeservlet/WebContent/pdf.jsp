<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
  
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.lowagie.text.*"%>
<%@page import=" com.lowagie.text.pdf.*"%>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>pdf download</title>
</head>
<body>



<%
Document document=new Document();
       PdfWriter.getInstance(document,new FileOutputStream("C:/Users/user/Desktop/pdf/new1.pdf"));
       document.open();
       PdfPTable table=new PdfPTable(2);
      
       table.addCell("id");
       table.addCell("Name");
       table.addCell("dob");
       table.addCell("married");
       table.addCell("qualification");
       Class.forName("com.mysql.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bluescope", "root", "root");
       Statement st=con.createStatement();
       ResultSet rs=st.executeQuery("Select * from personal");
       %>
       
        <table>
      <tr> <th>ID</th><th>name</th><th>dob</th><th>married</th><th>qualification</th></tr>
       
      <%while(rs.next()){%>
      
      <tr><td> <% table.addCell(rs.getString("id"));%></td>
      <td> <% table.addCell(rs.getString("name"));%></td>
      <td> <% table.addCell(rs.getString("dob"));%></td>
      <td> <% table.addCell(rs.getString("married"));%></td>
       <td><% table.addCell(rs.getString("qualification"));%></td></tr>
       <% }%>
       </table>
       <% 
       document.add(table);
       response.sendRedirect("Home.jsp");
       document.close();
       %>


</body>
</html>