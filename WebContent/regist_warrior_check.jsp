<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Regist_Warrior_check</title>
</head>
<body>
<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<%
	try
	{
		Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
		Statement stmt = con.createStatement();
		
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("password");
		String user_name = request.getParameter("name");
		String user_age = request.getParameter("age");
		String user_born = request.getParameter("born");
		String user_attack = request.getParameter("attack");
		String user_defense = request.getParameter("defense");
		String user_hp = request.getParameter("hp");
		String user_mp = request.getParameter("mp");
		String user_strong = request.getParameter("strong");
		String user_intelligent = request.getParameter("intelligent");
		String user_tribe = request.getParameter("tribe");
		String user_skillname = request.getParameter("skillname");
		
		//stmt.executeUpdate(sql);
		String sql = "SELECT * FROM 용사 WHERE id='" + user_id + "'";
		
    	ResultSet rs = stmt.executeQuery(sql);
	    
    	String sql2 = "INSERT INTO 용사 VALUES("+ "'"+user_id+"'," +"'"+user_pw+"'," + "'"+user_name+"',"+ "'"+user_age+"',"+
    			    "'"+user_born+"',"+	"'"+user_attack+"',"+"'"+user_defense+"',"+"'"+ user_hp + "'," + "'"+ user_mp + "',"+ "'" + user_strong + "',"
    			    			 + "'" + user_intelligent + "',"
    			    			 + "'" + user_tribe + "',"
    			    			 + "'" + user_skillname + "'"+ ")";
    	 
    	Boolean isDuplicate = false;
    	
    	while(rs.next()) {
    		isDuplicate = true;
    	}
    	if(isDuplicate) {
    		session.setAttribute("alert", "2");
    		response.sendRedirect("regist_warrior.jsp");
    	}
    	else {
    		try {
    			stmt.executeUpdate(sql2);
    		}
    		catch (SQLException e) {
    			System.out.println("err:"+e.toString());
    			session.setAttribute("alert", "1");
    			response.sendRedirect("regist_warrior.jsp");
    		}
    	}
	   
	    response.sendRedirect("regist_complete.jsp");   
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>