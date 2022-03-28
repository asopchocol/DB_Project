<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Regist_Warrior</title>
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
 <form method="post" action="regist_warrior_check.jsp">
 
	<input type="text" name="id" id="id" placeholder= "용사 id(5자)">
   	<input type = "text" name = "password" id = "password" placeholder = "용사 pw(최대 10자)">
   	<input type = "text" name = "name" id = "name" placeholder = "이름">
   	<input type = "text" name = "age" id = "age" placeholder= "나이">
   	<input type = "text" name = "born" id = "born" placeholder= "출생">
   	<input type="text" name = "attack" id = "attack" placeholder = "공격력(XXX.0 : 실수입력)">
   	<input type="text" name = "defense" id = "defense" placeholder = "방어력(XXX.0 : 실수입력)">
   	<input type="text" name = "hp" id = "hp" placeholder = "체력(XX.0 : 실수입력)">
   	<input type="text" name = "mp" id = "mp" placeholder = "마력(XX.0 : 실수입력)">
   	<input type="text" name = "strong" id = "strong" placeholder = "힘(X.0 : 실수입력)">
    <input type="text" name = "intelligent" id = "intelligent" placeholder = "지능(X.0 : 실수입력)">  
    <input type="text" name = "tribe" id = "tribe" placeholder = "종족명">  
    <input type="text" name = "skillname" id = "skillname" placeholder = "스킬이름">
    
    <br>
    
    <button type="submit">Submit</button>
</form>

<form method="post" action="logout.jsp">
	<button type="submit">logout</button>
</form>
</body>
</html>