<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Search_item.list</title>
</head>
<body>
<table border="1" width="600">
	<tr>
		<td>이름</td>
		<td>종류</td>
		<td>공격력증가</td>
		<td>방어력증가</td>
		<td>힘증가</td>
		<td>지능증가</td>
		<td>ID</td>
	</tr>
	<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	ResultSet rs = null;
	
	String keyfield = request.getParameter("keyfield");
	String key = request.getParameter("keyword");
	
	
	if(keyfield.equals("name"))
	{
		String name = request.getParameter("keyword");
		String sql = "SELECT * FROM 아이템 WHERE 이름 LIKE '%" + name + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(keyfield.equals("category"))
	{
		String category = request.getParameter("keyword");				
		String sql = "SELECT * FROM 아이템 WHERE 종류 LIKE '%" + category + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(keyfield.equals("ID"))
	{
		String ID = request.getParameter("keyword");				
		String sql = "SELECT * FROM 아이템 WHERE ID LIKE '%" + ID + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(key.isEmpty())
	{			
		String sql = "SELECT * FROM 아이템";
		rs=stmt.executeQuery(sql);
	}
	
 	
    while(rs.next()) {
        String oname = rs.getString("이름");
        String ocategory = rs.getString("종류");
        String oattackud = rs.getString("공격력증가");
        String odefenseud = rs.getString("방어력증가");
        String ostrud = rs.getString("힘증가");
        String ointelliud = rs.getString("지능증가");
        String oid = rs.getString("ID");
  
        
%>
		<tr>
		<td><%=oname %></td>
		<td><%=ocategory%></td>
		<td><%=oattackud %></td>
		<td><%=odefenseud %></td>
		<td><%=ostrud %></td>
		<td><%=ointelliud %></td>
		<td><a href="list_warrior.jsp?oid=<%=oid%>"><%=oid %></a></td>
	</tr>

<%
    }
    
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>