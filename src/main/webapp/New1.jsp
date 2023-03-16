<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String uname = request.getParameter("uname");
	String pass = request.getParameter("pass");
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	String name = request.getParameter("name");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Load the Class");
		Connection con = DriverManager.getConnection("Jdbc:mysql://Localhost:3306/professional", "root", "root");
		System.out.println("connection is build");

		PreparedStatement st = con.prepareStatement("insert into Page values(?,?,?,?,?)");
		st.setString(1, uname);
		st.setString(2, pass);
		st.setString(3, address);
		st.setString(4, city);
		st.setString(5, name);
		int i = st.executeUpdate();
		
		Statement st1 = con.createStatement();
		st.executeUpdate("DELETE FROM Page WHERE uname='abc'");
		System.out.println("execute Query");
		ResultSet rs = st.executeQuery("select * from Page");
	%>
	<table border="3" style="background-color: pink;">
		<tr>
			<th>uname</th>
			<br>
			<th>pass</th>
			<br>
			<th>address</th>
			<br>
			<th>city</th>
			<br>
			<th>name</th>
		<tr>
			<%
			while (rs.next()) {
			%>
		
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
		</tr>
		<%
		}
		%>
		<%
		rs.close();
		st1.close();
		st.close();
		con.close();
		
		} catch (Exception e) {
		System.out.println(e);
		}
		%>

	</table>
</body>
</html>