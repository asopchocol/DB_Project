<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Update devilgroup Check</title>
</head>
<body>

<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int n = 0;

	String devilgroup = request.getParameter("w_devilgroup");
	String number = request.getParameter("w_number");
	String totalattack = request.getParameter("w_totalattack");
	String totaldefense = request.getParameter("w_totaldefense");
	String move = request.getParameter("w_move");
	String moral = request.getParameter("w_moral");
	
	System.out.println(devilgroup);
	System.out.println(number);
	System.out.println(totalattack);
	System.out.println(totaldefense);
	System.out.println(move);
	System.out.println(moral);
	
	String sql = "UPDATE 마물군단 SET 병력수=?, 총공격력=?, 총방어력=?, 이동력=?, 사기=? WHERE 이름=?";
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, number);
	pstmt.setString(2, totalattack);
	pstmt.setString(3, totaldefense);
	pstmt.setString(4, move);
	pstmt.setString(5, moral);
	pstmt.setString(6, devilgroup);

	
	n = pstmt.executeUpdate();
%>

<%	response.sendRedirect("update_complete.jsp");
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>