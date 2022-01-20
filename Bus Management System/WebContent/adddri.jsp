<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
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

String dn=request.getParameter("dn");
String ad=request.getParameter("ad");
String pn=request.getParameter("pn");
String st=request.getParameter("st");
String d=request.getParameter("d");
if(dn.equals("") && ad.equals("") && pn.equals("") && st.equals("") && d.equals(""))
{
	RequestDispatcher rd=request.getRequestDispatcher("Addc.jsp");
	request.setAttribute("l", "null");
	rd.include(request, response);
}
else{
PreparedStatement ps=null;
String q="insert into driver values(?,?,?,?,?)";
ps=con.prepareStatement(q);
ps.setString(1, dn);
ps.setString(2, ad);
ps.setString(3, pn);
ps.setString(4, st);
ps.setString(5, d);
ps.executeUpdate();

RequestDispatcher rd=request.getRequestDispatcher("Addd.jsp");
request.setAttribute("l", "pass");
rd.include(request, response);
}
%>
</body>
</html>