<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Regist_skill</title>
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
 <form method="post" action="regist_skill_check.jsp">
	<input type="text" name="skillname" id="skillname" placeholder= "스킬이름(10자)">
   	<input type = "text" name = "hpup" id = "hpup" placeholder = "체력증가(Numeric(12,2)))">
   	<input type = "text" name = "mpup" id = "mpup" placeholder = "마력증가(Numeric(12,2))">

   <br>

   	<button type="submit" class="login-button">Submit</button>

</form>

<form method="post" action="logout.jsp">

	<button type="submit">logout</button>
</form>
</body>
</html>