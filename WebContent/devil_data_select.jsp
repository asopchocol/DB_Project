<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">

<title>data_select</title>
<b>
</head>
<body>
<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
 %>


<table border="1" width="300">
	<tr>
		<td>군단갯수</td>
		<td>총병력수</td>
		<td>총공격력</td>
		<td>총방어력</td>
		<td>총이동력</td>
		<td>총사기</td>
	</tr>
	
	
	<%
	String sql = "SELECT COUNT(이름) as 군단갯수, sum(병력수) as 총병력수, sum(총공격력) as TOTAL공격력, sum(총방어력) as TOTAL방어력, sum(이동력) as TOTAL이동력, sum(사기) as TOTAL사기 FROM 마물군단";
	ResultSet rs = stmt.executeQuery(sql);	
	while(rs.next()) {
		String devil_number = rs.getString("군단갯수");
		String totalnumber = rs.getString("총병력수");
        String totalattack = rs.getString("TOTAL공격력");
        String totaldefense = rs.getString("TOTAL방어력");
        String totalmove = rs.getString("TOTAL이동력");
        String totalmoral = rs.getString("TOTAL사기");   
     %>
     
     
		<tr>
		<td><%=devil_number %></td>
		<td><%=totalattack %></td>
		<td><%=totalnumber %></td>
		<td><%=totaldefense %></td>
		<td><%=totalmove %></td>
		<td><%=totalmoral %></td>
	</tr>
	
	
<%} %>
<%
	
}
catch(Exception e) {
		e.printStackTrace();
}

%>

<form method="post" action="logout.jsp">
	  <button type="submit">logout</button>
</form>

</body>
</html>