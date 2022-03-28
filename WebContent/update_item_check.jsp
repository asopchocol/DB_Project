<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Update item Check</title>
</head>
<body>

<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int n = 0;

	String itemname = request.getParameter("w_itemname");
	String category = request.getParameter("w_category");
	String attackup = request.getParameter("w_attackup");
	String defenseup = request.getParameter("w_defenseup");
	String strup = request.getParameter("w_strup");
	String intelliup = request.getParameter("w_intelliup");
	String warriorid = request.getParameter("w_warriorid");
	
	System.out.println(itemname);
	System.out.println(category);
	System.out.println(attackup);
	System.out.println(defenseup);
	System.out.println(strup);
	System.out.println(intelliup);
	System.out.println(warriorid);
	
	String sql = "UPDATE 아이템 SET 종류=?, 공격력증가=?, 방어력증가=?, 힘증가=?, 지능증가=?, ID=? WHERE 이름=?";
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, category);
	pstmt.setString(2, attackup);
	pstmt.setString(3, defenseup);
	pstmt.setString(4, strup);
	pstmt.setString(5, intelliup);
	pstmt.setString(6, warriorid);
	pstmt.setString(7, itemname);

	
	n = pstmt.executeUpdate();
%>

<%	response.sendRedirect("update_complete.jsp");
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>