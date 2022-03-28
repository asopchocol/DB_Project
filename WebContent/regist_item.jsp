<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Regist_item</title>
</head>
<body >

<%
	if(session.getAttribute("alert") == "1")
{%>
<script>
alert ('잘못된 입력');
</script>
<%}
	else if(session.getAttribute("alert") == "2")
{%>
<script>
	alert ('이 id는 이미 사용중입니다.');
</script>
<%}
	session.setAttribute("alert", "0");
%>

<br>
 <form method="post" action="regist_item_check.jsp">

	<input type="text" name="itemname" id="itemname" placeholder= "아이템이름">
 
   	<input type = "text" name = "category" id = "category" placeholder = "아이템종류">
 
   	<input type = "text" name = "attckup" id = "attckup" placeholder = "공격력증가">
 
   	<input type = "text" name = "defenseup" id = "defenseup" placeholder= "방어력증가">

   	<input type = "text" name = "strup" id = "strup" placeholder= "힘증가">

   	<input type="text" name = "intelliup" id = "intelliup" placeholder = "지능증가">
 
   	<input type="text" name = "warriorid" id = "warriorid" placeholder = "용사 ID">
    
    
    <br>

   	<button type="submit">Submit</button>
</form>

<form method="post" action="logout.jsp">
	
	<button type="submit">logout</button>
</form>
</body>
</html>