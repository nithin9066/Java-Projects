<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","1234");
     
} catch (ClassNotFoundException e)
  {
	    e.printStackTrace();
  }
  Statement s;
  String name=null,pas=null;
  
  s=con.createStatement();
  ResultSet rs;
  String q="select * from admin";
  rs=s.executeQuery(q);
  while(rs.next())
  {
	  name=rs.getString(1);
	  pas=rs.getString(2);
  }
  
  String n=request.getParameter("n");
  String p=request.getParameter("p");
  HttpSession hs=request.getSession(true);
  hs.setAttribute("s", n);
  
  if(name.equals(n) && pas.equals(p))
  {
	 RequestDispatcher rd=request.getRequestDispatcher("homepage.jsp");
	 rd.forward(request, response);

	  
  }
  else if(n.equals("") || p.equals(""))
  {
	  RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
	  request.setAttribute("l","null");
	  rd.include(request, response);
	  }
  else if(!name.equals(n) || !pas.equals(p))
  {
	  RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
	  request.setAttribute("l", "error");
	  rd.include(request, response);
  }

%>

</body>
</html>