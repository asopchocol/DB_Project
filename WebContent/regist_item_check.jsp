<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Regist_item_check</title>
</head>
<body>
<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<%
	try
	{
		Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
		Statement stmt = con.createStatement();
		
		String itemname = request.getParameter("itemname");
		String category = request.getParameter("category");
		String attckup = request.getParameter("attckup");
		String defenseup = request.getParameter("defenseup");
		String strup = request.getParameter("strup");
		String intelliup = request.getParameter("intelliup");
		String warriorid = request.getParameter("warriorid");
		
		//stmt.executeUpdate(sql);
		String sql = "SELECT * FROM 아이템 WHERE 이름='" + itemname + "'";
		
    	ResultSet rs = stmt.executeQuery(sql);
	    
    	String sql2 = "INSERT INTO 아이템 VALUES("+ "'"+itemname+"'," +"'"+category+"'," + "'"+attckup+"',"+ "'"+defenseup+"',"+
    			    "'"+strup+"',"+	"'"+intelliup+"',"+"'"+warriorid+"'" + ")";
    	 
    	Boolean isDuplicate = false;
    	
    	while(rs.next()) {
    		isDuplicate = true;
    	}
    	if(isDuplicate) {
    		session.setAttribute("alert", "2");
    		response.sendRedirect("regist_item.jsp");
    	}
    	else {
    		try {
    			stmt.executeUpdate(sql2);
    		}
    		catch (SQLException e) {
    			System.out.println("err:"+e.toString());
    			session.setAttribute("alert", "1");
    			response.sendRedirect("regist_item.jsp");
    		}
    	}
	   
	    response.sendRedirect("regist_complete.jsp");   
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>