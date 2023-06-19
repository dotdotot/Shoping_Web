<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>


<% 
Connection conn = null;

try{
	String url = "jdbc:mysql://13.209.55.246:3306/project";
	String user = "projectuser";
	String password = "projectuser";

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	
	out.println("데이터베이스 연결이 성공했습니다.<br>");
}catch(SQLException ex){
	out.println("데이터베이스 연결이 실패했습니다.<br>");
	out.println("SQLException : " + ex.getMessage());
}

%>