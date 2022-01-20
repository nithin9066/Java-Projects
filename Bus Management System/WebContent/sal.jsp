<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="back">
<%
HttpSession hs=request.getSession(false);

%>
<h2 align="right" style="color: blue;">Admin: <%=hs.getAttribute("s") %></h2>
<a class="home" href="homepage.jsp"></a>
<h1 align="center" style="color: red;">Salary Details</h1>
<ul class="sal">
<li><a href="addsal.jsp">Add Salary</a></li>
<li><a href="viewsal.jsp">View Salary</a></li>
</ul>
</body>
</html>