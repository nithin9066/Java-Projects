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
<h2 align="right" style="color: blue;">Admin: <%=hs.getAttribute("s") %></h2>
<div class="badis"></div>
<h1 class="dh">---View Trip---</h1>
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
String q="select * from trip";
ResultSet rs;
rs=s.executeQuery(q);

%>
<table class="table1">
<tr>
<th>Trip_id</th>
<th>Bus_Number</th>
<th>Conductor_Name</th>
<th>Driver_Name</th>
<th>Date</th>
<th>Starting_Time</th>
<th>Starting_Place</th>
<th>Ending_Time</th>
<th>Ending_Place</th>
<th>Ticket_Rate</th>
<th>No_Of_Passengers</th>
<th>Total_Collection</th>
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
<td><%=rs.getString(9) %></td>
<td><%=rs.getString(10) %></td>
<td><%=rs.getString(11) %></td>
<td><%=rs.getString(12) %></td>
</tr>
<%} %>



</table>

</body>
</html>