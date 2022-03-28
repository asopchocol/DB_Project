<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Update_skillr</title>
</head>
<body>

<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	
	String w_skillname = request.getParameter("skillname");
	
	System.out.println(w_skillname);
	
	String sql="select * from 스킬 where 스킬이름=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, w_skillname);
	rs = pstmt.executeQuery();
	
	rs.next();
	String w_hpup = rs.getString("체력증가");
	String w_mpup = rs.getString("마력증가");
	
%>
<form name='frm1' method='post' action='update_skill_check.jsp'>
<table>
	<tr>
		<td>스킬이름</td>
		<td><%=w_skillname %><input type="hidden" name="w_skillname" value="<%=w_skillname%>"/></td>
	</tr>
	
	<tr>
		<td>체력증가</td>
		<td><input type="text" name="w_hpup" value="<%=w_hpup%>"/></td>
	</tr>
	<tr>
		<td>마력증가</td>
		<td><input type="text" name="w_mpup" value="<%=w_mpup%>"/></td>
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