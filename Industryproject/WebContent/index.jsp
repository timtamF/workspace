
<%-- <%@ page import="java.sql.*"%>
<% Class.forName("com.sql.jdbc.Driver"); %> --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!DOCTYPE html>
<html>
<style>
input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 100%;
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

div {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}
</style>
<body>

	<h3></h3>

	<div>

		<!-- --- This line is linking my form to my display jsp file-->
		<form name="myForm" action="select3.jsp" method="POST">
			<label for="fname">Enter Domain Name:</label> <input type="text"
				placeholder="Domain name.."> <input type="Submit"
				value="Submit" name="Submit">
		</form>
	</div>



</body>

<footer>


<table style="width: 100%">
	<tr>
		<th><a href="DNS.html">Go to DNS Query Analysis</a></th>
		<th><a href="DOB.html.html">Go to Domain Birth Dates Registry</a></th>

	</tr>
	<p>Posted by: Ryan Lally</p>
	<p>
		Contact information: <a href="ryanlally91@gmail.com"> Ryan Lally</a>.
	</p>

	</footer>
	</html>