<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!--  주로 header부분에 추가해야할 내용들 -->
 <jsp:include page="../config/header.jsp"></jsp:include>
 
 <!-- 네비게이션 바와 상단 메인 라벨이 포함 되어 있다 -->
  <jsp:include page="../config/nav.jsp"></jsp:include>
  
  
<!-- 네비게이션 바 아래 배너를 보여주는 부분 -->
<jsp:include page="../config/banner.jsp"></jsp:include>
  
  
<!-- Section-->
<!-- Product details-->       
 <section class="py-5">
 
    <div class="container px-4 px-lg-5 mt-5">
         <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                 <div class="col mb-5">
                        <div class="card h-100">                                               
                            <!-- Product image-->
                            
                            
                                <table border="1">
	                             <tr><!-- 첫번째 줄 시작 -->       
	                              <td rowspan="4" width="500px"><img class="card-img-top" src="./sample.jpg" alt="..." /></td>                            
	                            </tr><!-- 첫번째 줄 끝 --> 
                                </table>                   
                        </div>
                     </div>   
                  <div class="col mb-5">
                        <div class="card h-100"> 
                          <div class="d-flex justify-content-center">
                                   <h4>제품명</h4>
                                   </div>
                                   <hr style="border: solid 4px gray;">
                                      <table class="table">
                                        <tr>
                                          <td>+소비자가</td>  
                                          <td>가격란</td>                 
                                        </tr>
                                       <tr>
                                          <td><font color="red">+판매가</font></td>      
                                          <td><font color="red">가격란</font></td>             
                                        </tr>
                                        <tr>
                                          <td>+혜택안내</td>  
                                          <td>체크라네</td>                 
                                        </tr>
                                        <tr>
                                          <td>+배송비</td>  
                                          <td>가격란</td>                 
                                        </tr>
                                       <tr>
                                         <td>+실시간 재고</td>
                                         <td>재고란</td>
                                        </tr>
                                        <tr>
                                          <td>+색상-사이즈</td>
                                          <td>
                                            <form action="">
                                             <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                              <option selected>- [필수] 옵션을 선택해주세요!1 -</option>
                                              <option value="1">1</option>
                                              <option value="2">2</option>
                                              <option value="3">3</option>
                                              <option value="4">4</option>
                                             <option value="5">5</option>
                                            </select>
                                           </form>
                                           </td>
                                           </tr>
                                           <tr>
                                            <td><font color="gray">(최소 주문 1개 이상)</font></td>
                                            <td></td>
                                           </tr>

                                      </table>
                                      <hr style="border: solid 1px gray;">
                                      <br>
                                      <table class="table">
                                        <tr>     
                                         <td><form action=""><button type="button" class="btn btn-outline-primary btn-lg">구매하기</button> </form></td>
                                         <td><button type="button" class="btn btn-outline-primary btn-lg">장바구니</button></td>
                                         <td><button type="button" class="btn btn-outline-primary btn-lg">찜 하기</button></td>
                                        
                                        </tr>
                                         
                                      </table>
                                      
                        </div>
                 </div>
                 
             </div>
          </div>
           <hr style="border: solid 1px gray;">
                  <div class="d-flex justify-content-center">
                   <h4>제품 설명 란</h4>
                   </div>
                   
           <hr style="border: solid 1px gray;">
                   <div class="col mb-5">
                     <div class="card h-100"> 
                     제품 이미지
                     </div>
                    </div>
                   <div class="col mb-5">
                        <div class="card h-100"> 
                          
                            <ul class="list-group">
                              <li class="list-group-item">An item</li>
                              <li class="list-group-item">A second item</li>
                              <li class="list-group-item">A third item</li>
                              <li class="list-group-item">A fourth item</li>
                              <li class="list-group-item">And a fifth one</li>
                            </ul>
                       


           
        
            </div>
            </div>
            <hr style="border: solid 1px gray;">
          <%@ include file="Related_Products.jsp" %>




    
    

                   
 </section>
 
 
  <jsp:include page="../config/footer.jsp"></jsp:include>

</body>
</html>