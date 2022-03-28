<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Search_warrior.list</title>
</head>
<body>
<table border="1" width="600">
	<tr>
		<td>아이템이름</td>
		<td>종류</td>
		<td>공격력증가</td>
		<td>방어력증가</td>
		<td>힘증가</td>
		<td>지능증가</td>
		<td>ID</td>
		<td>삭제</td>
		<td>수정</td>
	</tr>
	<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	ResultSet rs = null;
	
	String keyfield = request.getParameter("keyfield");
	String key = request.getParameter("keyword");
	
	
	if(keyfield.equals("itemname"))
	{
		String itemname = request.getParameter("keyword");
		String sql = "SELECT * FROM 아이템 WHERE 이름 LIKE '%" + itemname + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(keyfield.equals("category"))
	{
		String category = request.getParameter("keyword");				
		String sql = "SELECT * FROM 아이템 WHERE 종류 LIKE '%" + category + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(keyfield.equals("warriorid"))
	{
		String warriorid = request.getParameter("keyword");				
		String sql = "SELECT * FROM 아이템 WHERE ID LIKE '%" + warriorid + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(key.isEmpty())
	{			
		String sql = "SELECT * FROM 아이템";
		rs=stmt.executeQuery(sql);
	}
	
 	
    while(rs.next()) {
        String itemname = rs.getString("이름");
        String category = rs.getString("종류");
        String attackup = rs.getString("공격력증가");
        String defenseup = rs.getString("방어력증가");
        String strup = rs.getString("힘증가");
        String intelliup = rs.getString("지능증가");
        String warriorid = rs.getString("ID");
        
%>
		<tr>
		<td><%=itemname %></td>
		<td><%=category %></td>
		<td><%=attackup %></td>
		<td><%=defenseup %></td>
		<td><%=strup %></td>
		<td><%=intelliup %></td>
		<td><%=warriorid %></td>
		<td><a href="delete_item.jsp?itemname=<%=itemname %>">삭제</a></td>
		<td><a href="update_item.jsp?itemname=<%=itemname %>">수정</a></td>
	</tr>

<%
    }
    
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>