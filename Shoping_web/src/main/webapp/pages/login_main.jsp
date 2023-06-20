<!-- 상단에 무조건 써주어야 된다. 선언을 해주지 않으면 언어에 대한 오류로 저장 불가 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<title>메인 페이지</title>


<!--  주로 header부분에 추가해야할 내용들 -->
<jsp:include page="../config/header.jsp"></jsp:include>

<!-- 네비게이션 바 -->
<jsp:include page="../config/login_nav.jsp"></jsp:include>


<!-- 네비게이션 바 아래 배너를 보여주는 부분 -->
<jsp:include page="../config/banner.jsp"></jsp:include>

<!-- Section-->
<section class="py-5">
 <%=session.getAttribute("id")%> 
	<div class="container px-4 px-lg-5 mt-5">
		<h4>쿠폰 적용 가능 상품</h4>
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Sale badge-->
					<div class="badge bg-dark text-white position-absolute"
						style="top: 0.5rem; right: 0.5rem">쿠폰</div>
					<!-- Product image1------------------------------------------------------------------------>
					<img class="card-img-top" src="../resources/image/product1.png"
						alt="..." />
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder" style="font-size: large">반팔 티셔츠 5종</h5>
							<!-- Product price-->
							42,000원
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#"
								style="margin-bottom: 3px; width: 90%">상세보기</a>
						</div>
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#"
								style="width: 90%">장바구니</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Sale badge-->
					<div class="badge bg-dark text-white position-absolute"
						style="top: 0.5rem; right: 0.5rem">쿠폰</div>
					<!-- Product image2---------------------------------------------------------------------------------->
					<img class="card-img-top" src="../resources/image/product2.png"
						alt="..." />
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder" style="font-size: large">카고 팬츠</h5>
							<!-- Product reviews-->
							<!--  별점
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                     -->
							<!-- Product price-->
							<span class="text-muted text-decoration-line-through">55,000원</span>
							48,000원
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#"
								style="margin-bottom: 3px; width: 90%">상세보기</a>
						</div>
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#"
								style="width: 90%">장바구니</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Sale badge-->
					<div class="badge bg-dark text-white position-absolute"
						style="top: 0.5rem; right: 0.5rem">쿠폰</div>
					<!-- Product image3------------------------------------------------------------------------------>
					<img class="card-img-top" src="../resources/image/product3.png"
						alt="..." />
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder" style="font-size: large">카고 바지</h5>
							<!-- Product price-->
							<span class="text-muted text-decoration-line-through">49,000원</span>
							47,000원
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#"
								style="margin-bottom: 3px; width: 90%">상세보기</a>
						</div>
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#"
								style="width: 90%">장바구니</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Sale badge-->
					<div class="badge bg-dark text-white position-absolute"
						style="top: 0.5rem; right: 0.5rem">쿠폰</div>
					<!-- Product image4-------------------------------------------------------------------------------->
					<img class="card-img-top" src="../resources/image/product4.png"
						alt="..." />
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder" style="font-size: large">데님 팬츠</h5>
							<!-- Product reviews-->
							<!-- 
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                     -->
							<!-- Product price-->
							39,000원
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#"
								style="margin-bottom: 3px; width: 90%">상세보기</a>
						</div>
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#"
								style="width: 90%">장바구니</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Sale badge-->
					<div class="badge bg-dark text-white position-absolute"
						style="top: 0.5rem; right: 0.5rem">쿠폰</div>
					<!-- Product image5-------------------------------------------------------------------------------->
					<img class="card-img-top" src="../resources/image/product5.png"
						alt="..." />
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder" style="font-size: large">반팔 셔츠</h5>
							<!-- Product price-->
							<span class="text-muted text-decoration-line-through">55,000원</span>
							48,000원
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#"
								style="margin-bottom: 3px; width: 90%">상세보기</a>
						</div>
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#"
								style="width: 90%">장바구니</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Sale badge-->
					<div class="badge bg-dark text-white position-absolute"
						style="top: 0.5rem; right: 0.5rem">쿠폰</div>
					<!-- Product image6------------------------------------------------------------------------------>
					<img class="card-img-top" src="../resources/image/product6.png"
						alt="..." />
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder" style="font-size: large">데님 팬츠</h5>
							<!-- Product price-->
							58,000원
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#"
								style="margin-bottom: 3px; width: 90%">상세보기</a>
						</div>
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#"
								style="width: 90%">장바구니</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Sale badge-->
					<div class="badge bg-dark text-white position-absolute"
						style="top: 0.5rem; right: 0.5rem">특가</div>
					<!-- Product image7--------------------------------------------------------------------------->
					<img class="card-img-top" src="../resources/image/product9.png"
						alt="..." />
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder" style="font-size: large">밴딩 팬츠 2종</h5>
							<!-- Product reviews-->
							<!-- 
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                     -->
							<!-- Product price-->
							<span class="text-muted text-decoration-line-through">32,000원</span>
							28,000원
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#"
								style="margin-bottom: 3px; width: 90%">상세보기</a>
						</div>
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#"
								style="width: 90%">장바구니</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Sale badge-->
					<div class="badge bg-dark text-white position-absolute"
						style="top: 0.5rem; right: 0.5rem">특가</div>
					<!-- Product image8---------------------------------------------------------------------------->
					<img class="card-img-top" src="../resources/image/product10.png"
						alt="..." />
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder" style="font-size: large">쿨 팬츠 2종</h5>
							<!-- Product reviews-->
							<!-- 
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                     -->
							<!-- Product price-->
							32,000원
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#"
								style="margin-bottom: 3px; width: 90%">상세보기</a>
						</div>
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#"
								style="width: 90%">장바구니</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>



<!-- footer부분을 불러오는 부분 -->
<jsp:include page="../config/footer.jsp"></jsp:include>