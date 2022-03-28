<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Update devilking Check</title>
</head>
<body>

<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int n = 0;

	String devilking = request.getParameter("w_devilking");
	String age = request.getParameter("w_age");
	String attackud = request.getParameter("w_attackud");
	String defenseud = request.getParameter("w_defenseud");
	String moveud = request.getParameter("w_moveud");
	String moralud = request.getParameter("w_moralud");
	String naturalenemy = request.getParameter("w_naturalenemy");
	
	System.out.println(devilking);
	System.out.println(age);
	System.out.println(attackud);
	System.out.println(defenseud);
	System.out.println(moveud);
	System.out.println(moralud);
	System.out.println(naturalenemy);
	
	String sql = "UPDATE 마물장군 SET 나이=?, 군단공격력보정=?, 군단방어력보정=?, 군단이동력보정=?, 군단사기보정=?, 천적종족=? WHERE 이름=?";
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, age);
	pstmt.setString(2, attackud);
	pstmt.setString(3, defenseud);
	pstmt.setString(4, moveud);
	pstmt.setString(5, moralud);
	pstmt.setString(6, naturalenemy);
	pstmt.setString(7, devilking);

	
	n = pstmt.executeUpdate();
%>

<%	response.sendRedirect("update_complete.jsp");
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>