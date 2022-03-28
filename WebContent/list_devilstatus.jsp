<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>list_devilstatus</title>
</head>
<body>
<table border="1" width="900">
	<tr>
		<td>이름</td>
		<td>병력수</td>
		<td>총공격력</td>
		<td>총방어력</td>
		<td>이동력</td>
		<td>사기</td>
	</tr>
<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	float f_w_item_attack, f_w_item_defense, f_w_item_str, f_w_item_intelli = 1;
	float t_attack_ud, t_defense_ud, t_hp_ud, t_mp_ud, t_str_ud, t_intelli_ud = 1;	//종족 증가치.
	float whpud, wmpud = 1;
	float n_attack, n_defense, n_hp, n_mp, n_str, n_intelli;
	
	String oname = request.getParameter("oname");
	System.out.println(oname);
	String sql="select 장군이름 from 지휘 where 군단이름='" + oname +"'";
	
	rs = stmt.executeQuery(sql);

	//기본status
	rs.next();
	String devilname = rs.getString("장군이름");
	
	System.out.println(devilname);
	
	sql = "select 군단공격력보정, 군단방어력보정, 군단이동력보정, 군단사기보정 from 마물장군 where 이름='" + devilname +"'";
	rs = stmt.executeQuery(sql);
	
	rs.next();
	String w_item_attack = rs.getString("군단공격력보정");
	String w_item_defense = rs.getString("군단방어력보정");
	String w_item_str = rs.getString("군단이동력보정");
	String w_item_intelli = rs.getString("군단사기보정");
	f_w_item_attack = Float.parseFloat(w_item_attack);
	f_w_item_defense = Float.parseFloat(w_item_defense);
	f_w_item_str = Float.parseFloat(w_item_str);
	f_w_item_intelli = Float.parseFloat(w_item_intelli);
	
	sql="select * from 마물군단 where 이름='" + oname + "'";
	rs=stmt.executeQuery(sql);
	
	//종족증가
	rs.next();
	String onumber = rs.getString("병력수");
	String attckud = rs.getString("총공격력");
	String defenseud = rs.getString("총방어력");
	String hpud = rs.getString("이동력");
	String mpud = rs.getString("사기");
	t_attack_ud = Float.parseFloat(attckud);
	t_defense_ud = Float.parseFloat(defenseud);
	t_hp_ud = Float.parseFloat(hpud);
	t_mp_ud = Float.parseFloat(mpud);
	
	float bojungattack = f_w_item_attack * t_attack_ud;
	float bojungdefense = f_w_item_defense * t_defense_ud;
	float bojungstr =  f_w_item_str * t_hp_ud;
	float bojungintelli = f_w_item_intelli * t_mp_ud;
	
	
%>

	<tr>
		<td><%=oname %></td>
		<td><%=onumber %></td>
		<td><%=bojungattack %></td>
		<td><%=bojungdefense %></td>
		<td><%=bojungstr %></td>
		<td><%=bojungintelli %></td>
	</tr>
	
	<tr>
		<tr>
		<td><%=oname %></td>
		<td><%=onumber %></td>
		<td><%=attckud %></td>
		<td><%=defenseud %></td>
		<td><%=hpud %></td>
		<td><%=mpud %></td>
	</tr>
	
	<%=devilname %>장군의 지휘! <br>
	보정공격력 = <%=t_attack_ud%>*<%=f_w_item_attack %>(총공격력)*(군단공격력보정) <br>
	보정방어력 = <%=t_defense_ud%>*<%=f_w_item_defense %>(총방어력)*(군단방어력보정) <br>
	보정이동력 = <%=t_hp_ud%>*<%=f_w_item_str%>(이동력)*(군단이동력보정) <br>
	보정사기 = <%=t_mp_ud%>*<%=f_w_item_intelli%>(사기)*(군단사기보정) <br><br>

<%
    
	} catch(Exception e) {
			e.printStackTrace();
	}

%>
</body>
</html>