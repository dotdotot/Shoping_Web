 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <%@ include file="../config/DB.jsp" %> 
  <%
    PreparedStatement pstmt =null;
    ResultSet rs = null;
    String productId = request.getParameter("id");
    String sql = "select * from carts";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    
    if(rs.next()){
    	sql="delete from carts where id = ?";
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1,productId);
    	pstmt.executeUpdate();
    }else
    	out.print("오류");
    
	 if(rs!=null)
		 pstmt.close();
	 if(pstmt!=null)
		 pstmt.close();
	 if(conn!=null)
		 conn.close();

  //out.print(productId);
 response.sendRedirect("Product_cart.jsp");
  %>
</body>
</html>