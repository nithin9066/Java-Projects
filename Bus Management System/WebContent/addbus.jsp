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
String dn=request.getParameter("dn");
String cn=request.getParameter("cn");
String r=request.getParameter("r");
String p=request.getParameter("p");

if(bn.equals("") && dn.equals("") && cn.equals("") && r.equals("") && p.equals(""))
{
	RequestDispatcher rd1=request.getRequestDispatcher("Add.jsp");
	request.setAttribute("l", "null");
	rd1.include(request, response);
}
else
{

float pz=Float.valueOf(p);
PreparedStatement ps=null;
String q="insert into bus values(?,?,?,?,?)";
ps=con.prepareStatement(q);
ps.setString(1, bn);
ps.setString(2, dn);
ps.setString(3, cn);
ps.setString(4, r);
ps.setFloat(5, pz);
ps.executeUpdate();

RequestDispatcher rd=request.getRequestDispatcher("Add.jsp");
request.setAttribute("l", "pass");
rd.include(request, response);
}
%>
</body>
</html>