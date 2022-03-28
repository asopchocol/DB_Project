<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>detail_warrior</title>
</head>
<body>
<table border="1" width="800">
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
	</tr>
	<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String oid = request.getParameter("oid");
	String sql="select * from 용사 where ID=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, oid);
	rs = pstmt.executeQuery();

	//기본status
	rs.next();
	String opassword = rs.getString("PASSWORD");
	String oname = rs.getString("이름");
	String oage = rs.getString("나이");
	String oborn = rs.getString("출생지");
	String oattack = rs.getString("공격력");
	String odefense = rs.getString("방어력");
	String ohp = rs.getString("체력");
	String omp = rs.getString("마력");		
	String ostr = rs.getString("힘");
	String ointelli = rs.getString("지능");
	String otribe = rs.getString("종족명");
	String oskillname = rs.getString("스킬이름");
        
%>
		<tr>
		<td><%=oid %></td>
		<td><%=opassword %></td>
		<td><%=oname %></td>
		<td><%=oage %></td>
		<td><%=oborn %></td>
		<td><%=oattack %></td>
		<td><%=odefense %></td>
		<td><%=ohp %></td>
		<td><%=omp %></td>
		<td><%=ostr %></td>
		<td><%=ointelli %></td>
		<td><%=otribe %></td>
		<td><%=oskillname %></td>
	</tr>

<%
    
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>