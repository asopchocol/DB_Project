<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>list_tribe</title>
</head>
<body>
<table border="1" width="600">
	<tr>
		<td>종족명</td>
		<td>공격력보정</td>
		<td>방어력보정</td>
		<td>체력보정</td>
		<td>마력보정</td>
		<td>힘보정</td>
		<td>지능보정</td>
	</tr>
<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	
	String tribe = request.getParameter("otribe");
	
	System.out.println(tribe);
	
	String sql="select * from 종족 where 종족명=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, tribe);
	rs = pstmt.executeQuery();
	
	rs.next();
	String attackud = rs.getString("공격력보정");
	String defenseud = rs.getString("방어력보정");
	String hpud = rs.getString("체력보정");
	String mpud = rs.getString("마력보정");		
	String strud = rs.getString("힘보정");
	String intelliud = rs.getString("지능보정");
	
%>

		<tr>
		<td><%=tribe%></td>
		<td><%=attackud %></td>
		<td><%=defenseud %></td>
		<td><%=hpud %></td>
		<td><%=mpud %></td>
		<td><%=strud %></td>
		<td><%=intelliud %></td>
	</tr>

<%
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>