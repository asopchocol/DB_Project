<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Search_devilgroup.list</title>
</head>
<body>
<table border="1" width="600">
	<tr>
		<td>마물군단이름</td>
		<td>병력수</td>
		<td>총공격력</td>
		<td>총방어력</td>
		<td>이동력</td>
		<td>사기</td>
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
	
	
	if(keyfield.equals("devilgroup"))
	{
		String devilgroup = request.getParameter("keyword");
		String sql = "SELECT * FROM 마물군단 WHERE 이름 LIKE '%" + devilgroup + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(keyfield.equals("number"))
	{
		String number = request.getParameter("keyword");				
		String sql = "SELECT * FROM 마물군단 WHERE 병력수 LIKE '%" + number + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(keyfield.equals("totalattack"))
	{
		String totalattack = request.getParameter("keyword");				
		String sql = "SELECT * FROM 마물군단 WHERE 총공격력 LIKE '%" + totalattack + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(keyfield.equals("totaldefense"))
	{
		String totaldefense = request.getParameter("keyword");				
		String sql = "SELECT * FROM 마물군단 WHERE 총방어력 LIKE '%" + totaldefense + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(keyfield.equals("move"))
	{
		String move = request.getParameter("keyword");				
		String sql = "SELECT * FROM 마물군단 WHERE 이동력 LIKE '%" + move + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(keyfield.equals("moral"))
	{
		String moral = request.getParameter("keyword");				
		String sql = "SELECT * FROM 마물군단 WHERE 사기 LIKE '%" + moral + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(key.isEmpty())
	{			
		String sql = "SELECT * FROM 마물군단";
		rs=stmt.executeQuery(sql);
	}
	
 	
    while(rs.next()) {
        String devilgroup = rs.getString("이름");
        String number = rs.getString("병력수");
        String totalattack = rs.getString("총공격력");
        String totaldefense = rs.getString("총방어력");
        String move = rs.getString("이동력");
        String moral = rs.getString("사기");
     
%>
		<tr>
		<td><%=devilgroup%></td>
		<td><%=number%></td>
		<td><%=totalattack%></td>
		<td><%=totaldefense%></td>
		<td><%=move%></td>
		<td><%=moral%></td>
		<td><a href="delete_devilgroup.jsp?devilgroup=<%=devilgroup%>">삭제</a></td>
		<td><a href="update_devilgroup.jsp?devilgroup=<%=devilgroup%>">수정</a></td>
	</tr>

<%
    }
    
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>