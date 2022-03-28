<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Update Warrior Check</title>
</head>
<body>

<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int n = 0;

	String id = request.getParameter("w_id");
	String password = request.getParameter("w_password");
	String name = request.getParameter("w_name");
	String age = request.getParameter("w_age");
	String born = request.getParameter("w_born");
	String attack = request.getParameter("w_attack");
	String defense = request.getParameter("w_defense");
	String hp = request.getParameter("w_hp");
	String mp = request.getParameter("w_mp");
	String str = request.getParameter("w_str");
	String intelli = request.getParameter("w_intelli");
	String tribe = request.getParameter("w_tribe");
	String skillname = request.getParameter("w_skillname");
	
	System.out.println(id);
	System.out.println(password);
	System.out.println(name);
	System.out.println(age);
	System.out.println(born);
	System.out.println(attack);
	System.out.println(defense);
	System.out.println(hp);
	System.out.println(mp);
	System.out.println(str);
	System.out.println(intelli);
	System.out.println(tribe);
	System.out.println(skillname);
	
	
	String sql = "UPDATE 용사 SET password=?, 이름=?, 나이=?, 출생지=?, 공격력=?, 방어력=?, 체력=?, 마력=?, 힘=?, 지능=?, 종족명=?, 스킬이름=? WHERE id=?";
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, password);
	pstmt.setString(2, name);
	pstmt.setString(3, age);
	pstmt.setString(4, born);
	pstmt.setString(5, attack);
	pstmt.setString(6, defense);
	pstmt.setString(7, hp);
	pstmt.setString(8, mp);
	pstmt.setString(9, str);
	pstmt.setString(10, intelli);
	pstmt.setString(11, tribe);
	pstmt.setString(12, skillname);
	pstmt.setString(13, id);
	
	n = pstmt.executeUpdate();
%>

<%	response.sendRedirect("update_complete.jsp");
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>