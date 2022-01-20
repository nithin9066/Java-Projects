<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="di">

<%
HttpSession hs=request.getSession(false);

%>
<h2 align="right" style="color: aqua;">Admin: <%=hs.getAttribute("s") %></h2>
<div class="badis"></div>
<h1 class="dh">BUS REPORT</h1>

<%
Connection con=null;
try 
{
  	Class.forName("oracle.jdbc.driver.OracleDriver");
      con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
     
} catch (ClassNotFoundException e)
  {
	    e.printStackTrace();
  }

Statement s;
s=con.createStatement();
String q="select * from bus";
ResultSet rs;
rs=s.executeQuery(q);

%>
<div class="badis">
<table class="table">
<tr>
<th>Bus_number</th>
<th>Driver</th>
<th>Conductor</th>
<th>Route</th>
<th>Price</th>
</tr>

<%while(rs.next())
	{
	%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
</tr>
<%} %>

</table>
</div>
</body>
</html>