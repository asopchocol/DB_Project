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
		<td>이름</td>
		<td>병력수</td>
		<td>총공격력</td>
		<td>총방어력</td>
		<td>이동력</td>
		<td>사기</td>
		<td>보정스텟상세내용</td>
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
		String sql = "SELECT * FROM 마물군단 WHERE 이름 LIKE '%" + name + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(key.isEmpty())
	{			
		String sql = "SELECT * FROM 마물군단";
		rs=stmt.executeQuery(sql);
	}
	
 	
    while(rs.next()) {
        String oname = rs.getString("이름");
        String onumber = rs.getString("병력수");
        String ototalatt = rs.getString("총공격력");
        String ototaldef = rs.getString("총방어력");
        String omove = rs.getString("이동력");
        String omoral = rs.getString("사기");
  
        
%>
		<tr>
		<td><%=oname %></td>
		<td><%=onumber%></td>
		<td><%=ototalatt %></td>
		<td><%=ototaldef %></td>
		<td><%=omove %></td>
		<td><%=omoral %></td>
		<td><a href="list_devilstatus.jsp?oname=<%=oname %>">보정스텟상세정보</a></td>
	</tr>

<%
    }
    
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>