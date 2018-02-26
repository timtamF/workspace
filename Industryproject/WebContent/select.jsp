<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>

<%
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

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>
<h2 align="center">
	<font color="#FF00FF"><strong>Select query in JSP</strong></font>
</h2>
<table align="center" cellpadding="4" cellspacing="4">
	<tr>

	</tr>
	<tr bgcolor="#008000">
		<td><b>Rank</b></td>
		<td><b>Name</b></td>

	</tr>
	<%
		try {
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			statement = connection.createStatement();
			String sql = "SELECT * FROM whitelist";

			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
	%>
	<tr bgcolor="#8FBC8F">

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