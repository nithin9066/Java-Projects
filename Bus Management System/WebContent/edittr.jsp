<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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

String tid=request.getParameter("tid");
String bn=request.getParameter("bn");
String cn=request.getParameter("cn");
String dn=request.getParameter("dn");
String d=request.getParameter("d");
String st=request.getParameter("st");
String sp=request.getParameter("sp");
String et=request.getParameter("et");
String ep=request.getParameter("ep");
String tr=request.getParameter("tr");
RequestDispatcher rd;
if(d.equals("") && st.equals("") && sp.equals("") && et.equals("") && ep.equals("") && tr.equals(""))
{
	rd=request.getRequestDispatcher("editt.jsp");
	request.setAttribute("l", "null");
	rd.include(request, response);
} else{

float trr=Float.valueOf(tr);
String nop=request.getParameter("nop");
int nopn=Integer.valueOf(nop);

float mul=trr*nopn;

PreparedStatement ps;
String q="update trip set bn=?,cn=?,dn=?,d=?,st=?,sp=?,et=?,ep=?,tr=?,nop=?,tc=? where tid=?";
ps=con.prepareStatement(q);
ps.setString(1, bn);
ps.setString(2, cn);
ps.setString(3, dn);
ps.setString(4, d);
ps.setString(5, st);
ps.setString(6, sp);
ps.setString(7, et);
ps.setString(8, ep);
ps.setFloat(9, trr);
ps.setInt(10, nopn);
ps.setFloat(11, mul);
ps.setString(12, tid);
ps.executeUpdate();

rd=request.getRequestDispatcher("editt.jsp");
request.setAttribute("l", "pass");
rd.include(request, response);
}

%>
</body>
</html>