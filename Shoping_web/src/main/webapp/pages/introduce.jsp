<!-- 상단에 무조건 써주어야 된다. 선언을 해주지 않으면 언어에 대한 오류로 저장 불가 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<title>쇼핑몰 소개 페이지</title>


<!--  주로 header부분에 추가해야할 내용들 -->
<jsp:include page="../config/header.jsp"></jsp:include>

<!-- 네비게이션 바 -->
<jsp:include page="../config/nav.jsp"></jsp:include>




  		<!-- 소개 페이지를 위한 코드 ------------------------------------------------------------------------------->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- 소개 페이지를 위한 코드 ------------------------------------------------------------------------------->
        
        <!-- CSS주입 부분 -->
        <!-- 메인 화면에 필요한 css위치를 불러와 주입-->
        <link href="../resources/css/introduce.css" rel="stylesheet" />

   
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('../resources/image/about-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="page-heading">
                            <h1>About US</h1>
                            <span class="subheading">옷 쇼핑몰(팀1)</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Main Content-->
        <main class="mb-4">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe nostrum ullam eveniet pariatur voluptates odit, fuga atque ea nobis sit soluta odio, adipisci quas excepturi maxime quae totam ducimus consectetur?</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius praesentium recusandae illo eaque architecto error, repellendus iusto reprehenderit, doloribus, minus sunt. Numquam at quae voluptatum in officia voluptas voluptatibus, minus!</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut consequuntur magnam, excepturi aliquid ex itaque esse est vero natus quae optio aperiam soluta voluptatibus corporis atque iste neque sit tempora!</p>
                    </div>
                </div>
            </div>
        </main>
       


<!-- footer부분을 불러오는 부분 -->
<jsp:include page="../config/footer.jsp"></jsp:include>