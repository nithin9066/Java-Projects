<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
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
String ad=request.getParameter("ad");
String pn=request.getParameter("pn");
String st=request.getParameter("st");
String d=request.getParameter("d");
RequestDispatcher rd;
if(!ad.equals("") && !pn.equals("") && !st.equals("") && !d.equals(""))
{

PreparedStatement ps;
String q="update conductor set ad=?,pn=?,st=?,doj=? where cn=?";
ps=con.prepareStatement(q);

ps.setString(1, ad);

ps.setString(2, pn);

ps.setString(3, st);

ps.setString(4, d);

ps.setString(5, cn);
ps.executeUpdate();
rd=request.getRequestDispatcher("editc.jsp");
 request.setAttribute("l", "pass");
rd.include(request, response);
}
else if(ad.equals("") && pn.equals("") && st.equals("") && d.equals(""))
		{
rd=request.getRequestDispatcher("editc.jsp");
request.setAttribute("l", "null");
rd.include(request, response);
		}
%>
</body>
</html>