 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport" content="width=devide-width" initial-scale=1">
<style type="text/css">
   body.sijunBody{
      backgorund-color:#f5f5f0;
      font-size:13pt;
      min-width:1480px;
      width:100%;
      padding:50px 0;
     
   }
   #frame{
      width:80%;
      margin:0 auto;
      padding:50px 50px;
      backgorund-color:#fff;
   }
   #frame2{
      border-bottom:solid 1px #e0e0eb;
      padding-bottom : 10px;
   }

   .home{
      float:right;
     
   }
   table.calculation1{
      clear:both;
      border:solid 1px #e0e0eb;
      border-collapse:collapse;
      background-color:f5f5f0;
      width:100%;
      font-size:10pt;
   
   }
   table.calculation1 td{
      border:solid 1px #e0e0eb;
      text-align:center;
   }
   table.calculation1 th{
      border:solid 1px #e0e0eb;
      padding:10px 0;
   }
   table.calculation2{

      border:solid 1px #e0e0eb;
      border-collapse:collapse;
      background-color:f5f5f0;
      width:100%;
      font-size:10pt;
   
   }
   table.calculation2 th{
      border:solid 1px #e0e0eb;
      }
      
   table.calculation2 td{
      border:solid 1px #e0e0eb;
      text-align:center;
   }
   .price{
      font-size:20pt;
      font-weight:bold;
   }
   .lifont{font-size:10pt; color:gray;}
   
   
   .btn{
       border:none;
       color:white;
       padding:5px 10px;
       font-size:13px;
       cusor:pointer;
       border-radius:5px;
   
   }
   .default{background-color:#fff;border:solid 1px gray;color:black;}
   .default:hover{background:#ddd;}
   .backBtn{background:#fff;border:solid 1px gray;}
   
   .btnfloat{float:left;}
   .btnfloat2{float:right;}
   .clearboth{clear:both;}
   
   .footerbtn {float:right;font-weight:bolder;font-size:12pt;border-radius:3px;}
   #allProduct,#productClear,#footerbtn{padding:11px 25px;}
   #allProduct{magin-left:140px;background-color:#264d73;color:#fff;font-weight:bold;font-size:12pt;}
   #productClear{background-color:gray;color:#fff;font-weight:bold;font-size:12pt;}
   .aa:hover{cusor:pointer;}

</style>
</head>
	<body class="sijunBody">
	
	<!--  주로 header부분에 추가해야할 내용들 -->
 <jsp:include page="../config/header.jsp"></jsp:include>
 
 <!-- 네비게이션 바와 상단 메인 라벨이 포함 되어 있다 -->
  <jsp:include page="../config/login_nav.jsp"></jsp:include>
  
  
<!-- 네비게이션 바 아래 배너를 보여주는 부분 -->
<jsp:include page="../config/banner.jsp"></jsp:include>
  
 <!--데이터베이스 호출 -->
	  <%@ include file="../config/DB.jsp" %> 
	  <%			  /*임시 유저 아이디 값 저장*/
	  
		
	  /*현재 로그인된 유저아이디의 세션을 가져와서 저장한다*/
	  int real_id = (int)session.getAttribute("r_id");
     %>
	  
	       <!-- Product_cart 쿼리 -->
			<%

			  PreparedStatement pstmt =null;
	          ResultSet rs = null;
	          
	          String sql = "select * from carts where user_id = '"+real_id+"' "; 
	          pstmt = conn.prepareStatement(sql);
	          rs = pstmt.executeQuery();
	          
	         
			%>

	
	
	 <div id="frame">
	  <form>
	    <div id="frame2">
	      <span style="font-size:16pt; font-weight:bold;">장바구니</span>
	      <span class="home">홈>남성의류>장바구니</span>
	      <span></span>
	    </div>
	    <br/>
	    
	    <div>
	     <table class="calculation1">
	      <tr>
	       <th class="aa">구매상품</th>
	       <th class="aa"></th>
	       <th style="width:700px;"></th>
	      </tr>
	     </table>
	    </div>
	    <br/>
	    
	   
	  
	      <table class="calculation1">
	       <thead>
	         <tr>
	         <th colspan="10" style="text-align:left; padding-left:10px;">상품</th>
	         </tr>
	         <tr>
	          
	          <th><span style="text-align:center;"><center>이미지</center></span>
	          <th style="width:550px;"><span>상품 이름</span></th>
	          <th style="width:70px; text-align:center;">판매가</th>
	          <th style="width:20px; text-align:center;">수량</th>
	          <th style="width:70px; text-align:center;">할인</th>
	          <th style="width:70px; text-align:center;">배송구분</th>
	          <th style="width:70px; text-align:center;">배송비</th>
	          <th style="width:70px; text-align:center;">합계</th>
	          <th style="width:70px; text-align:center;">선택</th>
	         </tr>
	         </thead>
	     <tbody>
    <!-- Product details--> 
     
	     <% 
	     String name="" , amount="" , image="";
	     int Amount=0 , price=0 , discount=0 , delivery_fee=0 , result=0 ,sum=0 , p_sum=0 , cnt=0;
	     
	     while(rs.next()){
            //데이터베이스 변수 선언
        	  name = rs.getString("name");
        	  image = rs.getString("image_path");
              Amount = rs.getInt("amount");
        	  price = rs.getInt("price");
        	  discount = rs.getInt("discount");
        	  delivery_fee = 2500;
        	  result = (Amount*price)-discount+delivery_fee;
        	  p_sum+=(price*Amount)-discount;
        	  sum+=result;
        	
       
        	  
        	  %> 
	        
	           <tr style="height:90px; background-color:#fff;">
	        
	              
	              <td style="border-left:none; border-right:none;">
	               <img style="width:40%;" src="<%=image%>"></td>
	               

	               <%--제품이름 --%>
	              <td style="text-align:left;padding-left:10px;border-left:none;font-weight:bold;"><%=name %></td>
	              <%--제품가격 --%>
	              <td><span style="padding-left:10px; text-align:center"><%=price %></span>
	              <%--제품수량 --%>
	              <td style="width:80px;">
	               <%=Amount %> 
	                
	           </td>
	           <%--제품 할인 --%>
	           <td><%=discount %></td>
	           <%--배송비 --%>
	           <td>기본배송</td>
	           <td><%=delivery_fee %>원</td>
	           <td><span><%=result %></span>원</td>
	           
	           <td>
	            <button class="btn default" style="border-radius:3px;width:70px;margin-bottom:3px;font-size:11px;">주문하기</button>
	            <br>
	            
	            <button class="btn default" style="border-radius:3px;width:70px;margin-bottom:3px;font-size:11px;">
	            <a href="./Product_delete.jsp?id=<%=rs.getString("id") %>">삭제하기</a></button>
	           
	            
	            </td>       
	           </tr>
	           <%
	           cnt++;}
	              
	           %>
	         </tbody>
	  
	      <tfoot>
	       <tr style="height:60px;">
	         <td colspan="5" style="border-right:none; text-align:left;padding-left:10px;">
	          <span>[기본배송]</span>
	       </td>
	        <td colspan="5" style="border-right:none; text-align:right;padding-left:10px;">
	           <span><%=p_sum%></span> +<span><%=delivery_fee*cnt%> = 합계</span>&nbsp;
	          <span style="font-weight:bold;font-size:15pt;"><%=sum %></span>
	        </td>
	    
	      </tr>
	      </tfoot>
	      
	      </table>
	      
	      <div style="border:solid 1px #e0e0eb; padding:15px 0">
	        <span style="font-size:10pt;color:gray;">입력란</span>
	       
	       </div>
	        

	    <br/><br/>
	    
	    <table class="calculation2">
	      <tr>
	        <th>총 상품금액</th>
	        <th>총 배송비</th>
	        <th style="width:750px;padding:22px 0;"><span>결제 금액</span></th>
	        </tr>
	      <tr style="background-color:#fff;">
	       <td style="padding:22px 0;"><span class="price"><%=p_sum%></span>원</td>
	       <td>+<span class="price"><%=delivery_fee*cnt%></span>원</td>
	       <td>-<span class="price"><%=sum %></span>원</td>
	     </tr>
	    </table>
	    <br><br>
	    
	    <div align="center">
	      <button id="check_module" type="button" class="btn btn-outline-primary btn-lg">전체상품주문!</</button>
	      <button class="btn default footerbtn" id="footerbtn"><a href="Product_list.jsp">쇼핑계속하기</a></button>
	      <span class="clearboth"></span>
	      
	    </div>
	  </form>
	  
	  </div>
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
        
            name: '<%=name%>외<%=cnt%>종',
            //결제창에서 보여질 상품 이름
            amount: <%=sum%>, 
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
	</body>
</html>