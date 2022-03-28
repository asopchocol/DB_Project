<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Regist_tribe_check</title>
</head>
<body>
<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<%
	try
	{
		Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
		Statement stmt = con.createStatement();
		
		String tribe = request.getParameter("tribe");
		String attackud = request.getParameter("attackud");
		String defenseud = request.getParameter("defenseud");
		String hpud = request.getParameter("hpud");
		String mpud = request.getParameter("mpud");
		String strud = request.getParameter("strud");
		String intelliud = request.getParameter("intelliud");
		
		//stmt.executeUpdate(sql);
		String sql = "SELECT * FROM 종족 WHERE 종족명='" + tribe + "'";
		
    	ResultSet rs = stmt.executeQuery(sql);
	    
    	String sql2 = "INSERT INTO 종족 VALUES("+ "'"+tribe+"'," +"'"+attackud+"'," + "'"+defenseud+"',"+ "'"+hpud+"',"+
    			    "'"+mpud+"',"+	"'"+strud+"',"+"'"+intelliud+"'" + ")";
    	 
    	Boolean isDuplicate = false;
    	
    	while(rs.next()) {
    		isDuplicate = true;
    	}
    	if(isDuplicate) {
    		session.setAttribute("alert", "2");
    		response.sendRedirect("regist_tribe.jsp");
    	}
    	else {
    		try {
    			stmt.executeUpdate(sql2);
    		}
    		catch (SQLException e) {
    			System.out.println("err:"+e.toString());
    			session.setAttribute("alert", "1");
    			response.sendRedirect("regist_tribe.jsp");
    		}
    	}
	   
	    response.sendRedirect("regist_complete.jsp");   
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>