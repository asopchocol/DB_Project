<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
%>
<%
try {
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	
	String user_id = request.getParameter("id");
	String user_pw = request.getParameter("password");
	
	String sql = "SELECT * FROM users WHERE id='" + user_id + "' AND password='" + user_pw + "'";
	stmt.executeUpdate(sql);
    ResultSet rs = stmt.executeQuery(sql);
    
    Boolean isConnect = false;
    
    String user_cat=null;
    
    while(rs.next()) {
    	isConnect = true;
    	try{
    		user_cat = rs.getString("category");
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    
    rs.close();
    stmt.close();
    
    System.out.println(user_cat);
		
	if(isConnect) {
		session.setAttribute("id", user_id);
		
		if(user_cat.equals("admin")) {
			response.sendRedirect("admin_login.jsp");
		}
		else if(user_cat.equals("user")) {
			response.sendRedirect("user_login.jsp");
		}
		else {
			response.sendRedirect("analy_login.jsp");
		}
	}
	else {
		response.sendRedirect("test.jsp");
	}
}
catch(Exception e) {
	e.printStackTrace();
}
%>
<%

%>
</body>
</html>