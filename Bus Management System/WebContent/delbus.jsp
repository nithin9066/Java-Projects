<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
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
<body>
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

String bn=request.getParameter("bn");
String q="delete bus where bus_number=?";
PreparedStatement ps;
ps=con.prepareStatement(q);
ps.setString(1, bn);
ps.executeUpdate();
RequestDispatcher rd=request.getRequestDispatcher("delete.jsp");
request.setAttribute("l", "pass");
rd.include(request, response);
%>
</body>
</html>