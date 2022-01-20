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

String dc=request.getParameter("dc");
String m=request.getParameter("m");
String sal=request.getParameter("sal");
String nodl=request.getParameter("nodl");

if(m.equals("") && sal.equals("") && nodl.equals(""))
{
	RequestDispatcher rd=request.getRequestDispatcher("addsal.jsp");
	request.setAttribute("l", "null");
	rd.include(request, response);
}
int nodll=Integer.valueOf(nodl);

int sall=Integer.valueOf(sal);

int ldd=(sall/30)*nodll;

double pf=0.02*sall;
double esi=0.03*sall;
double bal=(0.05*sall)+ldd;
bal=sall-bal;

PreparedStatement ps;
String q="insert into sal values(?,?,?,?,?,?,?,?)";
ps=con.prepareStatement(q);
ps.setString(1, dc);
ps.setString(2, m);
ps.setFloat(3, sall);
ps.setString(4, nodl);
ps.setFloat(5, ldd);
ps.setDouble(6, pf);
ps.setDouble(7, esi);
ps.setDouble(8, bal);
ps.executeUpdate();
RequestDispatcher rd=request.getRequestDispatcher("addsal.jsp");
request.setAttribute("l", "pass");
rd.include(request, response);

%>
</body>
</html>