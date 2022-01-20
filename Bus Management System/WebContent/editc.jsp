<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="editi">
<%
HttpSession hs=request.getSession(false);

%>

<%
 Connection con=null;
try 
{
  	Class.forName("oracle.jdbc.driver.OracleDriver");
      con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
     
} catch (ClassNotFoundException e)
  {
	    e.printStackTrace();
  }
Statement s;
s=con.createStatement();
String q="select cn from conductor";
ResultSet rs;
rs=s.executeQuery(q);

%>
<h2 align="right" style="color: blue;">Admin: <%=hs.getAttribute("s") %></h2>
<div class="bae"></div>
<div class="edit">

<h1>Edit Conductor</h1> 
<form action="editcon.jsp" method="get">

<select class="comi" name="cn" title="Select Conductor Name">
                <%while(rs.next())
                {%>
                <option value="<%=rs.getString(1)%>"><%=rs.getString(1) %></option>
                  <%} %>
                </select>
<div class="texti">
<input type="text" placeholder="Enter Address" name="ad">
</div>
<div class="texti">
<input type="number" placeholder="Enter Phone Number" name="pn">
</div>
<div class="texti">
<input type="time" title="Enter Shift Time" name="st">
</div>
<div class="texti">
<input type="date" title="Enter Date of Joining" name="d">
</div>
<input class="btni" type="submit" value="Edit">
<a class="btni" href="conductor.jsp">Back</a>
<%
    String error=(String)request.getAttribute("l");
if(error=="null")
{
	%><p style="color: red;">Please fill in all the fields</p><%
}
else if(error=="pass")
{
	%><p style="color: green;">Successfully Updated</p> <%
}
%>

</form>
</div>

</body>
</html>