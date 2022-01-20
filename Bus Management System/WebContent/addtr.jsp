<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
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

if(d.equals("") && st.equals("") && sp.equals("") && et.equals("") && ep.equals("") && tr.equals(""))
{
	RequestDispatcher rd=request.getRequestDispatcher("Addt.jsp");
	request.setAttribute("l", "null");
	rd.include(request, response);
}
else{

float trr=Float.valueOf(tr);
String nop=request.getParameter("nop");
int nopn=Integer.valueOf(nop);

float mul=trr*nopn;

PreparedStatement ps;
String q="insert into trip values(?,?,?,?,?,?,?,?,?,?,?,?)";
ps=con.prepareStatement(q);
ps.setString(1, tid);
ps.setString(2, bn);
ps.setString(3, cn);
ps.setString(4, dn);
ps.setString(5, d);
ps.setString(6, st);
ps.setString(7, sp);
ps.setString(8, et);
ps.setString(9, ep);
ps.setFloat(10, trr);
ps.setInt(11, nopn);
ps.setFloat(12, mul);
ps.executeUpdate();
RequestDispatcher rd=request.getRequestDispatcher("Addt.jsp");
request.setAttribute("l", "pass");
rd.include(request, response);
}
%>
</body>
</html>