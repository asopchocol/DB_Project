<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Update_devilking</title>
</head>
<body>

<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	
	String w_devilking = request.getParameter("devilking");
	
	System.out.println(w_devilking);
	
	String sql="select * from 마물장군 where 이름=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, w_devilking);
	rs = pstmt.executeQuery();
	
	rs.next();
	String w_age = rs.getString("나이");
	String w_attackud = rs.getString("군단공격력보정");
	String w_defenseud = rs.getString("군단방어력보정");
	String w_moveud = rs.getString("군단이동력보정");
	String w_moralud = rs.getString("군단사기보정");
	String w_naturalenemy = rs.getString("천적종족");
	
%>
<form name='frm1' method='post' action='update_devilking_check.jsp'>
<table>
	<tr>
		<td>마물장군이름</td>
		<td><%=w_devilking %><input type="hidden" name="w_devilking" value="<%=w_devilking%>"/></td>
	</tr>
	
	<tr>
		<td>나이</td>
		<td><input type="text" name="w_age" value="<%=w_age%>"/></td>
	</tr>
	<tr>
		<td>군단공격력보정</td>
		<td><input type="text" name="w_attackud" value="<%=w_attackud%>"/></td>
	</tr>
	<tr>
		<td>군단방어력보정</td>
		<td><input type="text" name="w_defenseud" value="<%=w_defenseud%>"/></td>
	</tr>
	<tr>
		<td>군단이동력보정</td>
		<td><input type="text" name="w_moveud" value="<%=w_moveud%>"/></td>
	</tr>
	<tr>
		<td>군단사기보정</td>
		<td><input type="text" name="w_moralud" value="<%=w_moralud%>"/></td>
	</tr>
	<tr>
		<td>천적종족</td>
		<td><input type="text" name="w_naturalenemy" value="<%=w_naturalenemy%>"/></td>
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