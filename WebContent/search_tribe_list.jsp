<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Search_tribe.list</title>
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
	
	
	if(keyfield.equals("tribe"))
	{
		String tribe = request.getParameter("keyword");
		String sql = "SELECT * FROM 종족 WHERE 종족명 LIKE '%" + tribe + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(key.isEmpty())
	{			
		String sql = "SELECT * FROM 종족";
		rs=stmt.executeQuery(sql);
	}
	
 	
    while(rs.next()) {
        String otribe = rs.getString("종족명");
        String oattackud = rs.getString("공격력보정");
        String odefenseud = rs.getString("방어력보정");
        String ohpud = rs.getString("체력보정");
        String ompud = rs.getString("마력보정");
        String ostrud = rs.getString("힘보정");
        String ointelliud = rs.getString("지능보정");
        
%>
		<tr>
		<td><%=otribe %></td>
		<td><%=oattackud %></td>
		<td><%=odefenseud %></td>
		<td><%=ohpud %></td>
		<td><%=ompud %></td>
		<td><%=ostrud %></td>
		<td><%=ointelliud %></td>
		<td><a href="delete_tribe.jsp?tribe=<%=otribe %>">삭제</a></td>
		<td><a href="update_tribe.jsp?tribe=<%=otribe %>">수정</a></td>
	</tr>

<%
    }
    
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>