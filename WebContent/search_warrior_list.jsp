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
		<td>아이디</td>
		<td>비밀번호</td>
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
	
	
	if(keyfield.equals("id"))
	{
		String id = request.getParameter("keyword");
		String sql = "SELECT * FROM 용사 WHERE ID LIKE'%" + id + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(keyfield.equals("name"))
	{
		String name = request.getParameter("keyword");				
		String sql = "SELECT * FROM 용사 WHERE 이름 LIKE '%" + name + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(keyfield.equals("born"))
	{
		String born = request.getParameter("keyword");				
		String sql = "SELECT * FROM 용사 WHERE 출생지 LIKE '%" + born + "%'";
		rs=stmt.executeQuery(sql);
	}
	if(key.isEmpty())
	{			
		String sql = "SELECT * FROM 용사";
		rs=stmt.executeQuery(sql);
	}
	
 	
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
		<tr>
		<td><%=oid %></td>
		<td><%=opw %></td>
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
		<td><a href="delete_warrior.jsp?id=<%=oid %>">삭제</a></td>
		<td><a href="update_warrior.jsp?id=<%=oid %>">수정</a></td>
	</tr>

<%
    }
    
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>