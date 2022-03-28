<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Search_devilking.list</title>
</head>
<body>
<table border="1" width="600">
	<tr>
		<td>마물장군이름</td>
		<td>나이</td>
		<td>군단공격력보정</td>
		<td>군단방어력보정</td>
		<td>군단이동력보정</td>
		<td>군단사기보정</td>
		<td>천적종족</td>
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
	
	
	if(keyfield.equals("devilking"))
	{
		String devilking = request.getParameter("keyword");
		String sql = "SELECT * FROM 마물장군 WHERE 이름 LIKE '%" + devilking + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(keyfield.equals("age"))
	{
		String age = request.getParameter("keyword");				
		String sql = "SELECT * FROM 마물장군 WHERE 나이 LIKE '%" + age + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(keyfield.equals("nautralenemy"))
	{
		String nautralenemy = request.getParameter("keyword");				
		String sql = "SELECT * FROM 마물장군 WHERE 천적종족 LIKE '%" + nautralenemy + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(key.isEmpty())
	{			
		String sql = "SELECT * FROM 마물장군";
		rs=stmt.executeQuery(sql);
	}
	
 	
    while(rs.next()) {
        String devilking = rs.getString("이름");
        String age = rs.getString("나이");
        String attackud = rs.getString("군단공격력보정");
        String defenseud = rs.getString("군단방어력보정");
        String moveud = rs.getString("군단이동력보정");
        String moralud = rs.getString("군단사기보정");
        String naturalenemy = rs.getString("천적종족");
     
%>
		<tr>
		<td><%=devilking%></td>
		<td><%=age%></td>
		<td><%=attackud%></td>
		<td><%=defenseud%></td>
		<td><%=moveud%></td>
		<td><%=moralud%></td>
		<td><%=naturalenemy%></td>
		<td><a href="delete_devilking.jsp?devilking=<%=devilking%>">삭제</a></td>
		<td><a href="update_devilking.jsp?devilking=<%=devilking%>">수정</a></td>
	</tr>

<%
    }
    
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>