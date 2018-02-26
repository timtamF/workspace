<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<HTML>
<HEAD>
<TITLE>Navigating in a Database Table</TITLE>
</HEAD>
<BODY bgcolor="#ffffcc">
	<font size="+3" color="green"><br>Welcome in
		www.roseindia.net !</font>
	<br>
	<font size="+1" color="#6E6E6E"><br>This is dynamic page
		that shows data<br> from database as per user choice.</font>
	<%
		int current = 0;
		// declare a connection by using Connection interface 
		Connection connection = null;
		/* Create string of connection url within specified format with machine 
		name, port number and database name. Here machine name id localhost 
		and database name is student. */
		String connectionURL = "jdbc:mysql://mysql1.it.nuigalway.ie:3306/mydb3847?useSSL=false";
		/*declare a resultSet that works as a table resulted by execute a specified 
		sql query. */
		ResultSet rs = null;
	%>
	<FORM NAME="form1" ACTION="nextrecord.jsp" METHOD="get">
		<%
			if (request.getParameter("hidden") != null) {
				current = Integer.parseInt(request.getParameter("hidden"));
			}
			// Declare statement.
			Statement statement = null;
			try {
				// Load JDBC driver "com.mysql.jdbc.Driver"
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				/* Create a connection by using getConnection() method that takes 
				parameters of string type connection url, user name and password to 
				connect to database. */
				connection = DriverManager.getConnection(connectionURL, "mydb3847", "qa1ceb");
				/* createStatement() is used for create statement object that is 
				used for sending sql statements to the specified database. */
				statement = connection.createStatement();
				// executeQuery() method execute specified sql query. 
				rs = statement.executeQuery("select * whitelist");
				for (int i = 0; i < current; i++) {
					rs.next();
				}
				if (!rs.next()) {
		%>
		<FONT size="+2" color="red"></b> <%
 	out.println("Sorry ! found some problems with database.");
 		} else {
 %>
			<TABLE style="background-color: #ECE5B6;" WIDTH="30%">

				<TR>
					<TH width="50%">ID</TH>
					<TD width="50%"><%=rs.getInt(1)%></TD>
				</tr>
				<TR>
					<TH>Rank</TH>
					<TD><%=rs.getString(2)%></TD>
				</tr>
				<TR>
					<TH>Name</TH>
					<TD><%=rs.getString(3)%></TD>
				</tr>

				</TR>
			</TABLE> <BR> <INPUT TYPE="hidden" NAME="hidden"
			VALUE="<%=current + 1%>"> <INPUT TYPE="submit"
			VALUE="next record">
	</FORM>
	<%
		}
		} catch (Exception ex) {
	%>
	<FONT size="+3" color="red"></b> <%
 	out.println("Unable to connect to database.");
 	} finally {
 		// close all the connections.
 		rs.close();
 		statement.close();
 		connection.close();
 	}
 %> </FONT>
	</FORM>
</body>
</html>