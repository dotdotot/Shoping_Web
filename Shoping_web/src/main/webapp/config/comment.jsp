 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<!--  주로 header부분에 추가해야할 내용들 -->
 <jsp:include page="../config/header.jsp"></jsp:include>
 
 <!-- 네비게이션 바와 상단 메인 라벨이 포함 되어 있다 -->
  <jsp:include page="../config/nav.jsp"></jsp:include>
  
  
<!-- 네비게이션 바 아래 배너를 보여주는 부분 -->
<jsp:include page="../config/banner.jsp"></jsp:include>
  
  <!--데이터베이스 호출 -->
<%@ include file="../config/DB.jsp" %>

     <!-- product_detail 쿼리 -->
			<%
			  
			  String id = request.getParameter("id");
			  PreparedStatement pstmt =null;
	          ResultSet rs = null;
	          String sql = "select * from products where id = '"+id+"' ";	 
	          pstmt = conn.prepareStatement(sql);
	          rs = pstmt.executeQuery();
	         
			%>
			
          <%while(rs.next()){
            //데이터베이스 변수 선언
            String name="" , amount="" ,review="";
            
        	  review = rs.getString("");
        	  int discount = rs.getInt("discount");
        	  int price = rs.getInt("price");
        	  amount = rs.getString("amount");
        	  int Shipping=1000;
        	  int result=(price*2)-discount+Shipping;
        	  session.setAttribute("u_id",1);
        	  %> 






<%} %>
</body>
</html>