<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
String q="select cn from conductor";
ResultSet rs;
rs=s.executeQuery(q);

%>
<%
HttpSession hs=request.getSession(false);

%>
<h2 align="right" style="color: aqua;">Admin: <%=hs.getAttribute("s") %></h2>


<div class="bad"></div>
<div class="del">
<h1>Delete conductor</h1>
<form action="delcon.jsp" method="get">
<select class="comd" name="cn" title="Select Conductor Name">
                <%while(rs.next())
                {%>
                <option value="<%=rs.getString(1)%>"><%=rs.getString(1) %></option>
                  <%} %>
                </select>

<input class="btnd" type="submit" value="Delete">
<a class="btnd" href="conductor.jsp">Back</a>
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