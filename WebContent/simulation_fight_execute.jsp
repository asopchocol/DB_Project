<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>simulation_fight_execute</title>
</head>
<body>
	<% String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; %>
<% try{
	Connection con = DriverManager.getConnection(DB_URL, "system", "Koko0109");
	Statement stmt = con.createStatement();

	ResultSet rs = null;
	
	int w_totalattack=0;
	int w_totaldefense=0;
	int d_totalattack=0;
	int d_totaldefense=0;
	
	String[] warriorselect = request.getParameterValues("warriorselect"); 
	   if (warriorselect != null) { 
	      for (int i = 0; i < warriorselect.length; i++) { 
	    	  String sql="select 공격력, 방어력 from 용사 where ID=" +warriorselect[i] +"";
	    	  rs=stmt.executeQuery(sql);
	    	  rs.next();
	    	  String wattack = rs.getString("공격력");
	    	  String wdefense = rs.getString("방어력");
	    	  int temp = Integer.parseInt(wattack);
	    	  int temp2 = Integer.parseInt(wdefense);
	    	  w_totalattack += temp;
	    	  w_totaldefense += temp2;
	    	 } // for 
	   }
	   System.out.println(w_totalattack);
	   System.out.println(w_totaldefense);
	
	String[] devilselect = request.getParameterValues("devilselect"); 
	  if (devilselect != null) { 
	      for (int i = 0; i < devilselect.length; i++) { 
	    	  String sql="select 총공격력, 총방어력 from 마물군단 where 이름='" +devilselect[i] +"'";
	    	  rs=stmt.executeQuery(sql);
	    	  rs.next();
	    	  String dattack = rs.getString("총공격력");
	    	  String ddefense = rs.getString("총방어력");
	    	  d_totalattack = Integer.parseInt(dattack);
	    	  d_totaldefense = Integer.parseInt(ddefense);	  
	    	 } // for 
	   }
	 System.out.println(d_totalattack);
	 System.out.println(d_totaldefense);
	    			 
	 if(w_totalattack > d_totaldefense && (d_totalattack <= w_totaldefense)) { 
	 //System.out.println("용사 승!");
	 // System.out.println("유저의 총 공격력은 "+ w_totalattack + "이고 마물군단" + devilselect[0] + "의 총방어력은" + d_totaldefense +"입니다.");%>
	 <h1>
		 용사 승 ! <br>
		 유저의 총 공격력은 <%=w_totalattack %>이고 마물군단의 총 방어력은 <%=d_totaldefense %> 입니다. <br>
		 <%
		 for (int i = 0; i < warriorselect.length; i++) { 
	    	  String sql="select 공격력, 방어력 from 용사 where ID=" +warriorselect[i] +"";
	    	  rs=stmt.executeQuery(sql);
	    	  rs.next();
	    	  String wattack = rs.getString("공격력");
	    	  String wdefense = rs.getString("방어력");%>
	     <%=warriorselect[i] %> 유저의 공격력  <%=wattack %> <br>
	    	  <%
	    	}
		 %>
		 <%=devilselect[0] %> 마물군단의 방어력 <%=d_totaldefense %> <br>
	 </h1>
	 <% }
	 else if((d_totalattack > w_totaldefense) && (w_totalattack <= d_totaldefense)) { 
	 //System.out.println("마물군단 승!");
	 //System.out.println("마물군단의 총 공격력은 "+ d_totalattack + "이고 유저의 총방어력은" + w_totaldefense +"입니다.");%>
	 <h1>
		 마물군단 승 ! <br>
		 마물군단의 총 공격력은 <%=d_totalattack%>이고 유저의 총방어력은 <%=w_totaldefense%> 입니다. <br>
		 <%
		 for (int i = 0; i < warriorselect.length; i++) { 
	    	  String sql="select 공격력, 방어력 from 용사 where ID=" +warriorselect[i] +"";
	    	  rs=stmt.executeQuery(sql);
	    	  rs.next();
	    	  String wattack = rs.getString("공격력");
	    	  String wdefense = rs.getString("방어력");%>
	     <%=warriorselect[i] %> 유저의 방어력  <%=wdefense %> <br>
	    	  <%
	    	}
		 %>
		 <%=devilselect[0] %> 마물군단의 공격력 <%=d_totalattack %> <br>
	 </h1>
	<% }
	 else if((w_totalattack <= d_totaldefense) && (d_totalattack <= w_totaldefense)) { 
	 //System.out.println("무승부 !"); %>
	 <h1>
		 무승부 ! <br>
		 마물군단 총 공격력 : <%=d_totalattack %> 마물군단 총 방어력 : <%=d_totaldefense %> <br>
		 유저의 총 공격력 : <%=w_totalattack %> 유저의 총 방어력 : <%=w_totaldefense %> <br>
		 <%
		 for (int i = 0; i < warriorselect.length; i++) { 
	    	  String sql="select 공격력, 방어력 from 용사 where ID=" +warriorselect[i] +"";
	    	  rs=stmt.executeQuery(sql);
	    	  rs.next();
	    	  String wattack = rs.getString("공격력");
	    	  String wdefense = rs.getString("방어력");%>
	     <%=warriorselect[i] %> 유저의 공격력 <%=wattack %>
	     <%=warriorselect[i] %> 유저의 방어력  <%=wdefense %> <br>
	    	  <%
	    	}
		 %>
		 <%=devilselect[0] %> 마물군단의 공격력 <%=d_totalattack %> <br>
		 <%=devilselect[0] %> 마물군단의 방어력 <%=d_totaldefense %> <br>
	</h1>
	<% }
	 else if((w_totalattack > d_totaldefense) && (d_totalattack > w_totaldefense)) { 
	  // System.out.println("전멸 !");%>
	  <h1>
		 전멸 ! <br>
		 마물군단 총 공격력 : <%=d_totalattack %> 마물군단 총 방어력 : <%=d_totaldefense %> <br>
		 유저의 총 공격력 : <%=w_totalattack %> 유저의 총 방어력 : <%=w_totaldefense %> <br>
		 <%
		 for (int i = 0; i < warriorselect.length; i++) { 
	    	  String sql="select 공격력, 방어력 from 용사 where ID=" +warriorselect[i] +"";
	    	  rs=stmt.executeQuery(sql);
	    	  rs.next();
	    	  String wattack = rs.getString("공격력");
	    	  String wdefense = rs.getString("방어력");%>
	     <%=warriorselect[i] %> 유저의 공격력 <%=wattack %> 
	     <%=warriorselect[i] %> 유저의 방어력  <%=wdefense %> <br>
	    	  <%
	    	}
		 %>
		 <%=devilselect[0] %> 마물군단의 공격력 <%=d_totalattack %> 
		 <%=devilselect[0] %> 마물군단의 방어력 <%=d_totaldefense %> <br>
	  </h1>
	<% }
	

   %>

<%
    }
    
    
catch(Exception e) {
			e.printStackTrace();
	}%>
	
<br>
<br>
<form method="post" action="logout.jsp">
	<button type="submit">logout</button>
</form>
</body>
</html>