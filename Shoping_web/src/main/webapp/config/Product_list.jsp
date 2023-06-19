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

<!-- 섹션 -->

<!-- 전체 제품 리스트 -->

     <!-- 쿼리 -->
     
			<%
			  PreparedStatement pstmt =null;
	          ResultSet rs = null;
	          String sql = "select * from products";
	          String sql_iamge = "select * from iamge";
	          pstmt = conn.prepareStatement(sql);
	         
	          rs = pstmt.executeQuery();
	          int cnt=0;
	         
			%>
<section class="py-5">		
 <div class="container px-4 px-lg-5 mt-5">
         <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
         
         <!-- 제품 리스트 불러오기 -->
         <% while(rs.next()){ %>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><%=rs.getString("name") %></h5>
                                    <!-- Product price-->
                                    <%=rs.getInt("price") %>원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                <a class="btn btn-outline-dark mt-auto" href="./Product_detail.jsp?id=<%=rs.getString("id")%>">상세보기</a></div>
                            </div>
                        </div>
                    </div>
                    
                       <%
                         }
                           %>
      </div>
  </div>
  </section>

  </body>
  </html>
  