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
<h2 align="right" style="color: black;">Admin: <%=hs.getAttribute("s") %></h2>
<h1>REPORT</h1><br>
<ul class="re">
<li><a href="view.jsp">Bus Report</a></li>
<li><a href="viewc.jsp">Conductor Report</a></li>
<li><a href="viewd.jsp">Driver Report</a></li>
<li><a href="viewt.jsp">Trip Report</a></li>
<li><a href="viewsal.jsp">Salary Report</a></li>
</ul>
</body>
</html>