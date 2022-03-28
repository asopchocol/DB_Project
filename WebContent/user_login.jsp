<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>User_Login</title>
</head>
<body >

<br>

 <form method="post" action="logout.jsp">
    <input type="text" name="login" id="login" placeholder= "Welcome <%=session.getAttribute("id")%> " disabled>
	
	<br>
	
    <button type="submit" class="logout-button">Login</button>
      
	<br>
	<br>
	
    <a href="user_search_warrior.jsp" target="_parent">용사 검색</a>
    <a href="user_search_skill.jsp" target="_parent">스킬 검색</a>
      
	<br>
	<br>
	
    <a href="user_search_tribe.jsp" target="_parent">종족 검색</a>
    <a href="user_search_item.jsp" target="_parent">아이템 검색</a>
      
	<br>
	<br>
	
    <a href="user_search_devilgroup.jsp" target="_parent">마물군단 검색</a>
    <a href="user_search_devilking.jsp" target="_parent">마물장군 검색</a>
    </p>
</form>

</body>
</html>