<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Update_tribe</title>
</head>
<body>

<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	
	String w_tribe = request.getParameter("tribe");
	
	System.out.println(w_tribe);
	
	String sql="select * from 종족 where 종족명=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, w_tribe);
	rs = pstmt.executeQuery();
	
	rs.next();
	String w_attackud = rs.getString("공격력보정");
	String w_defenseud = rs.getString("방어력보정");
	String w_hpud = rs.getString("체력보정");
	String w_mpud = rs.getString("마력보정");
	String w_strud = rs.getString("힘보정");
	String w_intelliud = rs.getString("지능보정");
	
	
%>
<form name='frm1' method='post' action='update_tribe_check.jsp'>
<table>
	<tr>
		<td>종족명</td>
		<td><%=w_tribe %><input type="hidden" name="w_tribe" value="<%=w_tribe%>"/></td>
	</tr>
	
	<tr>
		<td>공격력보정</td>
		<td><input type="text" name="w_attackud" value="<%=w_attackud%>"/></td>
	</tr>
	<tr>
		<td>방어력보정</td>
		<td><input type="text" name="w_defenseud" value="<%=w_defenseud%>"/></td>
	</tr>
	<tr>
		<td>체력보정</td>
		<td><input type="text" name="w_hpud" value="<%=w_hpud%>"/></td>
	</tr>
	<tr>
		<td>마력보정</td>
		<td><input type="text" name="w_mpud" value="<%=w_mpud%>"/></td>
	</tr>
	<tr>
		<td>힘보정</td>
		<td><input type="text" name="w_strud" value="<%=w_strud%>"/></td>
	</tr>
	<tr>
		<td>지능보정</td>
		<td><input type="text" name="w_intelliud" value="<%=w_intelliud%>"/></td>
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