<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<div class="ba"></div>
<body class="l">

<div class="login">
<h1>Login</h1>

<form action="Home.jsp" method="get">
<a class="info" href="Details.jsp">AdminInfo</a>
<div class="text">
<input type="text" placeholder="Username" name="n">
</div>
<div class="text">
<input type="password" placeholder="Password" name="p">
</div>
<input class="btn" type="submit" value="Login">
<%
    String error=(String)request.getAttribute("l");
    if(error=="null")
    {
    	%><p style=color:red><b>Please enter Username or Password</b></p><%
    }
    else if(error=="error")
    {
    	%><p style=color:red><b>Invalid Details</b></p><%
    }
%>
</form>
 </div>
</body>

</html>