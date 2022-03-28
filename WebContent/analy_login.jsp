<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>analy_Login</title>
</head>
<body >

<br>

 <form method="post" action="logout.jsp">

    <input type="text" name="login" id="login" placeholder= "Welcome <%=session.getAttribute("id")%> " disabled>
	<br>
    <button type="submit" class="logout-button">Logout</button>
    
    <br>
    <br>	
    <a href="warrior_data_select.jsp" target="_parent">용사 데이터 통계확인</a>
    <a href="devil_data_select.jsp" target="_parent">마물군단 데이터 통계확인</a>
    <a href="simulation_fight.jsp" target="_parent">시뮬레이션 전투</a>
</body>
</html>