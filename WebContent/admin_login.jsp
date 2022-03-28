<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Admin_Login</title>
</head>
<body >


 <form method="post" action="logout.jsp">
  
      <label for="login">&nbsp;</label>
      <input type="text" name="login" id="login" placeholder= "Welcome <%=session.getAttribute("id")%> " disabled>

	<br>
 
      <button type="submit">Logout</button>
  
    <br>
    <br>

      <a href="admin_warrior.jsp" target="_parent">용사</a>
      <a href="admin_skill.jsp" target="_parent">스킬</a>

</form>

      <a href="admin_tribe.jsp" target="_parent">종족</a>
      <a href="admin_item.jsp" target="_parent">아이템</a>
      
	<br>
	<br>

      <a href="admin_devilgroup.jsp" target="_parent">마물군단</a>
      <a href="admin_devilking.jsp" target="_parent">마물장군</a>
</body>
</html>