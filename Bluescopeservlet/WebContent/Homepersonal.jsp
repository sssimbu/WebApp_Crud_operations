<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home personal</title>




<style type="text/css">
.inputform{float:left;
width:400px;border:1px solid pink;border-radius:10px;padding:10px;
}
.inputform table tr td input,textarea,select{width:200px;}
#gender1,#gender2{width:10px;}
#submit{margin-left:100px;width:100px;}
#reset{width:100px;}
.design{background-color:grey;color:white;padding-left:100px;}
</style>

<style type="text/css">
.tr tr:nth-child(even) {
    background-color: #eee;
}
.tr tr:nth-child(odd) {
   background-color:#fff;
}
table{
cellspacing:5px;
padding:12px;
	
}
</style>






  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script language="javascript">
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='edit.jsp?id='+id;
    f.submit();
}
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='delete.jsp?id='+id;
    f.submit();
}
</script>


</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">BlueScope Tech</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
     
      <li><a href="index.html"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>
<div class="container">
<ul class="nav nav-tabs" style="margin-left:-92px;">
<li  class="active"><a  data-toggle="tab"  href="#Personal">Personal Details</a></li>

<li><a  data-toggle="tab" href="#list">Customer List</a></li>
</ul>
<div class="tab-content">
<div id="personal" class="tab-pane fade in active">	

<h2>Details</h2>
<h3 style="background-color:grey;color:grey;">c</h3>


<div class="inputform">
<h3>Personal Details Succesfully registered...!!!</h3>
<h2 class="design">Personal Details</h2>
<form action="insertpersonal.jsp" method=post>
<div class="form-group">
<div><label>Name:</label><div><input class="form-control user" type=text name=name id="" size="30"></div></div>
<div><label>Dob:</label><div><input class="form-control " type="date" name="dob" id="" size="40"></div></div>
 <div><label>Married:</label><span style="margin-left:20px;"><label class="radio-inline" ><input type="radio" name="married">Yes </label>
 <label class="radio-inline"><input type="radio" name="married" >No </label></span></div>
<div><label>Qualification:</label>
<span><select name="qualification" class="dropdown">
<option value="-1" selected>select..</option>
<option value="B.Tech">B.E</option>
<option value="B.Tech">B.TECH</option>
<option value="MCA">MCA</option>
<option value="MBA">MBA</option>
<option value="BCA">BCA</option>
</select></span></div>
<div><div colspan="2" style="margin-left:-100px;"><input id="submit" type="submit" class="btn btn-primary" value="register"/>
<input id="reset" type="reset" class="btn btn-success" value="clear"/>
</div></div>
</div>
</form>
</div>

<div class="inputform" style="float:right;">
<h2 class="design">Official Details</h2>
<form action="insertoff.jsp" method="post">
<div class="form-group">
<div><label>Mobile:</label><div><input type="text" class="form-control" name="mobile"/></div></div>
<div><label>Address:</label><div><input type="text" class="form-control" name="address"/></label></div>
<div ><div colspan="2" style="margin-left:-90px; margin-top:5px"><input id="submit" class="btn btn-primary" type="submit" value="Save"/>
</div></div>
</div>
</div>
</form>
</div>


</div>
<div id="list" class="tab-pane fade">
<div style="left:0px;">
<form action="searchname.jsp" method=post align=right >  
<input type="text" placeholder="search by name" name="name"/><br/>  
  
<input type="submit" value="search" style="background-color:#49743D;font-weight:bold;;color:#ffffff" />  
</form>  
</div>
<form action="searchid.jsp" method=post align=right>  
<input type="text" placeholder="search by id" name="id"/><br/>  
  
<input type="submit" value="search" style="background-color:#ff0000;font-weight:bold;color:#ffffff;"  />  
</form> 



<a  href="pdf.jsp" style="margin-right:100px;">Click here to download pdf</a>


<form method="post" name="form">






