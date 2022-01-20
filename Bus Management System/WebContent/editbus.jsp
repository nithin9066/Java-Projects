<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
String a=null,b=null,cc=null,d=null;
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
String c=request.getParameter("c");
if(c.equals("Edit"))
{
if(dn.equals("") && cn.equals("") && r.equals("") && p.equals(""))
{
	RequestDispatcher rd1=request.getRequestDispatcher("edit.jsp");
	request.setAttribute("l", "null");
	rd1.include(request, response);
}
else if(!dn.equals("") && !cn.equals("") && !r.equals("") && !p.equals(""))
{

float pz=Float.valueOf(p);
PreparedStatement ps;
String q="update bus set driver=?,conductor=?,route=?,price=? where bus_number=?";
ps=con.prepareStatement(q);
ps.setString(1, dn);
ps.setString(2, cn);
ps.setString(3, r);
ps.setFloat(4, pz);
ps.setString(5, bn);
ps.executeUpdate();
RequestDispatcher rd=request.getRequestDispatcher("edit.jsp");
request.setAttribute("l", "pass");
rd.include(request, response);
}
}
else if(c.equals("click"))
{
	Statement s;
	PreparedStatement ps;
	
	PrintWriter pw=response.getWriter();
	s=con.createStatement();
	String bnn=request.getParameter("bn");
	String q="select driver,conductor,route,price from bus where bus_number=?";
	ps=con.prepareStatement(q);
	ps.setString(1, bnn);
	ps.executeUpdate();
	ResultSet rs;
	rs=ps.executeQuery(q);
	while(rs.next())
	{
		a=rs.getString(1);
		b=rs.getString(2);
		cc=rs.getString(3);
		d=rs.getString(4);
		
	}
	request.setAttribute("a", a);
	request.setAttribute("b", b);
	request.setAttribute("c", cc);
	request.setAttribute("d", d);
	RequestDispatcher rd=request.getRequestDispatcher("edit.jsp");
	rd.include(request, response);

}
%>
</body>
</html>