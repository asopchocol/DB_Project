<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>list_skill</title>
</head>
<body>
<table border="1" width="600">
	<tr>
		<td>스킬이름</td>
		<td>체력증가</td>
		<td>마력증가</td>
	</tr>
<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	
	String oskillname = request.getParameter("oskillname");
	
	System.out.println(oskillname);
	
	String sql="select * from 스킬 where 스킬이름=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, oskillname);
	rs = pstmt.executeQuery();
	
	rs.next();
	String hpup = rs.getString("체력증가");
	String mpup = rs.getString("마력증가");
	
%>

		<tr>
		<td><%=oskillname%></td>
		<td><%=hpup %></td>
		<td><%=mpup %></td>
	</tr>

<%
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>