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
<body class="deli">
<%
HttpSession hs=request.getSession(false);

%>
<h2 align="right" style="color: aqua;">Admin: <%=hs.getAttribute("s") %></h2>
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
String q3="select tid from trip";
ResultSet rs;
rs=s.executeQuery(q3);

%>
<div class="bad"></div>
<div class="del">
<h1>Delete Trip</h1>
<form action="deltr.jsp" method="get">
<select class="comd" name="tid" title="Select Trip_Id">
         <%while(rs.next())
        	 {%>
        	 <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
        	 <%}%>
         </select>


<input class="btnd" type="submit" value="Delete">
<a class="btnd" href="trip.jsp">Back</a>
<%
String error=(String)request.getAttribute("l");
if(error=="pass")
{
	%><p style="color: green;">Successfully Deleted</p> <%
}
%>
</form>
</div>
</body>
</html>