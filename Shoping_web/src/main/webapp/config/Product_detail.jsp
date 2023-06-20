 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%@page import="model.Categori"%>
<%@ page import="model.Categori"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 페이지 </title>


   
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

<!-- Product details-->       
 <section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
         <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
         
          <% while(rs.next()){
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
                 <div class="col mb-5">
                        <div class="card h-100">                                               
                            <!-- Product image-->
                            
                            
                                <table border="1">
	                             <tr><!-- 첫번째 줄 시작 이미지 -->       
	                              <td rowspan="4" width="500px"><img class="card-img-top" src="<%=rs.getString("main_image_path") %>" alt="..." /></td>                            
	                            </tr>
                                </table>                   
                        </div>
                     </div>   
                  <div class="col mb-5">
                        <div class="card h-100"> 
                          <div class="d-flex justify-content-center">
                          <!-- 상품이름 -->
                                   <h4><%=name%></h4>
                           </div>
                                   <hr style="border: solid 4px gray;">
                                      <table class="table">
                                        <tr>
                                          <td><font color="red">+판매가</font></td>      
                                          <td><font color="red"><%=price%>원</font></td>                
                                        </tr>
                                       <tr>
                                          <td>+할인률</td>  
                                          <td><STRIKE><%=discount %>원</STRIKE></td>  
                                        </tr>
                                        <tr>
                                          <td>+혜택안내</td>  
                                          <td><%if(discount>1){ %>할인적용 상품<%}else{ %> - <%} %></td>                 
                                        </tr>
                                        <tr>
                                          <td>+배송비</td>  
                                          <td>+<%=Shipping %>원</td>                 
                                        </tr>
                                       <tr>
                                         <td>+실시간 재고</td>
                                         <td><%=amount%>개</td>
                                        </tr>
                                        <tr>
                                          <td>+색상-사이즈</td>
                                          <td>
                                            <form action="">
                                             <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                              <option selected>- [필수] 옵션을 선택해주세요!-</option>
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
                                          <tr>
                                            <td>+총 가격</td>   
                                            <td><%=result %>원</td>   
                                           </tr>
                                      </table>
                                      <hr style="border: solid 1px gray;">
                                      <br>
                                      <table class="table">
                                        <tr>     
                                         <td><form action="">
                                         <button id="check_module" type="button" class="btn btn-outline-primary btn-lg" >상품구매</button>
                                          </form></td>
                                          
                                         <td>
                                         <form name="addForm" action="./Product_addCart.jsp?id=<%=rs.getString("id")%>" method="post" >
                                          <button type="button" class="btn btn-outline-primary btn-lg" onClick="addToCart()">장바구니</button>
                                         </form>
                                         </td>
                                         <td><button type="button" class="btn btn-outline-primary btn-lg">찜 하기</button></td>
                                        
                                        </tr>
                                         
                                </table>
                        </div>
                 </div>
             </div>
          </div>
          


           <hr style="border: solid 1px gray;">
           
                  <div class="d-flex justify-content-center">
                 

                   <h4>제품 설명 란1</h4>
                  
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
            <h5>추천 의류 테스트</h5>
            <hr style="border: solid 1px gray;">
            
          <%@ include file="Related_Products.jsp" %>
     

 
 
  <jsp:include page="../config/footer.jsp"></jsp:include>
  
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
    <!-- Javascript -->

<script type="text/javascript">
   function addToCart(){
	   if(confirm("상품을 장바구니에 추가하시겠습니까?")){
		   document.addForm.submit();
	   }
	   else{
		   document.addForm.reset();
	   }
	   
   }
   </script>
    
    <script>
    $("#check_module").click(function () {
        var IMP = window.IMP; // 생략가능
        IMP.init('imp72102045'); 
        // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
        IMP.request_pay({
            pg: 'html5_inicis.INIpayTest', // version 1.1.0부터 지원.
            /* 
                'kakao':카카오페이, 
                html5_inicis':이니시스(웹표준결제)
                    'nice':나이스페이
                    'jtnet':제이티넷
                    'uplus':LG유플러스
                    'danal':다날
                    'payco':페이코
                    'syrup':시럽페이
                    'paypal':페이팔
                */
            pay_method: 'card',
            /* 
                'samsung':삼성페이, 
                'card':신용카드, 
                'trans':실시간계좌이체,
                'vbank':가상계좌,
                'phone':휴대폰소액결제 
            */
            merchant_uid: 'merchant_' + new Date().getTime(),
        
            name: '<%= name %>',
            //결제창에서 보여질 상품 이름
            amount: <%=price%>, 
            //가격 
            buyer_email: 'iamport@siot.do', //디비 유저 정보
            buyer_name: '구매자이름', //디비 유저 정보
            buyer_tel: '010-1234-5678', //디비 유저 정보
            buyer_addr: '서울특별시 강남구 삼성동', //디비 유저 정보
            buyer_postcode: '123-456', //디비 유저 정보
            m_redirect_url: 'https://www.yourdomain.com/payments/complete'
            /*  
                모바일 결제시,
                결제가 끝나고 랜딩되는 URL을 지정 
                (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
                */
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });
    });
</script>
 <%} %>
 </section>
</body>
</html>