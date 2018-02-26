<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<%
		System.out.println("-------- MySQL JDBC Connection Testing ------------");

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Where is your MySQL JDBC Driver?");
			e.printStackTrace();
			return;
		}

		System.out.println("MySQL JDBC Driver Registered!");
		Connection connection = null;

		try {
			connection = DriverManager.getConnection(
					"jdbc:mysql://mysql1.it.nuigalway.ie:3306/mydb3847?useSSL=false", "mydb3847lr", "qa1ceb");
			//?useSSL=false explicitly disables SSL so that we dont need server's verification
		} catch (SQLException e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			return;
		}

		if (connection != null) {
			System.out.println("You made it, take control your database now!");
		} else {
			System.out.println("Failed to make connection!");
		}

		//1.Create statement
		Statement mystmt = null;
		try {
			mystmt = connection.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//2. Excecute SQL Query
		ResultSet myrs = null;
		try {
			myrs = mystmt.executeQuery("SELECT * FROM whitelist");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	%>



	
<html>
<head>
<style>
#domains {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#domains td, #domains th {
	border: 1px solid #ddd;
	padding: 8px;
}

#domains tr:nth-child(even) {
	background-color: #f2f2f2;
}

#domains tr:hover {
	background-color: #ddd;
}

#domains th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
}
</style>
</head>
<body>

<table id="domains">
  <tr>
    <th>Ranking</th>
    <th>Domain Name</th>

  </tr><%
			//3. Process results

			String driverName = "com.mysql.jdbc.Driver";
			String connectionUrl = "jdbc:mysql://mysql1.it.nuigalway.ie:3306/mydb3847?useSSL=false/";
			String dbName = "mydb3847";
			String userId = "mydb3847lr";
			String password = "qa1ceb";

			try {
				Class.forName(driverName);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			//Connection connection = null;
			Statement statement = null;
			ResultSet resultSet = null;

			try {

				statement = connection.createStatement();
				String sql = "SELECT * FROM whitelist";

				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
		%>
	<tr>

		<td><%=resultSet.getString("Ranking")%></td>
		<td><%=resultSet.getString("Domain_Name")%></td>

	</tr>

	<%
			}

			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>

</body>
</html>