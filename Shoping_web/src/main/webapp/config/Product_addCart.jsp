 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%@page import="model.Categori"%>
<%@ page import="model.Categori"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../config/DB.jsp" %>
<% 
  String amt = request.getParameter("n1");
  int amount = Integer.parseInt(amt); 
  String id = request.getParameter("id");
  if(id==null || id.trim().equals("")){
	 // product.jsp로 되돌아간다.
	 response.sendRedirect("product_detail.jsp");
	 // 프로그램 종료
	 return;
}
  PreparedStatement pstmt =null;
  ResultSet rs = null;
  String sql = "select * from products where id = '"+id+"' ";
  pstmt = conn.prepareStatement(sql);
  rs = pstmt.executeQuery();
  
  while(rs.next()){
	int product_id = rs.getInt("id");
	String product_name = rs.getString("name");
    int product_price = rs.getInt("price");
	int discount = rs.getInt("discount");
	String img_path = rs.getString("main_image_path");
	

	
  String sql2 = "insert into carts values(?,?,?,?,?,?,?,?,?,?,?)";
  pstmt = conn.prepareStatement(sql2);
  pstmt.setString(1, null); 
  pstmt.setInt(2, product_id );
  pstmt.setInt(3,  1); //임의의 유저아이디임 변경필요
  pstmt.setInt(4,  amount); //수량
  pstmt.setString(5, null );
  pstmt.setString(6, null );
  pstmt.setString(7, null);
  pstmt.setString(8, product_name );
  pstmt.setInt(9, product_price);
  pstmt.setInt(10, discount);
  pstmt.setString(11, img_path);
  }
  pstmt.executeUpdate();
  
  
  if(pstmt != null){
  	pstmt.close();
  }
  if(conn != null){
  	conn.close();
  }
  
	
	response.sendRedirect("Product_detail.jsp?id="+id);
%>

</body>
</html>