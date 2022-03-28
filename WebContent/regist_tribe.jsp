<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Regist_tribe</title>
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
 <form method="post" action="regist_tribe_check.jsp">
	<input type="text" name="tribe" id="tribe" placeholder= "종족명(5자)">
   	<input type = "text" name = "attackud" id = "attackud" placeholder = "공격력보정">
   	<input type = "text" name = "defenseud" id = "defenseud" placeholder = "방어력보정">
   	<input type = "text" name = "hpud" id = "hpud" placeholder= "체력보정">
   	<input type = "text" name = "mpud" id = "mpud" placeholder= "마력보정">
   	<input type="text" name = "strud" id = "strud" placeholder = "힘보정">
   	<input type="text" name = "intelliud" id = "intelliud" placeholder = "지능보정">
    
    <br>

    <button type="submit">Submit</button>

</form>

<form method="post" action="logout.jsp">
	<button type="submit">logout</button>

</form>
</body>
</html>