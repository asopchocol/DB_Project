<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Simulation fight</title>
</head>
<body>
<form method="post" action="simulation_fight_execute.jsp">
<table border="1" width="800">
<thead>
	<tr>
		<td>선택</td>
		<td>용사ID</td>
		<td>이름</td>
		<td>나이</td>
		<td>출생지</td>
		<td>공격력</td>
		<td>방어력</td>
		<td>체력</td>
		<td>마력</td>
		<td>힘</td>
		<td>지능</td>
		<td>종족명</td>
		<td>스킬이름</td>
	</tr>
</thead>
	<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	ResultSet rs = null;
	String sql = "SELECT * FROM 용사";
	rs=stmt.executeQuery(sql);
 	
    while(rs.next()) {
        String oid = rs.getString("ID");
        String opw = rs.getString("PASSWORD");
        String oname = rs.getString("이름");
        String oage = rs.getString("나이");
        String oborn = rs.getString("출생지");
        String oattack = rs.getString("공격력");
        String odeffense = rs.getString("방어력");
        String ohp = rs.getString("체력");
        String omp = rs.getString("마력");
        String ostrong = rs.getString("힘");
        String ointelli = rs.getString("지능");
        String otribe = rs.getString("종족명");
        String oskillname = rs.getString("스킬이름");
        
%>
	<tbody>
		<tr>
		<td><input type ="checkbox" name="warriorselect" value="<%=oid%>"></td>
		<td><%=oid %></td>
		<td><%=oname %></td>
		<td><%=oage %></td>
		<td><%=oborn %></td>
		<td><%=oattack %></td>
		<td><%=odeffense %></td>
		<td><%=ohp %></td>
		<td><%=omp %></td>
		<td><%=ostrong %></td>
		<td><%=ointelli %></td>
		<td><%=otribe %></td>
		<td><%=oskillname %></td>
		</tr>
	</tbody>
	

<%
}
    rs.close();
    stmt.close();
    con.close();
    
	} catch(Exception e) {
			e.printStackTrace();
	}

	%>
	<br>
	<br>
	<br>
	<br>
<thead>
	<tr>
		<td>선택</td>
		<td>이름</td>
		<td>병력수</td>
		<td>총공격력</td>
		<td>총방어력</td>
		<td>이동력</td>
		<td>사기</td>
	</tr>
</thead>	
	
	
<%
	try {
		Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
		Statement stmt = con.createStatement();
		ResultSet rs = null;
		String sql = "SELECT * FROM 마물군단";
		rs=stmt.executeQuery(sql);
		
		while(rs.next()) {
	        String devilname = rs.getString("이름");
	        String number = rs.getString("병력수");
	        String oname = rs.getString("총공격력");
	        String oage = rs.getString("총방어력");
	        String oborn = rs.getString("이동력");
	        String oattack = rs.getString("사기");
	        
	%>
		<tbody>
			<tr>
			<td><input type ="checkbox" name="devilselect" value="<%=devilname%>"></td>
			<td><%=devilname %></td>
			<td><%=number %></td>
			<td><%=oname %></td>
			<td><%=oage %></td>
			<td><%=oborn %></td>
			<td><%=oattack %></td>
			</tr>
		</tbody>
<%
	}
	}catch(Exception e) {
		e.printStackTrace();
	}
%>

<button type="submit">Sumbit</button>	
<br>
<br>
</form>
<form method="post" action="logout.jsp">
	<button type="submit">logout</button>
</form>
</body>
</html>