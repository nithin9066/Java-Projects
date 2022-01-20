<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color: black;">
<%
   HttpSession hs=request.getSession(false);
  String n=(String) hs.getAttribute("s");
%>
	 
	  <div class="nav">
	  <p align="right" style=color:white>Admin:<%=n %></p>
	  <label>HOME PAGE</label>
	  <div class="float">
	  <a class="h" href="Bus.jsp">Bus details</a>
	  <a class="h" href="conductor.jsp">Conductor</a>
	  <a class="h" href="dri.jsp">Driver</a>
	  <a class="h" href="trip.jsp">Trip</a>
	  <a class="h" href="sal.jsp">Salary</a>
	  <a class="h" href="report.jsp">Report</a>
	  <a class="h" href="logout.jsp">Logout</a>
	  </div>
	  </div>
	  <section>
	  <video src="smoke.mp4" autoplay muted></video>
	  <h1 class="ani">
	  <span>B</span>
	  <span>U</span> 
	  <span>S</span>
	  <span>-</span>
	  <span>M</span>
	  <span>A</span>
	  <span>N</span>
	  <span>A</span>
	  <span>G</span>
	  <span>M</span>
	  <span>E</span>
	  <span>N</span>
	  <span>T</span>
	  </h1>
	  </section>
</body>
</html>