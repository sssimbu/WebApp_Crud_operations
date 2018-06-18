<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>search by id</title>
<style type="text/css">
.tr tr:nth-child(even) {
    background-color: #eee;
}
.tr tr:nth-child(odd) {
   background-color:#fff;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>

<%

Connection conn = null;
String url = "jdbc:mysql://localhost:3306/";;
String dbName = "bluescope";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String password = "root";


Statement st;
try {
Class.forName(driver).newInstance();
conn = DriverManager.getConnection(url+dbName,userName,password);
System.out.println("Connected to the database");
String id = request.getParameter("id");

String query = "select personal.name,official.mobile,official.address from personal inner join official on personal.id=official.id where personal.id='"+id+"'";
st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
%>
<table class="tr" border="1" width=90% >
<tr style= "background-color: black; color:white"><th>Name</th><th>Mobile</th><th>Address</th></tr>
<% 
//out.println("<tr><th>ID</th><th>Name</th><th>Dob</th><th>Married</th><th>Qualification</th></tr>");
while(rs.next()){

out.println("<tr><td>"+rs.getString("name")+"</td><td>"+rs.getString("mobile")+"</td><td>"+rs.getString("address")+"</td></tr>");
}
out.println("</table>");
conn.close();
System.out.println("Disconnected from database");
} catch (Exception e) {
e.printStackTrace();
}



%>





</body>
</html>