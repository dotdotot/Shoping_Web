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
  <!--�����ͺ��̽� ȣ�� -->
<%@ include file="../config/DB.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
	   
	   
	 <!-- product_detail ���� -->
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
	



	id = request.getParameter("id"); //�������̵�
	pass = request.getParameter("pass"); //�����н�
	
   while(rs.next()){
	   int real_id = rs.getInt("id");
	   
	   
	if(id.equals(rs.getString("uid")) && pass.equals(rs.getString("pwd"))){
		session.setAttribute("id",id); //�������̵� ����
		session.setAttribute("pass",pass);//�����н��� ����
		session.setAttribute("r_id",real_id); //����pk ���̵� ����
		response.sendRedirect("./pages/login_main.jsp");
		
	}else if(id.equals(rs.getString("uid"))){
		//out.print("[���Ʋ��: "+pass+ " : "  + rs.getString("passwd")+"]");
		out.println("<script>alert('��й�ȣ�� Ʋ�Ƚ��ϴ�.'); history.back();</script>");
		
	}else if(pass.equals(rs.getString("pwd"))){
		//out.println("[���̵�Ʋ��: "+id + " : "  + rs.getString("uid")+"]");
		out.println("<script>alert('���̵� Ʋ�Ƚ��ϴ�.'); history.back();</script>");
		
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