<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Admin_devilking</title>
</head>
<body >

<br>

 <form method="post" action="logout.jsp">
      <label for="login">&nbsp;</label>
      <input type="text" name="login" id="login" placeholder= "Welcome <%=session.getAttribute("id")%> " disabled>
	
      <button type="submit" class="logout-button">Logout</button>
    
    <br>
    	
      <a href="search_devilking.jsp" target="_parent">마물장군 검색</a>
      <a href="regist_devilking.jsp" target="_parent">마물장군 등록</a>
</form>
</body>
</html>