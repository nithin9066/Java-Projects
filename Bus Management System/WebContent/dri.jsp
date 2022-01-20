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
<h1>DRIVER DETAILS</h1>
<div class="wave"></div>
<ul class="dri">
<li><a href="Addd.jsp">Add Driver</a></li>
<li><a href="editd.jsp">edit Driver</a></li>
<li><a href="deleted.jsp">delete Driver</a></li>
<li><a href="viewd.jsp">view Driver</a></li>
</ul>
</body>
</html>