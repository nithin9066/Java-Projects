<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
<h2 align="right" style="color: blue;">Admin: <%=hs.getAttribute("s") %></h2>
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
String q="select bus_number from bus";
String q1="select cn from conductor";
String q2="select dn from driver";
String q3="select tid from trip";
ResultSet rs;
rs=s.executeQuery(q3);

%>
<div class="baed"></div>
<div class="editt">
<h1>Edit Trip</h1> 
<form action="edittr.jsp" method="get">

<select class="comi" name="tid" title="Select Trip_Id">
         <%while(rs.next())
        	 {%>
        	 <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
        	 <%} rs=s.executeQuery(q); %>
         </select>
<select class="comi" name="bn" title="Select Bus Number">
                <%while(rs.next())
                {%>
                <option value="<%=rs.getString(1)%>"><%=rs.getString(1) %></option>
                  <%} rs=s.executeQuery(q1);
 %>
                </select>
<select class="comi" name="cn" title="Select Conductor Name">
                <%while(rs.next())
                {%>
                <option value="<%=rs.getString(1)%>"><%=rs.getString(1) %></option>
                  <%} rs=s.executeQuery(q2); %>
                </select>
                               
<select class="comi" name="dn" title="Select Driver Name">
                <%while(rs.next())
                {%>
                <option value="<%=rs.getString(1)%>"><%=rs.getString(1) %></option>
                  <%} %>
                </select>
<div class="texti">
<input type="date" title="Enter Date" name="d">
</div>
<div class="texti">
<input type="time" title="Enter Starting_Time" name="st">
</div>
<div class="texti">
<input type="text" placeholder="Enter Starting_Place" name="sp">
</div>
<div class="texti"> 
<input type="time" title="Enter Ending_Time" name="et"> 
</div>
<div class="texti">
<input type="text" placeholder="Enter Ending_Place" name="ep">
</div>
<div class="texti">
<input type="number" placeholder="Enter Ticket_Rate" name="tr">
</div>
<div class="texti">
<input type="number" placeholder="Enter No_Of_Passengers" name="nop">
</div>
<input class="btni" type="submit" value="Edit">
<a class="btni" href="trip.jsp">Back</a>
<%
   String error=(String)request.getAttribute("l");
if(error=="null")
{
	%><p class="errori" style="color: red;">Please fill in all the fields</p><%
}
else if(error=="pass")
{
	%><p class="errori" style="color: green;">Successfully Updated</p> <%
}
%>
</form>
</div>
</body>
</html>