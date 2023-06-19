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
	          String sql = "select * from carts ";	 
	          pstmt = conn.prepareStatement(sql);
	          rs = pstmt.executeQuery();
	         
			%>

	
	
	 <div id="frame">
	  <form>
	    <div id="frame2">
	      <span style="font-size:16pt; font-weight:bold;">장바구니</span>
	      <span class="home">홈>장바구니</span>
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
	          
	          <th><span style="text-align:center;">이미지</span>
	          <th style="width:550px;"><span>상품 이름</span></th>
	          <th>판매가</th>
	          <th>수량</th>
	          <th style="width:100px;">할인</th>
	          <th>배송구분</th>
	          <th>배송비</th>
	          <th>합계</th>
	          <th>선택</th>
	         </tr>
	         </thead>
	         
    <!-- Product details--> 
	     <% while(rs.next()){
            //데이터베이스 변수 선언
            String name="" , amount="";
            
        	  name = rs.getString("name");
              int Amount = rs.getInt("amount");
        	  int price = rs.getInt("price");
        	  int discount = rs.getInt("discount");
        	  int delivery_fee = 2500;
        	  int result = (Amount*price)-discount+delivery_fee;
        	
       
        	  
        	  %> 
	         <tbody>
	           <tr style="height:90px; background-color:#fff;">
	        
	              
	              <td style="border-left:none; border-right:none;">
	               <img style="width:80%;" src="#"></td>
	               

	               <%--제품이름 --%>
	              <td style="text-align:left;padding-left:10px;border-left:none;font-weight:bold;"><%=name %></td>
	              <%--제품가격 --%>
	              <td><span style="padding-left:10px;"><%=price %></span>
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
	          
	            
	            </td>
	           
	          
	           </tr>
	            <%} %>
	         </tbody>
	      <tfoot>
	       <tr style="height:60px;">
	         <td colspan="5" style="border-right:none; text-align:left;padding-left:10px;">
	          <span>[기본배송]</span>
	       </td>
	        <td colspan="5" style="border-right:none; text-align:right;padding-left:10px;">
	          상품금액<span>돈</span> +<span>배송비 2500 = 합계</span>&nbsp;
	          <span style="font-weight:bold;font-size:15pt;">0</span>
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
	       <td style="padding:22px 0;"><span class="price">0</span>원</td>
	       <td>+<span class="price">0</span>원</td>
	       <td>-<span class="price">0</span>원</td>
	     </tr>
	    </table>
	    <br><br>
	    
	    <div align="center">
	      <button class="btn default" id="allProduct">전체상품주문</</button>
	      <button class="btn default footerbtn" id="footerbtn">쇼핑계속하기</</button>
	      <span class="clearboth"></span>
	      
	    </div>
	  </form>
	  
	  </div>
	  <jsp:include page="../config/footer.jsp"></jsp:include>
	
	</body>
</html>