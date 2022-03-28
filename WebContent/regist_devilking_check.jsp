<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Regist_devilking_check</title>
</head>
<body>
<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<%
	try
	{
		Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
		Statement stmt = con.createStatement();
		
		String devilking = request.getParameter("devilking");
		String age = request.getParameter("age");
		String attackud = request.getParameter("attackud");
		String defenseud = request.getParameter("defenseud");
		String moveud = request.getParameter("moveud");
		String moralud = request.getParameter("moralud");
		String naturalenemy = request.getParameter("naturalenemy");
		
		//stmt.executeUpdate(sql);
		String sql = "SELECT * FROM 마물장군 WHERE 이름='" + devilking + "'";
		
    	ResultSet rs = stmt.executeQuery(sql);
	    
    	String sql2 = "INSERT INTO 마물장군 VALUES("+ "'"+devilking+"'," +"'"+age+"'," + "'"+attackud+"',"+ "'"+defenseud+"',"+
    			    "'"+moveud+"',"+	"'"+moralud+"'," + "'" + naturalenemy + "'" +  ")";
    	 
    	Boolean isDuplicate = false;
    	
    	while(rs.next()) {
    		isDuplicate = true;
    	}
    	if(isDuplicate) {
    		session.setAttribute("alert", "2");
    		response.sendRedirect("regist_devilking.jsp");
    	}
    	else {
    		try {
    			stmt.executeUpdate(sql2);
    		}
    		catch (SQLException e) {
    			System.out.println("err:"+e.toString());
    			session.setAttribute("alert", "1");
    			response.sendRedirect("regist_devilking.jsp");
    		}
    	}
	   
	    response.sendRedirect("regist_complete.jsp");   
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>