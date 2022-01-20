<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="style.css">
<body class="deli">
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
ResultSet rs;
rs=s.executeQuery(q);

%>
<%
HttpSession hs=request.getSession(false);

%>
<h2 align="right" style="color: aqua;">Admin: <%=hs.getAttribute("s") %></h2>
<div class="bad"></div>
<div class="del">
<h1>Delete Bus</h1> 

<form action="delbus.jsp" method="get">
<select class="comd" name="bn" title="Bus Number">
                <%while(rs.next())
                {%>
                <option value="<%=rs.getString(1)%>"><%=rs.getString(1) %></option>
                  <%} %>
                </select>

<input class="btnd" type="submit" value="Delete">
<a class="btnd" href="Bus.jsp">Back</a>
<%
  String req=(String)request.getAttribute("l");
  if(req=="pass")
  {
	  %> <p style=color:green>Successfully Deleted</p> <%
  }
%>
</form>
</div>
</body>
</html>