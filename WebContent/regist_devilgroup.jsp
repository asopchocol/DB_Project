<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Regist_devilgroup</title>
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
 <form method="post" action="regist_devilgroup_check.jsp">
  
	<input type="text" name="devilgroup" id="devilgroup" placeholder= "마물군단이름">
    <input type = "text" name = "number" id = "number" placeholder = "병력수">
    <input type = "text" name = "totalattack" id = "totalattack" placeholder = "총공격력">
    <input type = "text" name = "totaldefense" id = "totaldefense" placeholder= "총방어력">   
    <input type = "text" name = "move" id = "move" placeholder= "이동력"> 
    <input type="text" name = "moral" id = "moral" placeholder = "사기">
    <br>
    <button type="submit">Submit</button>
</form>

<form method="post" action="logout.jsp">
	<button type="submit">logout</button>
</form>
</body>
</html>