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
<body class="addi">
<%
HttpSession hs=request.getSession(false);

%>
<h2 align="right" style="color: blue;">Admin: <%=hs.getAttribute("s") %></h2>
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
String q="select cn from conductor union select dn from driver";
ResultSet rs;
rs=s.executeQuery(q);

%>
<div class="baa"></div>
<div class="add">
<h1>Salary Details</h1><br>
<form action="addsd.jsp" method="get">
<div class="texta">
<select class="com" name="dc" title="Select Driver/Conductor">
                           <% while(rs.next())
                        	   {%>
                        	 <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
                        	 
                          <%} %>
                          </select></div>
 <div class="texta">                        
<input type="month" title="Select Month-Year" name="m">
</div>
<div class="texta">
<input type="number" placeholder="Enter Total_Salary" name="sal">
</div>
<div class="texta">
<input type="number" placeholder="Enter No_Of_Days_Leave" name="nodl">
</div>

<input class="btna" type="submit" value="Save">
<a class="btna" href="sal.jsp">Back</a>
<%
   String error=(String)request.getAttribute("l");

   if(error=="null")
   {
	   %><p style="color: red;">Please fill the all Fields</p> <%
   }
   else if(error=="pass")
   {
	   %><p style="color: green;">Successfully Saved</p> <% 
   }
%>
</form>
</div>
</body>
</html>