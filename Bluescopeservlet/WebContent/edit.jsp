<%@page language="java"%>
<%@page import="java.sql.*"%>
<form method="post" action="update.jsp">
<table border="1">
<tr><th>Name</th><th>Dob</th><th>Married</th><th>Qualiification</th></tr>
<%
String id=request.getParameter("id");
int no=Integer.parseInt(id);
int sumcount=0;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bluescope", "root", "root");
String query = "select * from personal where id='"+no+"'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<tr>
<td><input type="text" name="name" value="<%=rs.getString("name")%>"></td>
<td><input type="text" name="dob" value="<%=rs.getString("dob")%>"></td>

<td><input type="radio" name="married" value="yes"> Yes
 <input type="radio" name="married" value="no"> No</td>

<td><select name="qualification">
<option value="" selected>Select</option>
<option value="B.Tech">B.E</option>
<option value="B.Tech">B.TECH</option>
<option value="MCA">MCA</option>
<option value="MBA">MBA</option>
<option value="BCA">BCA</option>
</select></td>

<td><input type="hidden" name="id" value="<%=rs.getString(1)%>"></td>
</tr>
<tr>
<td><input type="submit" name="Submit" value="Update" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>
</tr>
<%
}
}
catch(Exception e){}
%>
</table>
</form>
</form>