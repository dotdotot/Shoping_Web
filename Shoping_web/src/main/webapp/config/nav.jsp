
<!-- 한글을 저장하기 위해 반드시 필요 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

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
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#!">메인화면</a></li>
				<li class="nav-item"><a class="nav-link" href="#!">소개</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">제품</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="#!">전체 상품</a></li>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item" href="#!">인기 상품</a></li>
						<li><a class="dropdown-item" href="#!">신상</a></li>
					</ul></li>
			</ul>
			<form class="d-flex">
				<button class="btn btn-outline-dark" type="submit">
					<i class="bi-cart-fill me-1"></i> 장바구니 <span
						class="badge bg-dark text-white ms-1 rounded-pill">0</span>
				</button>


				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4" style="margin-left: 400;">
					<li class="nav-item" style=""><a class="nav-link" href="#!">마이페이지</a></li>
					<li class="nav-item" style=""><a class="nav-link" href="#!">로그인</a></li>
				</ul>
			</form>
		</div>
	</div>
</nav>


<!-- Header-->
<header class="bg-dark py-5" style=" background-image: url('../resources/image/shop1.jpg'); background-repeat: no-repeat;
  background-size: cover; border:1px solid black; margin-top:20px;">
	<div class="container px-4 px-lg-5 my-5" style="">
		<div class="text-center text-white">
			<h1 class="display-4 fw-bolder" style="">옷 쇼핑몰(팀1)</h1>
			<p class="lead fw-normal text-white-50 mb-0" style="color:black">남성 전문 쇼핑몰</p>
		</div>
	</div>
</header>