<%!
public int nullIntconvert(String str){
int num=0;
if(str==null) {
str="0";
}
else if((str.trim()).equals("null")) {
str="0";
}
else if(str.equals("")) {
str="0";
}
try{
num=Integer.parseInt(str);
}
catch(Exception e) { }
return num;
}
%>
<%
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bluescope","root", "root");
ResultSet rs1 = null;
ResultSet rs2 = null;
PreparedStatement ps1=null;
PreparedStatement ps2=null;

int showRows=10;
int totalRecords=10;
int totalRows=nullIntconvert(request.getParameter("totalRows"));
int totalPages=nullIntconvert(request.getParameter("totalPages"));
int iPageNo=nullIntconvert(request.getParameter("iPageNo"));
int cPageNo=nullIntconvert(request.getParameter("cPageNo"));

int startResult=0;
int endResult=0;
if(iPageNo==0) {
iPageNo=0;
}
else{
iPageNo=Math.abs((iPageNo-1)*showRows);
}
String query1="SELECT SQL_CALC_FOUND_ROWS * FROM personal limit "+iPageNo+","+showRows+"";
ps1=conn.prepareStatement(query1);
rs1=ps1.executeQuery();

String query2="SELECT FOUND_ROWS() as cnt";
ps2=conn.prepareStatement(query2);
rs2=ps2.executeQuery();
if(rs2.next()) {
totalRows=rs2.getInt("cnt");
}
%>

<h3>User List </h3>
<body>
<form>
<input type="hidden" name="iPageNo" value="<%=iPageNo%>">
<input type="hidden" name="cPageNo" value="<%=cPageNo%>">
<input type="hidden" name="showRows" value="<%=showRows%>">
<table width="100%" cellpadding="0" cellspacing="0" border="1" >
<tr>
<th>ID</th>
<th>Name</th>
<th>Dob</th>
<th>Married</th>
<th>Qualification</th>
<th>Edit</th>
<th>Delete</th>
</tr>






<%
while(rs1.next()){
%>
<tr><td><%=rs1.getString(1)%></td>
<td><%=rs1.getString(2)%></td>
<td><%=rs1.getString(3)%></td>
<td><%=rs1.getString(4)%></td>
<td><%=rs1.getString(5)%></td>
<td><input type="button" name="edit" value="Edit"  style="background-color:#49743D;font-weight:bold;;color:#ffffff" onclick="editRecord(<%=rs1.getString(1)%>);" ></td>
<td><input type="button" name="delete" value="Delete" style="background-color:#ff0000;font-weight:bold;color:#ffffff;" onclick="deleteRecord(<%=rs1.getString(1)%>);" ></td>
</tr>
<%
}
%>
<%
try{
if(totalRows<(iPageNo+showRows)) {
endResult=totalRows;
}
else{
endResult=(iPageNo+showRows);
}
startResult=(iPageNo+1);
totalPages=((int)(Math.ceil((double)totalRows/showRows)));
}
catch(Exception e){
e.printStackTrace();
}
%>
<tr>
<td colspan="3">
<div>
<%
    int i=0;
    int cPage=0;
    if(totalRows!=0){
    cPage=((int)(Math.ceil((double)endResult/(totalRecords*showRows))));

    int prePageNo=(cPage*totalRecords)-((totalRecords-1)+totalRecords);
    if((cPage*totalRecords)-(totalRecords)>0){
    %>
    <a href="Home.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> << Previous</a>
    <%
    }
    for(i=((cPage*totalRecords)-(totalRecords-1));i<=(cPage*totalRecords);i++){
    if(i==((iPageNo/showRows)+1)){%>
    <a href="Home.jsp?iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><%=i%></b></a>
    <%
    }
    else if(i<=totalPages){
    %>
    <a href="Home.jsp?iPageNo=<%=i%>"><%=i%></a>
    <%
    }
    }
    if(totalPages>totalRecords && i<totalPages){
    %>
    <a href="Home.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>"> >> Next</a>
    <%
    }
    }
    %>
    <b>Rows <%=startResult%> - <%=endResult%> Total Rows <%=totalRows%> </b>
    </div></td></tr></table></form>


</div>
</div>
</div>

</body>
</html>