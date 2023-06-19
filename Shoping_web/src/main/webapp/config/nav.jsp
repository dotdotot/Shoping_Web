
<!-- 한글을 저장하기 위해 반드시 필요 -->
<%@page import="model.Categori"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="model.Categori"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>


<link href="../resources/css/nav.css" rel="stylesheet" />

<!-- Navigation-->
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
					<li class="nav-item"><a class="nav-link"
						href="../pages/introduce.jsp">소개</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">제품</a>

						<%
						//Class.forName("com.mysql.cj.jdbc.Driver");

						//Categori categori = new Categori();
						//categori.categorySetting(3);
						//List<Categori> childCategories1 = new ArrayList<>();
						//childCategories1 = categori.getChildCategories();
						//for (Categori category : childCategories1) {
						//	out.println(category.getName());
						//}
						%> <!-- 데이터베이스 에서 제품 카테고리를 가지고 와서 보여주는 부분   -->

						<ul class="dropdown-menu" aria-labelledby="navbarDropdown"
							style="width: 500px">
							<li><a class="dropdown-item" href="../pages/main.jsp">추천 상품</a></li>
							<li><hr class="dropdown-divider" /></li>

							<!-- 남자의 하의 메뉴 부분------------------------------------------------------------------------ -->
							<li>
							<ul id="menu">
								<li id="menu-item"><a href="#!" class="dropdown-item">남자</a>
									<ul id="submenu">
									<%
									Class.forName("com.mysql.cj.jdbc.Driver");
									
									int i = 7; //남자 상의에 대한 하위리스트를 불러오는 id값

									Categori categori = new Categori();
									categori.categorySetting(3);
									List<Categori> childCategories1 = new ArrayList<>();
									childCategories1 = categori.getChildCategories();
									for (Categori category : childCategories1) {
									%>
									<li>
									
									
									<!-- 남자의 상의, 하의에 대한 하의 메뉴들의 리스트 ----------------------------------------->
									<ul id="menu2">
								<li id="menu-item2"><a href="#!" class="dropdown-item">
									<%
									out.println(category.getName());
									%>
									</a>
									<ul id="submenu2">
									<%
									Class.forName("com.mysql.cj.jdbc.Driver");

									Categori categori3 = new Categori();
									categori3.categorySetting(i);
									List<Categori> childCategories3 = new ArrayList<>();
									childCategories3 = categori3.getChildCategories();
									for (Categori category3 : childCategories3) {
									%>
									<li><a href="#!">
									<%
									out.println(category3.getName());
									%>
									</a></li>
									
									<%} i = 11; //남자 하의에 대한 하위 리스트를 불러오는 id값 %>
									</ul></li>
									</ul>
									
									<!-- 남자의 상의, 하의에 대한 하의 메뉴들의 리스트 ----------------------------------------------->
									
									</li>
									
									<%} %>
									</ul></li>
									</ul>
							</li>
							<!-- 남자의 하의 메뉴 부분------------------------------------------------------------------------ -->
							
							<!-- 여자의 하의 메뉴 부분------------------------------------------------------------------------ -->
									<li>
							<ul id="menu">
								<li id="menu-item"><a href="#!" class="dropdown-item">여자</a>
									<ul id="submenu">
									<%
									Class.forName("com.mysql.cj.jdbc.Driver");
									
									int j = 19;

									Categori categori2 = new Categori();
									categori2.categorySetting(5);
									List<Categori> childCategories2 = new ArrayList<>();
									childCategories2 = categori2.getChildCategories();
									for (Categori category : childCategories2) {
									%>
									<li>
									
									
									<!-- 여자의 상의, 하의에 대한 하의 메뉴들의 리스트 ----------------------------------------->
									<ul id="menu2">
								<li id="menu-item2"><a href="#!" class="dropdown-item">
									<%
									out.println(category.getName());
									%>
									</a>
									<ul id="submenu2">
									<%
									Class.forName("com.mysql.cj.jdbc.Driver");

									Categori categori3 = new Categori();
									categori3.categorySetting(j);
									List<Categori> childCategories3 = new ArrayList<>();
									childCategories3 = categori3.getChildCategories();
									for (Categori category3 : childCategories3) {
									%>
									<li><a href="#!">
									<%
									out.println(category3.getName());
									%>
									</a></li>
									
									<%} j = 23; //여자 하의에 대한 하위 리스트를 불러오는 id값 %>
									</ul></li>
									</ul>
									
									<!-- 여자의 상의, 하의에 대한 하의 메뉴들의 리스트 ----------------------------------------------->
									
									
									</li>
									
									<%} %>
									</ul></li>
									</ul>
							</li>
								
							
							<!-- 여자의 하의 메뉴 부분------------------------------------------------------------------------ -->

								</ul>
							</li>
						</ul>
			</div>

			<div style="display: block; margin-left: auto;">
				<form class="" style="display: block;">
					<button class="btn btn-outline-dark" type="submit"
						style="margin-Top: 0px; display: block; float: right;">
						<i class="bi-cart-fill me-1"></i> 장바구니 <span
							class="badge bg-dark text-white ms-1 rounded-pill">0</span>
					</button>


					<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"
						style="margin-Top: 15px;">
						<li class="nav-item" style=""><a class="nav-link" href="#!">마이페이지</a></li>
						<li class="nav-item" style=""><a class="nav-link" href="#!">로그인</a></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</nav>


