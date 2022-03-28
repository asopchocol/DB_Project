<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Update skill Check</title>
</head>
<body>

<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int n = 0;

	String skillname = request.getParameter("w_skillname");
	String hpup = request.getParameter("w_hpup");
	String mpup = request.getParameter("w_mpup");
	
	System.out.println(skillname);
	System.out.println(hpup);
	System.out.println(mpup);
	
	
	String sql = "UPDATE 스킬 SET 체력증가=?, 마력증가=? WHERE 스킬이름=?";
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, hpup);
	pstmt.setString(2, mpup);
	pstmt.setString(3, skillname);
	
	n = pstmt.executeUpdate();
%>

<%	response.sendRedirect("update_complete.jsp");
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>