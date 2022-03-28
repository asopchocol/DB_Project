<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Update_devilgroup</title>
</head>
<body>

<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	
	String w_devilgroup = request.getParameter("devilgroup");
	
	System.out.println(w_devilgroup);
	
	String sql="select * from 마물군단 where 이름=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, w_devilgroup);
	rs = pstmt.executeQuery();
	
	rs.next();
	String w_number = rs.getString("병력수");
	String w_totalattack = rs.getString("총공격력");
	String w_totaldefense = rs.getString("총방어력");
	String w_move = rs.getString("이동력");
	String w_moral = rs.getString("사기");
	
%>
<form name='frm1' method='post' action='update_devilgroup_check.jsp'>
<table>
	<tr>
		<td>마물군단이름</td>
		<td><%=w_devilgroup %><input type="hidden" name="w_devilgroup" value="<%=w_devilgroup%>"/></td>
	</tr>
	
	<tr>
		<td>병력수</td>
		<td><input type="text" name="w_number" value="<%=w_number%>"/></td>
	</tr>
	<tr>
		<td>총공격력</td>
		<td><input type="text" name="w_totalattack" value="<%=w_totalattack%>"/></td>
	</tr>
	<tr>
		<td>총방어력</td>
		<td><input type="text" name="w_totaldefense" value="<%=w_totaldefense%>"/></td>
	</tr>
	<tr>
		<td>이동력</td>
		<td><input type="text" name="w_move" value="<%=w_move%>"/></td>
	</tr>
	<tr>
		<td>사기</td>
		<td><input type="text" name="w_moral" value="<%=w_moral%>"/></td>
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