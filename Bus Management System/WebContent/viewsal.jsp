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
<h1 class="dh">View Salary Details</h1>
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
String q="select * from sal";
ResultSet rs;
rs=s.executeQuery(q);

%>
<table class="table1">
<tr>
<th>Driver/Conductor</th>
<th>Year-Month</th>
<th>Total_Salary</th>
<th>No_Of_Days_Leave</th>
<th>Leave_Detection</th>
<th>P.F Detection 2%</th>
<th>ESI Detection 3%</th>
<th>Balace</th>
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
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
<td><%=rs.getString(8) %></td>
</tr>
<%} %>

</table>
</body>
</html>