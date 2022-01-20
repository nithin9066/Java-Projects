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
<h1 >Conductor_Details</h1>
<div class="wave"></div>
<ul>
<li><a href="Addc.jsp">Add Conductor</a></li>
<li><a href="editc.jsp">edit Conductor</a></li>
<li><a href="deletec.jsp">delete Conductor</a></li>
<li><a href="viewc.jsp">view Conductor</a></li>
</ul>
</body>
</html>