<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Regist_skill_check</title>
</head>
<body>
<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<%
	try
	{
		Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
		Statement stmt = con.createStatement();
		
		String user_skillname = request.getParameter("skillname");
		String user_hpup = request.getParameter("hpup");
		String user_mpup = request.getParameter("mpup");
		//stmt.executeUpdate(sql);
		String sql = "SELECT * FROM 스킬 WHERE 스킬이름='" + user_skillname + "'";
		
    	ResultSet rs = stmt.executeQuery(sql);
	    
    	String sql2 = "INSERT INTO 스킬 VALUES("+ "'"+user_skillname+"'," +"'"+user_hpup+"'," + "'"+user_mpup+"'"+ ")";
    	 
    	Boolean isDuplicate = false;
    	
    	while(rs.next()) {
    		isDuplicate = true;
    	}
    	if(isDuplicate) {
    		session.setAttribute("alert", "2");
    		response.sendRedirect("regist_skill.jsp");
    	}
    	else {
    		try {
    			stmt.executeUpdate(sql2);
    		}
    		catch (SQLException e) {
    			System.out.println("err:"+e.toString());
    			session.setAttribute("alert", "1");
    			response.sendRedirect("regist_skill.jsp");
    		}
    	}
	   
	    response.sendRedirect("regist_complete.jsp");   
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>