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
String n=(String)hs.getAttribute("s");
%>

<h2 align="right" style="color: navy;">Admin: <%=n %></h2>
<a class="home" href="homepage.jsp"></a>
<h1>BUS DETAILS</h1>

<div class="wave">
</div>
<ul class="bus">
<li><a href="Add.jsp">Add Bus</a></li>
<li><a href="edit.jsp">edit Bus</a></li>
<li><a href="delete.jsp">delete Bus</a></li>
<li><a href="view.jsp">view Bus</a></li>
</ul>
</body>
</html>