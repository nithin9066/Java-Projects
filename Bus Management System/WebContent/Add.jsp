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
<div class="baa"></div>
<%
HttpSession hs=request.getSession(false);

%>
<h2 align="right" style="color: blue;">Admin: <%=hs.getAttribute("s") %></h2>
<div class="add">
<h1>Add Bus Details</h1> 
<form action="addbus.jsp" method="get">
<div class="texta">
<input type="text" placeholder="Enter Bus Number" name="bn">
</div>
<div class="texta">
<input type="text" placeholder="Enter Driver Name" name="dn">
</div>
<div class="texta">
<input type="text" placeholder="Enter Conductor_Name" name="cn">
</div>
<div class="texta">
<input type="text" placeholder="EnterRoute" name="r">
</div>
<div class="texta">
<input type="number" placeholder="Enter Price" name="p">
</div>
<input class="btna" type="submit" value="Add">
<a class="btna" href="Bus.jsp">Back</a>
<%
  String error=(String)request.getAttribute("l");
  if(error=="null")
  {
	  %><p style="color: red;">Please enter in all fields</p>  <%
  }
  else if(error=="pass")
  {
	  %><p style=color:green>Successfully Saved</p><%
  }
  %>
</form>
</div>
</body>
</html>