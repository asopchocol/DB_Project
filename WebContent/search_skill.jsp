<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">

<title>Search_skill</title>
<b>
</head>
<body>

<br>
	
 <form method="post" action="search_skill_list.jsp">
	<select name="keyfield">
		<option value="skillname">스킬이름</option>
	</select>

    <input type="text" name="keyword" id="keyword">

    <button type="submit">Search</button>
</form>

<form method="post" action="logout.jsp">
	<button type="submit">logout</button>
</form>  
</body>
</html>