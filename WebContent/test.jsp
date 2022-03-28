<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">

<title>Login Test</title>
<b>Login Test</b>
</head>
<body>
<br>
<br>
 <form method="post" action="login_check.jsp">
    <input type="text" name="id" id="id" placeholder="ID">
    <input type="password" name="password" id="password" placeholder="password">
    
	<br>

    <button type="submit">Login</button>
  </form>
</body>
</html>