<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Update tribe Check</title>
</head>
<body>

<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int n = 0;

	String tribe = request.getParameter("w_tribe");
	String attackud = request.getParameter("w_attackud");
	String defenseud = request.getParameter("w_defenseud");
	String hpud = request.getParameter("w_hpud");
	String mpud = request.getParameter("w_mpud");
	String strud = request.getParameter("w_strud");
	String intelliud = request.getParameter("w_intelliud");

	System.out.println(tribe);
	System.out.println(attackud);
	System.out.println(defenseud);
	System.out.println(hpud);
	System.out.println(mpud);
	System.out.println(strud);
	System.out.println(intelliud);
	
	
	String sql = "UPDATE 종족 SET 공격력보정=?, 방어력보정=?, 체력보정=?, 마력보정=?, 힘보정=?, 지능보정=? WHERE 종족명=?";
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, attackud);
	pstmt.setString(2, defenseud);
	pstmt.setString(3, hpud);
	pstmt.setString(4, mpud);
	pstmt.setString(5, strud);
	pstmt.setString(6, intelliud);
	pstmt.setString(7, tribe);
	
	n = pstmt.executeUpdate();
%>

<%	response.sendRedirect("update_complete.jsp");
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>