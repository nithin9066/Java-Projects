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
String tr=request.getParameter("tr");
System.out.print(tr);
float trr=Float.valueOf(tr);
String nop=request.getParameter("nop");
System.out.print(trr);
int nopn=Integer.valueOf(nop);

float mul=trr*nopn;
System.out.print(mul);
PrintWriter pw=response.getWriter();

pw.write("<select name='tc'><option value="+mul+"></option></select>s");
RequestDispatcher rd=request.getRequestDispatcher("Addt.jsp");
rd.include(request, response);

%>
</body>
</html>