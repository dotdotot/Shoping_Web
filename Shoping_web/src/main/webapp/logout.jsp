<%@ page language="java"     pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

 <%
 	session.invalidate();
 	out.println("<script>alert('�α׾ƿ��Ǿ����ϴ�'); history.back();</script>");
 	response.sendRedirect("./pages/main.jsp");
 %>

</body>
</html>