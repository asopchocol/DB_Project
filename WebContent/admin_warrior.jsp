<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Admin_warrior</title>
</head>
<body >

<br>

 <form method="post" action="logout.jsp">
 
    <input type="text" name="login" id="login" placeholder= "Welcome <%=session.getAttribute("id")%> " disabled>
	
	<br>
    <button type="submit" class="logout-button">Logout</button>
    
    <br>
    <br>	
    <a href="search_warrior.jsp" target="_parent">용사 검색</a>
    <a href="regist_warrior.jsp" target="_parent">용사 등록</a>

</form>
</body>
</html>