<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="addi">
<%
HttpSession hs=request.getSession(false);

%>
<h2 align="right" style="color: blue;">Admin: <%=hs.getAttribute("s") %></h2>
<div class="baa"></div>
<div class="add">
<h1>Add Conductor</h1> 
<form action="addcon.jsp" method="get">
<div class="texta">
<input type="text" placeholder="Enter Conductor Name" name="cn">
</div>
<div class="texta">
<input type="text" placeholder="Enter Address" name="ad">
</div>
<div class="texta">
<input type="number" placeholder="Enter Phone Number" name="pn">
</div>
<div class="texta">
<input type="time" title="Enter Shift Time" name="st">
</div>
<div class="texta">
<input type="date" title="Enter Date of Joining" name="d">
</div>
<input class="btna" type="submit" value="Save">
<a class="btna" href="conductor.jsp">Back</a>
<%
   String error=(String)request.getAttribute("l");
if(error=="null")
{
	%><p style="color: red;">Please fill in all the fields</p><%
}
else if(error=="pass")
{
	%><p style="color: green;">Successfully Saved</p> <%
}
%>
</form>
</div>

</body>
</html>