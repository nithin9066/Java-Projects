<%@page import="java.sql.PreparedStatement"%>
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
<body class="editi">
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
<h2 align="right" style="color: blue;">Admin: <%=hs.getAttribute("s") %></h2>
<div class="bae"></div>
<div class="edit">
<h1>Edit Bus</h1> 

<form action="editbus.jsp" method="get">

<select class="comi" name="bn" title="Bus Number">
<%while(rs.next())
  {%>
     <option value="<%=rs.getString(1)%>"><%=rs.getString(1) %></option>
<%}
String a=(String)request.getAttribute("a");
String b=(String)request.getAttribute("b");
String c=(String)request.getAttribute("c");
String d=(String)request.getAttribute("d");
String e=(String)request.getAttribute("e");
%>
</select><input class="check" type="submit" title="previous data" name="c" value="click">

<%
if(a==null)
{
%><div class="texti"><input type="text" placeholder="Enter Driver Name" title="Enter Driver Name" name="dn"></div>
<%}
%>
<% if(a!=null){%>
<div class="texti">
<input type="text" placeholder="Enter Driver Name" title="Enter Driver Name" name="dn" value=<%=a%>>
</div>
<%}%>
<%
if(b==null)
{%>
	<div class="texti">
	<input type="text" placeholder="Enter Conductor Name" title="Enter Conductor Name" name="cn">
	</div>
<%}

else if(b!=null)
{%><div class="texti">
<input type="text" placeholder="Enter Conductor Name" title="Enter Conductor Name" name="cn" value=<%=b%>>
</div><%} %>

<% if(b==null)
{%>
<div class="texti">
<input type="text" placeholder="Enter Route" title="Enter Route" name="r">
</div>
<%} 
else if(b!=null)
{%><div class="texti">
<input type="text" placeholder="Enter Route" title="Enter Route" name="r" value=<%=c%>>
</div><%} %>

<div class="texti">
<input type="number" placeholder="Enter Price" title="Enter Price" name="p" value=<%=d%>>
</div>
<input class="btni" type="submit" name="c" value="Edit">
<a class="btni" href="Bus.jsp">Back</a>
<%
  String error=(String)request.getAttribute("l");
  if(error=="null")
  {
	  %><p style="color: red;">Please enter in all fields</p>  <%
  }
  else if(error=="pass")
  {
	  %><p style=color:green>Successfully updated</p><%
  }
%>
</form>
</div>
</body>
</html>