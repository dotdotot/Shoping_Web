<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>1조 쇼핑몰 로그인</title>
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      flex-direction: column;
    }

    .login-container {
      border: 1px solid #ccc;
      padding: 20px;
      width: 300px;
      text-align: center;
    }

    .input-field {
      margin-bottom: 10px;
      display: flex;
      align-items: center;
    }

    .input-field input {
      flex-grow: 1;
    }

    .btn-container {
      display: flex;
      justify-content: flex-end;
      margin-top: 10px;
    }

    .btn-container .btn {
      margin-left: 10px;
    }

    .header {
      margin-bottom: 20px;
    }

    .box {
      border: 1px solid #ccc;
      padding: 10px;
      margin-bottom: 10px;
    }

    .signup-link {
      margin-top: 10px;
      font-weight: bold;
      color: gray;
    }

    .signup-link a {
      color: black;
      text-decoration: underline;
      font-weight: bold;
    }
  </style>
</head>
<body>
  <div class="header">
    <h2>1조 웹쇼핑몰 로그인</h2>
  </div>
  <div class="login-container">
    <form action="/login" method="post">
      <div class="input-field">
        <input type="text" id="username" name="username" placeholder="아이디">
      </div>
      <div class="input-field">
        <input type="password" id="password" name="password" placeholder="비밀번호">
      </div>
      <div class="btn-container">
        <input type="submit" value="로그인" class="btn">
      </div>
    </form>
    <div class="signup-link">
      <a href="find_id.jsp" style="color: black; font-weight: bold;">아이디 찾기</a> |
      <a href="find_password.jsp" style="color: black; font-weight: bold;">비밀번호 찾기</a>
    </div>
    <div class="signup-link">
      이 쇼핑몰에 처음이신가요? <a href="33.jsp">여기를 클릭</a>
    </div>
  </div>
</body>
</html>