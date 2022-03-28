<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Search_skil.list</title>
</head>
<body>
<table border="1" width="600">
	<tr>
		<td>스킬이름</td>
		<td>체력증가</td>
		<td>마력증가</td>
		
	</tr>
	<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	ResultSet rs = null;
	
	String keyfield = request.getParameter("keyfield");
	String key = request.getParameter("keyword");
	
	
	if(keyfield.equals("skillname"))
	{
		String skillname = request.getParameter("keyword");
		String sql = "SELECT * FROM 스킬 WHERE 스킬이름 LIKE '%" + skillname + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(key.isEmpty())
	{			
		String sql = "SELECT * FROM 스킬";
		rs=stmt.executeQuery(sql);
	}
	
 	
    while(rs.next()) {
        String skillname = rs.getString("스킬이름");
        String hpup = rs.getString("체력증가");
        String mpup = rs.getString("마력증가");
        
%>
		<tr>
		<td><%=skillname %></td>
		<td><%=hpup %></td>
		<td><%=mpup %></td>
	</tr>

<%
    }
    
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>