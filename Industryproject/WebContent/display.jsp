
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%Class.forName("com.mysql.jdbc.Driver");%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display</title>
</head>
<h1>Display Results</h1>


<body>
	<% public class whitelist{
	String URL = "jdbc:mysql://mysql1.it.nuigalway.ie:3306/mydb3847";
	String USERNAME = "mydb3847lr";
	String PASSWORD = "qa1ceb";
	
	Connection connection = null;
	PreparedStatement  selectWhitelist = null;
	ResultSet resultSet = null;
	
	public whitelist(){
		
		try{
		
		connection = DriverManager.getConnection("jdbc:mysql://mysql1.it.nuigalway.ie:3306/mydb3847?useSSL=false","mydb3847lr", "qa1ceb");
		selectWhitelist = connection.prepareStatement("SELECT Ranking, Domain_Name FROM whitelist WHERE Ranking = ? AND Domain_Name = ?");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		public ResultSet selectWhitelist(int rank, String name){
			
		try{
			selectWhitelist.setString(1, rank);
			selectWhitelist.setString(2, name);
			
	 		resultSet = selectWhitelist.excecuteQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultSet;
	}
	}	
	}

	String rank = new String();
	String name = new String();
	
	if (request.getParameter("rank") !=null){
		rank = request.getParameter("rank");
	}
	if (request.getParameter("name") !=null){
		name = request.getParameter("name");
	}
	
 whitelist list = new whitelist();
 ResultSet resultlist = list.selectWhitelist(rank, name);
     %>

<head>
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
</head>
<body>

	<h2>Results</h2>

	<table>
		<tr>
			<th>Rank</th>
			<th>Domain Name</th>

		</tr>
		<% while resultlist.next()){ %>
		<tr>
			<td><%= resultlist.getInt("rank") %></td>
			<td><%= resultlist.getInt("name") %></td>

		</tr>
		<% } %>
	</table>


</body>
</html>










