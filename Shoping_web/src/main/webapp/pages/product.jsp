<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!--  �ַ� header�κп� �߰��ؾ��� ����� -->
 <jsp:include page="../config/header.jsp"></jsp:include>
 
 <!-- �׺���̼� �ٿ� ��� ���� ���� ���� �Ǿ� �ִ� -->
  <jsp:include page="../config/nav.jsp"></jsp:include>
  
  
<!-- �׺���̼� �� �Ʒ� ��ʸ� �����ִ� �κ� -->
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
	                             <tr><!-- ù��° �� ���� -->       
	                              <td rowspan="4" width="500px"><img class="card-img-top" src="./sample.jpg" alt="..." /></td>                            
	                            </tr><!-- ù��° �� �� --> 
                                </table>                   
                        </div>
                     </div>   
                  <div class="col mb-5">
                        <div class="card h-100"> 
                          <div class="d-flex justify-content-center">
                                   <h4>��ǰ��</h4>
                                   </div>
                                   <hr style="border: solid 4px gray;">
                                      <table class="table">
                                        <tr>
                                          <td>+�Һ��ڰ�</td>  
                                          <td>���ݶ�</td>                 
                                        </tr>
                                       <tr>
                                          <td><font color="red">+�ǸŰ�</font></td>      
                                          <td><font color="red">���ݶ�</font></td>             
                                        </tr>
                                        <tr>
                                          <td>+���þȳ�</td>  
                                          <td>üũ���</td>                 
                                        </tr>
                                        <tr>
                                          <td>+��ۺ�</td>  
                                          <td>���ݶ�</td>                 
                                        </tr>
                                       <tr>
                                         <td>+�ǽð� ���</td>
                                         <td>����</td>
                                        </tr>
                                        <tr>
                                          <td>+����-������</td>
                                          <td>
                                            <form action="">
                                             <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                              <option selected>- [�ʼ�] �ɼ��� �������ּ���!1 -</option>
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
                                            <td><font color="gray">(�ּ� �ֹ� 1�� �̻�)</font></td>
                                            <td></td>
                                           </tr>

                                      </table>
                                      <hr style="border: solid 1px gray;">
                                      <br>
                                      <table class="table">
                                        <tr>     
                                         <td><form action=""><button type="button" class="btn btn-outline-primary btn-lg">�����ϱ�</button> </form></td>
                                         <td><button type="button" class="btn btn-outline-primary btn-lg">��ٱ���</button></td>
                                         <td><button type="button" class="btn btn-outline-primary btn-lg">�� �ϱ�</button></td>
                                        
                                        </tr>
                                         
                                      </table>
                                      
                        </div>
                 </div>
                 
             </div>
          </div>
           <hr style="border: solid 1px gray;">
                  <div class="d-flex justify-content-center">
                   <h4>��ǰ ���� ��</h4>
                   </div>
                   
           <hr style="border: solid 1px gray;">
                   <div class="col mb-5">
                     <div class="card h-100"> 
                     ��ǰ �̹���
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