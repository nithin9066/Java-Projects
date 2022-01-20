<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body class="addi">
<%
HttpSession hs=request.getSession(false);

%>
<h2 align="right" style="color: blue;">Admin: <%=hs.getAttribute("s") %></h2>
<div class="baat"></div>
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
String q="select bus_number from bus";
String q1="select cn from conductor";
String q2="select dn from driver";
ResultSet rs;
rs=s.executeQuery(q);

%>


<div class="addt">
<h1>Add Trip</h1>
<form action="addtr.jsp" method="get">
<div class="texta">
<input type="text" placeholder="Enter Trip_Id" name="tid">
</div>
<div class="texta">
<select class="com" name="bn" title="Select Bus Number">
                <%while(rs.next())
                {%>
                <option value="<%=rs.getString(1)%>"><%=rs.getString(1) %></option>
                  <%} rs=s.executeQuery(q1);
 %>
                </select></div>
                
<div class="texta">
<select class="com" name="cn" title="Select Conductor Name">
                <%while(rs.next())
                {%>
                <option value="<%=rs.getString(1)%>"><%=rs.getString(1) %></option>
                  <%} rs=s.executeQuery(q2); %>
                </select></div>

<div class="texta">                               
<select class="com" name="dn" title="Select Driver Name">
                <%while(rs.next())
                {%>
                <option value="<%=rs.getString(1)%>"><%=rs.getString(1) %></option>
                  <%} %>
</select>
</div>

<div class="texta">
<input type="date" title="Enter Date" name="d">
</div>

<div class="texta">
<input type="time" title="Enter Starting Time" name="st">
</div>

<div class="texta">
<input type="text" placeholder="Enter Starting Place" name="sp">
</div>

<div class="texta">
<input type="time" title="Enter Ending Time" name="et">
</div>

<div class="texta">
<input type="text" placeholder="Enter Ending Place" name="ep">
</div>

<div class="texta">
<input type="number" placeholder="Enter Ticket Rate" name="tr">
</div>

<div class="texta">
<input type="number" placeholder="Enter No Of Passengers" name="nop">
</div>

<input class="btnea" type="submit" value="Save">
<a class="btnea" href="trip.jsp">Back</a>
</form>
</div>
<%
   String error=(String)request.getAttribute("l");
if(error=="null")
{
	%><p class="error" style="color: red;">Please fill in all the fields</p><%
}
else if(error=="pass")
{
	%><p class="error" style="color: green;">Successfully Saved</p> <%
}
%>
</body>
</html>