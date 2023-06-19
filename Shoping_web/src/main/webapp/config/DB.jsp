 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
<head>
<title>DB Connection Test</title>
</head>
<body>
<%
Connection conn = null;
Connection conn_2 = null;

try {
	String DB_URL = "jdbc:mysql://13.209.55.246:3306/project";
	String DB_USER = "projectuser";
	String DB_PASSWORD= "projectuser";

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    conn_2 = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    
    
 
    //out.println("연결 성공");
}catch(SQLException e) {
 out.println("연결실패"+e.getMessage());
}
%>
</body>
</html>