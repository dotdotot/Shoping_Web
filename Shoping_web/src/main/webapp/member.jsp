<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
  <!--데이터베이스 호출 -->
<%@ include file="../config/DB.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
	   
	   
	 <!-- product_detail 쿼리 -->
			<%
			  
			  
			  PreparedStatement pstmt =null;
	          ResultSet rs = null;
	         // String sql = "select * from products where id = '"+id+"' ";	 
	          String sql ="select * from users";
	          pstmt = conn.prepareStatement(sql);
	          rs = pstmt.executeQuery();
	         
			%>
			<% 
	   String id="" , pass="";
	



	id = request.getParameter("id"); //유저아이디
	pass = request.getParameter("pass"); //유저패스
	
   while(rs.next()){
	   int real_id = rs.getInt("id");
	   
	   
	if(id.equals(rs.getString("uid")) && pass.equals(rs.getString("pwd"))){
		session.setAttribute("id",id); //유저아이디가 저장
		session.setAttribute("pass",pass);//유저패스가 저장
		session.setAttribute("r_id",real_id); //유저pk 아이디가 저장
		response.sendRedirect("./pages/login_main.jsp");
		
	}else if(id.equals(rs.getString("uid"))){
		//out.print("[비번틀림: "+pass+ " : "  + rs.getString("passwd")+"]");
		out.println("<script>alert('비밀번호가 틀렸습니다.'); history.back();</script>");
		
	}else if(pass.equals(rs.getString("pwd"))){
		//out.println("[아이디틀림: "+id + " : "  + rs.getString("uid")+"]");
		out.println("<script>alert('아이디가 틀렸습니다.'); history.back();</script>");
		
	}
	}
		%>
		
		<%
		 rs.close();
		 conn.close();
		 pstmt.close();
		 %>
		 

</body>
</html>