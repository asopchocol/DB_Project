<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Delete item</title>
</head>
<body>

<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int n = 0;
	
	String w_itemname = request.getParameter("itemname");
	
	System.out.println(w_itemname);
	
	String sql = "delete from 아이템 where 이름=?";
	pstmt = con.prepareStatement(sql);
 	pstmt.setString(1,w_itemname);
    n = pstmt.executeUpdate();
%>

<%
    response.sendRedirect("delete_complete.jsp");
    
	} catch(Exception e) {
			e.printStackTrace();
	}%>
</body>
</html>