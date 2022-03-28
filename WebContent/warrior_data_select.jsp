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
<table border="1" width="300">
	<tr>
		<td>종족명</td>
		<td>총용사수</td>
	</tr>
<br>
<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	
	String sql = "SELECT 종족명, COUNT(ID) as 총용사수 FROM 용사 group by 종족명";
	ResultSet rs = stmt.executeQuery(sql);	
	
	while(rs.next()) {
		String tribe = rs.getString("종족명");
        String totalnumber = rs.getString("총용사수");
        
        %>
		<tr>
		<td><%=tribe %></td>
		<td><%=totalnumber %></td>
	</tr>
<%} %>


<table border="1" width="300">
	<tr>
		<td>종족명</td>
		<td>총공격력</td>
		<td>총방어력</td>
		<td>총체력</td>
		<td>총마력</td>
		<td>총힘</td>
		<td>총지능</td>
	</tr>
	
	
	<%
	sql = "SELECT 종족명, sum(공격력) as 총공격력, sum(방어력) as 총방어력, sum(체력) as 총체력, sum(마력) as 총마력, sum(힘) as 총힘, sum(지능) as 총지능 FROM 용사 GROUP BY 종족명";
	rs = stmt.executeQuery(sql);	
	while(rs.next()) {
		String tribe = rs.getString("종족명");
        String totalattack = rs.getString("총공격력");
        String totaldefense = rs.getString("총방어력");
        String totalhp = rs.getString("총체력");
        String totalmp = rs.getString("총마력");
        String totalstr = rs.getString("총힘");
        String totalintelli = rs.getString("총지능");       
     %>
     
     
		<tr>
		<td><%=tribe %></td>
		<td><%=totalattack %></td>
		<td><%=totaldefense %></td>
		<td><%=totalhp %></td>
		<td><%=totalmp %></td>
		<td><%=totalstr %></td>
		<td><%=totalintelli %></td>
	</tr>
	
	
<%} %>

<table border="1" width="300">
	<tr>
		<td>ID(용사)</td>
		<td>이름(아이템)</td>
	</tr>
	
	
<br>
<%
	sql = "SELECT 용사.ID, 아이템.이름 FROM 용사,아이템 WHERE 용사.ID=아이템.ID";
	rs = stmt.executeQuery(sql);
	while(rs.next()) {
		String warriorid = rs.getString("ID");
        String itemname = rs.getString("이름");
     %>
        
		<tr>
		<td><%=warriorid %></td>
		<td><%=itemname %></td>
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