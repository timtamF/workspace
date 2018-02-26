<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	String id = request.getParameter("mydb3847lr");
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://mysql1.it.nuigalway.ie:3306/mydb3847?useSSL=false";
	String database = "mydb3847";
	String userid = "mydb3847lr";
	String password = "qa1ceb";
	try {
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>

	<h1>Retrieve data from database in jsp</h1>
	<table border="1">
		<tr>
			<td>Ranking</td>
			<td>Domain_Name</td>


		</tr>
		<%
			try {
				connection = DriverManager.getConnection(connectionUrl + database, userid, password);
				statement = connection.createStatement();
				String sql = "select * from whitelist";
				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
		%>
		<tr>
			<td><%=resultSet.getString("Ranking")%></td>
			<td><%=resultSet.getString("Domain_Name")%></td>

		</tr>
		<%
			}
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
</body>
</html>