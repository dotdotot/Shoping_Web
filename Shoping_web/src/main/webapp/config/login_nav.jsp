<%@ page language="java"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<!-- �ѱ��� �����ϱ� ���� �ݵ�� �ʿ� -->
<%@page import="model.Categori"%>
<%@ page import="model.Categori"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8"%>

<%@ page import="java.sql.*"%>


<link href="../resources/css/nav.css" rel="stylesheet" />

<!-- Navigation-->




<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container px-4 px-lg-5">
		<a class="navbar-brand" href="#!">�� ���θ�(��1)</a>
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
						aria-current="page" href="../pages/main.jsp">����ȭ��</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../pages/introduce.jsp">�Ұ�</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">��ǰ</a>

						<%
						//Class.forName("com.mysql.cj.jdbc.Driver");

						//Categori categori = new Categori();
						//categori.categorySetting(3);
						//List<Categori> childCategories1 = new ArrayList<>();
						//childCategories1 = categori.getChildCategories();
						//for (Categori category : childCategories1) {
						//	out.println(category.getName());
						//}
						%> <!-- �����ͺ��̽� ���� ��ǰ ī�װ��� ������ �ͼ� �����ִ� �κ�   -->

						<ul class="dropdown-menu" aria-labelledby="navbarDropdown"
							style="width: 500px">
							<li><a class="dropdown-item" href="../config/Product_list.jsp">��õ ��ǰ</a></li>
							<li><hr class="dropdown-divider" /></li>

							<!-- ������ ���� �޴� �κ�------------------------------------------------------------------------ -->
							<li>
							<ul id="menu">
								<li id="menu-item"><a href="#!" class="dropdown-item">����</a>
									<ul id="submenu">
									<%
									Class.forName("com.mysql.cj.jdbc.Driver");
									
									int i = 7; //���� ���ǿ� ���� ��������Ʈ�� �ҷ����� id��

									Categori categori = new Categori();
									categori.categorySetting(3);
									List<Categori> childCategories1 = new ArrayList<>();
									childCategories1 = categori.getChildCategories();
									for (Categori category : childCategories1) {
									%>
									<li>
									
									
									<!-- ������ ����, ���ǿ� ���� ���� �޴����� ����Ʈ ----------------------------------------->
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
									
									<%} i = 11; //���� ���ǿ� ���� ���� ����Ʈ�� �ҷ����� id�� %>
									</ul></li>
									</ul>
									
									<!-- ������ ����, ���ǿ� ���� ���� �޴����� ����Ʈ ----------------------------------------------->
									
									</li>
									
									<%} %>
									</ul></li>
									</ul>
							</li>
							<!-- ������ ���� �޴� �κ�------------------------------------------------------------------------ -->
							
							<!-- ������ ���� �޴� �κ�------------------------------------------------------------------------ -->
									<li>
							<ul id="menu">
								<li id="menu-item"><a href="#!" class="dropdown-item">����</a>
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
									
									
									<!-- ������ ����, ���ǿ� ���� ���� �޴����� ����Ʈ ----------------------------------------->
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
									
									<%} j = 23; //���� ���ǿ� ���� ���� ����Ʈ�� �ҷ����� id�� %>
									</ul></li>
									</ul>
									
									<!-- ������ ����, ���ǿ� ���� ���� �޴����� ����Ʈ ----------------------------------------------->
									
									
									</li>
									
									<%} %>
									</ul></li>
									</ul>
							</li>
								
							
							<!-- ������ ���� �޴� �κ�------------------------------------------------------------------------ -->

								</ul>
							</li>
						</ul>
			</div>

			<div style="display: block; margin-left: auto;">
				<form action="../config/Product_cart.jsp" class="" style="display: block;">
					<button class="btn btn-outline-dark" type="submit"
						style="margin-Top: 0px; display: block; float: right;">
						<i class="bi-cart-fill me-1"></i> ��ٱ��� 
						
			<%@ include file="../config/DB.jsp" %> 
	  
	  
	       <!-- Product_cart ���� -->
	      
			<%
			  /*�ӽ� ���� ���̵� �� ����*/
			  Object u_id = session.getAttribute("id");
			  String uid = (String)u_id;
			  
			  int real_id = (int)session.getAttribute("r_id");
			  
		
			 
			
			  /*���� �α��ε� �������̵��� ������ �����ͼ� �����Ѵ�*/
		      
              int cnt=0;
			  PreparedStatement pstmt =null;
	          ResultSet rs = null;
	          String sql = "select * from carts where user_id = '"+real_id+"' ";  
	          pstmt = conn.prepareStatement(sql);
	          rs = pstmt.executeQuery();
	         
			%>
						<%while(rs.next()){ 
							
							
							
							
							
							cnt++;}%>
						
						<span class="badge bg-dark text-white ms-1 rounded-pill"><%=cnt%></span>
						
					</button>


					<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"
						style="margin-Top: 15px;">
						<li class="nav-item" style=""><a class="nav-link" href="../logout.jsp">�α׾ƿ�</a></li>
						<li class="nav-item" style=""><a class="nav-link" href="#!">����������</a></li>
						<li class="nav-item" style=""><a class="nav-link" href=""><%=session.getAttribute("id")%>�� ȯ���մϴ�!</a></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</nav>


