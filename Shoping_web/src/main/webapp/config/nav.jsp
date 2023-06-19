
<!-- 한글을 저장하기 위해 반드시 필요 -->
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<!-- Navigation-->

<!-- 데이터베이스연결 -->
<%@ include file="../config/DB.jsp" %>

     <!-- product_detail 쿼리 -->
			<%
			  String id = request.getParameter("id");
			  PreparedStatement pstmt =null;
	          ResultSet rs = null;
	          String sql = "select * from carts";	 
	          pstmt = conn.prepareStatement(sql);
	          rs = pstmt.executeQuery();
	          int cnt=0;
	     
			%>

<!-- Product details-->     

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container px-4 px-lg-5">
		<a class="navbar-brand" href="#!">옷 쇼핑몰(팀1)</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<div>
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4" style="">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="../pages/main.jsp">메인화면</a></li>
					<li class="nav-item"><a class="nav-link" href="../pages/introduce.jsp">소개</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">제품</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="../config/Product_list.jsp">전체 상품</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#!">인기 상품</a></li>
							<li><a class="dropdown-item" href="#!">신상</a></li>
						</ul></li>
				</ul>
			</div>

			<div style="display:block; margin-left:auto; ">
				<form action="Product_cart.jsp" class="" style="display:block;">
					<button class="btn btn-outline-dark" type="submit"
						style="margin-Top:0px; display:block; float:right;">
						<i class="bi-cart-fill me-1">장바구니</i>
						   
						   <%     
						    while(rs.next()){
				        	 cnt++;
						    }
				           %>
							<span class="badge bg-dark text-white ms-1 rounded-pill"><%=cnt %></span>
					</button>


					<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"
						style="margin-Top:15px;">
						<li class="nav-item" style=""><a class="nav-link" href="#!">마이페이지</a></li>
						<li class="nav-item" style=""><a class="nav-link" href="#!">로그인</a></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</nav>


