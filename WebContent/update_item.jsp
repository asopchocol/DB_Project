<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Update_item</title>
</head>
<body>

<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	
	String w_itemname = request.getParameter("itemname");
	
	System.out.println(w_itemname);
	
	String sql="select * from 아이템 where 이름=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, w_itemname);
	rs = pstmt.executeQuery();
	
	rs.next();
	String w_category = rs.getString("종류");
	String w_attackup = rs.getString("공격력증가");
	String w_defenseup = rs.getString("방어력증가");
	String w_strup = rs.getString("힘증가");
	String w_intelliup = rs.getString("지능증가");
	String w_warriorid = rs.getString("ID");
	
%>
<form name='frm1' method='post' action='update_item_check.jsp'>
<table>
	<tr>
		<td>아이템이름</td>
		<td><%=w_itemname %><input type="hidden" name="w_itemname" value="<%=w_itemname%>"/></td>
	</tr>
	
	<tr>
		<td>종류</td>
		<td><input type="text" name="w_category" value="<%=w_category%>"/></td>
	</tr>
	<tr>
		<td>공격력증가</td>
		<td><input type="text" name="w_attackup" value="<%=w_attackup%>"/></td>
	</tr>
	<tr>
		<td>방어력증가</td>
		<td><input type="text" name="w_defenseup" value="<%=w_defenseup%>"/></td>
	</tr>
	<tr>
		<td>힘증가</td>
		<td><input type="text" name="w_strup" value="<%=w_strup%>"/></td>
	</tr>
	<tr>
		<td>지능증가</td>
		<td><input type="text" name="w_intelliup" value="<%=w_intelliup%>"/></td>
	</tr>
	<tr>
		<td>용사ID</td>
		<td><input type="text" name="w_warriorid" value="<%=w_warriorid%>"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="button" name="btn" value="저장" onclick="javascript:frm1.submit();"/>
	</tr>
</table>
</form>
<%
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>