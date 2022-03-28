<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>list_statusr</title>
</head>
<body>
<table border="1" width="900">
	<tr>
		<td>ID</td>
		<td>PASSWORD</td>
		<td>이름</td>
		<td>나이</td>
		<td>출생지</td>
		<td>보정공격력</td>
		<td>보정방어력</td>
		<td>보정체력</td>
		<td>보정마력</td>
		<td>보정힘</td>
		<td>보정지능</td>
		<td>종족명</td>
		<td>스킬이름</td>		
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
	
	String oid = request.getParameter("oid");
	String sql="select * from 용사 where ID=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, oid);
	rs = pstmt.executeQuery();

	//기본status
	rs.next();
	String opassword = rs.getString("PASSWORD");
	String oname = rs.getString("이름");
	String oage = rs.getString("나이");
	String oborn = rs.getString("출생지");
	String oattack = rs.getString("공격력");
	String odefense = rs.getString("방어력");
	String ohp = rs.getString("체력");
	String omp = rs.getString("마력");		
	String ostr = rs.getString("힘");
	String ointelli = rs.getString("지능");
	String otribe = rs.getString("종족명");
	String oskillname = rs.getString("스킬이름");
	n_attack = Float.parseFloat(oattack);
	n_defense = Float.parseFloat(odefense);
	n_hp = Float.parseFloat(ohp);
	n_mp = Float.parseFloat(omp);
	n_str = Float.parseFloat(ostr);
	n_intelli = Float.parseFloat(ointelli);
	
	System.out.println(oid);
	
	sql="select 공증, 방증, 힘증, 지증"
			+ " from (select 아이템.공격력증가 as 공증, 아이템.방어력증가 as 방증, 아이템.힘증가 as 힘증,아이템.지능증가 as 지증, 용사.ID from 용사, 아이템 "
					+ "where 용사.ID=아이템.ID) where ID=" + oid;
	rs=stmt.executeQuery(sql);
	
	//아이템증가
	
	if(rs.next()) {
		String w_item_attack = rs.getString("공증");
		String w_item_defense = rs.getString("방증");
		String w_item_str = rs.getString("힘증");
		String w_item_intelli = rs.getString("지증");
		f_w_item_attack = Float.parseFloat(w_item_attack);
		f_w_item_defense = Float.parseFloat(w_item_defense);
		f_w_item_str = Float.parseFloat(w_item_str);
		f_w_item_intelli = Float.parseFloat(w_item_intelli);
	}
	else {
	 	f_w_item_attack = 1;
	 	f_w_item_defense = 1;
	 	f_w_item_str = 1;
	 	f_w_item_intelli = 1;
	}
	
	sql="select 공격력보정, 방어력보정, 체력보정, 마력보정, 힘보정, 지능보정 from (select 용사.ID, 종족.공격력보정, 종족.방어력보정, 종족.체력보정, 종족.마력보정, 종족.힘보정, 종족.지능보정 from 용사, 종족 where 용사.종족명=종족.종족명) where ID=" + oid;
	rs=stmt.executeQuery(sql);
	
	//종족증가
	rs.next();
	String attckud = rs.getString("공격력보정");
	String defenseud = rs.getString("방어력보정");
	String hpud = rs.getString("체력보정");
	String mpud = rs.getString("마력보정");
	String strud = rs.getString("힘보정");
	String intelliud = rs.getString("지능보정");
	t_attack_ud = Float.parseFloat(attckud);
	t_defense_ud = Float.parseFloat(defenseud);
	t_hp_ud = Float.parseFloat(hpud);
	t_mp_ud = Float.parseFloat(mpud);
	t_str_ud = Float.parseFloat(strud);
	t_intelli_ud = Float.parseFloat(intelliud);
	
	sql = "select 체력증가, 마력증가 from (select * from 용사, 스킬 where 용사.스킬이름=스킬.스킬이름) where ID=" + oid;
	rs=stmt.executeQuery(sql);
	
	//스킬증가
	if(	rs.next()) {
	String hpup = rs.getString("체력증가");
	String mpup = rs.getString("마력증가");
	whpud = Float.parseFloat(hpup);
	wmpud = Float.parseFloat(mpup);
	}
	else {
		whpud = 1;
		wmpud = 1;
	}
	float bojungattack = n_attack * f_w_item_attack * t_attack_ud;
	float bojungdefense = n_defense * f_w_item_defense * t_defense_ud;
	float bojunghp = n_hp * whpud * t_hp_ud;
	float bojungmp = n_mp * wmpud * t_mp_ud;
	float bojungstr = n_str * f_w_item_str * t_str_ud;
	float bojungintelli = n_intelli * f_w_item_intelli * t_intelli_ud;
	
	
%>

	<tr>
		<td><%=oid %></td>
		<td><%=opassword %></td>
		<td><%=oname %></td>
		<td><%=oage %></td>
		<td><%=oborn %></td>
		<td><%=bojungattack %></td>
		<td><%=bojungdefense %></td>
		<td><%=bojunghp %></td>
		<td><%=bojungmp %></td>
		<td><%=bojungstr %></td>
		<td><%=bojungintelli %></td>
		<td><%=otribe %></td>
		<td><%=oskillname %></td>
	</tr>
	
	<tr>
		<tr>
		<td><%=oid %></td>
		<td><%=opassword %></td>
		<td><%=oname %></td>
		<td><%=oage %></td>
		<td><%=oborn %></td>
		<td><%=oattack %></td>
		<td><%=odefense %></td>
		<td><%=ohp %></td>
		<td><%=omp %></td>
		<td><%=ostr %></td>
		<td><%=ointelli %></td>
		<td><%=otribe %></td>
		<td><%=oskillname %></td>
	</tr>
	
	보정공격력 = <%=n_attack%>*<%=f_w_item_attack%>*<%=t_attack_ud %>(기본스텟공격력)*(아이템.공격력증가)*(종족.공격력증가) <br>
	보정방어력 = <%=n_defense%>*<%=f_w_item_defense%>*<%=t_defense_ud %>(기본스텟방어력)*(아이템.방어력증가)*(종족.방어력증가) <br>
	보정체력 = <%=n_hp%>*<%=whpud%>*<%=t_hp_ud %>(기본스텟체력)*(스킬.체력증가)*(종족.체력증가) <br>
	보정마력 = <%=n_mp%>*<%=wmpud%>*<%=t_mp_ud %>(기본스텟마력)*(스킬.마력증가)*(종족.마력증가) <br>
	보정지능 = <%=n_intelli%>*<%=f_w_item_attack%>*<%=t_attack_ud %>(기본스텟지능)*(아이템.지능증가)*(종족.지능증가) <br><br>

<%
    
	} catch(Exception e) {
			e.printStackTrace();
	}

%>
</body>
</html>