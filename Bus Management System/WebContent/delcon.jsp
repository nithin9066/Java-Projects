<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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

String cn=request.getParameter("cn");
String q="delete conductor where cn=?";
PreparedStatement ps;
ps=con.prepareStatement(q);
ps.setString(1, cn);
ps.executeUpdate();
RequestDispatcher rd=request.getRequestDispatcher("deletec.jsp");
request.setAttribute("l", "pass");
rd.include(request, response);
%>
</body>
</html>