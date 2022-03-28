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
		<td>이름</td>
		<td>나이</td>
		<td>군단공격력보정</td>
		<td>군단방어력보정</td>
		<td>군단이동력보정</td>
		<td>군단사기보정</td>
		<td>천적종족</td>
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
		String sql = "SELECT * FROM 마물장군 WHERE 이름 LIKE '%" + name + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(keyfield.equals("tribe"))
	{
		String tribe = request.getParameter("keyword");				
		String sql = "SELECT * FROM 마물장군 WHERE 천적종족 LIKE '%" + tribe + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(key.isEmpty())
	{			
		String sql = "SELECT * FROM 마물장군";
		rs=stmt.executeQuery(sql);
	}
	
 	
    while(rs.next()) {
        String oname = rs.getString("이름");
        String oage = rs.getString("나이");
        String oattackud = rs.getString("군단공격력보정");
        String odefenseud = rs.getString("군단방어력보정");
        String omoveud = rs.getString("군단이동력보정");
        String omoralud = rs.getString("군단사기보정");
        String otribe = rs.getString("천적종족");
  
        
%>
		<tr>
		<td><%=oname %></td>
		<td><%=oage%></td>
		<td><%=oattackud %></td>
		<td><%=odefenseud %></td>
		<td><%=omoveud %></td>
		<td><%=omoralud %></td>
		<td><a href="list_tribe.jsp?otribe=<%=otribe%>"><%=otribe %></a></td>
	</tr>

<%
    }
    
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>