<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Update_Warrior</title>
</head>
<body>

<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	
	String w_id = request.getParameter("id");
	
	System.out.println(w_id);
	
	String sql="select * from 용사 where id=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, w_id);
	rs = pstmt.executeQuery();
	
	rs.next();
	String w_password = rs.getString("PASSWORD");
	String w_name = rs.getString("이름");
	String w_age = rs.getString("나이");
	String w_born = rs.getString("출생지");
	String w_attack = rs.getString("공격력");
	String w_defense = rs.getString("방어력");
	String w_hp = rs.getString("체력");
	String w_mp = rs.getString("마력");
	String w_str = rs.getString("힘");
	String w_intelli = rs.getString("지능");
	String w_tribe = rs.getString("종족명");
	String w_skillname = rs.getString("스킬이름");
	
	
%>
<form name='frm1' method='post' action='update_warrior_check.jsp'>
<table>
	<tr>
		<td>용사 아이디</td>
		<td><%=w_id %><input type="hidden" name="w_id" value="<%=w_id%>"/></td>
	</tr>
	
	<tr>
		<td>비밀번호</td>
		<td><input type="text" name="w_password" value="<%=w_password%>"/></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="w_name" value="<%=w_name%>"/></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><input type="text" name="w_age" value="<%=w_age%>"/></td>
	</tr>
	<tr>
		<td>출생지</td>
		<td><input type="text" name="w_born" value="<%=w_born%>"/></td>
	</tr>
	<tr>
		<td>공격력</td>
		<td><input type="text" name="w_attack" value="<%=w_attack%>"/></td>
	</tr>
	<tr>
		<td>방어력</td>
		<td><input type="text" name="w_defense" value="<%=w_defense%>"/></td>
	</tr>
	<tr>
		<td>체력</td>
		<td><input type="text" name="w_hp" value="<%=w_hp%>"/></td>
	</tr>
	<tr>
		<td>마력</td>
		<td><input type="text" name="w_mp" value="<%=w_mp%>"/></td>
	</tr>
	<tr>
		<td>힘</td>
		<td><input type="text" name="w_str" value="<%=w_str%>"/></td>
	</tr>
	<tr>
		<td>지능</td>
		<td><input type="text" name="w_intelli" value="<%=w_intelli%>"/></td>
	</tr>
	<tr>
		<td>종족명</td>
		<td><input type="text" name="w_tribe" value="<%=w_tribe%>"/></td>
	</tr>
	<tr>
		<td>스킬이름</td>
		<td><input type="text" name="w_skillname" value="<%=w_skillname%>"/></td>
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