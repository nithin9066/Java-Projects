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
<h3 align="right" style="color: blue;">Admin: <%=hs.getAttribute("s") %></h3>
<a class="home" href="homepage.jsp"></a>
<h1>Trip Details</h1>
<ul class="bus">
<li><a href="Addt.jsp">Add Trip</a></li>
<li><a href="editt.jsp">edit Trip</a></li>
<li><a href="deletet.jsp">delete Trip</a></li>
<li><a href="viewt.jsp">view Trip</a></li>
</ul>
</body>
</html>