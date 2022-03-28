<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">

<title>Search_devilgroup</title>
<b>
</head>
<body>

<br>
	
 <form method="post" action="search_devilgroup_list.jsp">
  
	<select name="keyfield">
		<option value="devilgroup">마물군단</option>
		<option value="number">병력수</option>
		<option value="totalattack">총공격력</option>
		<option value="totaldefense">총방어력</option>
		<option value="move">이동력</option>
		<option value="moral">사기</option>
	</select>
    
    <input type="text" name="keyword" id="keyword">

    <button type="submit">Search</button>
      
 </form>
  
<form method="post" action="logout.jsp">
	<button type="submit" class="logout-button">logout</button>
</form>
  
</body>
</html>