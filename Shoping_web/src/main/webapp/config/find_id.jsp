<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>아이디 찾기</title>
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      flex-direction: column;
    }

    .form-container {
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

    .popup {
      display: none;
      border: 1px solid #ccc;
      padding: 10px;
      margin-top: 10px;
    }
  </style>
  <script>
    function findId() {
      var name = document.getElementById('name').value;
      var email = document.getElementById('email').value;

      // AJAX를 사용하여 서버로 요청 전송
      var xhr = new XMLHttpRequest();
      xhr.open("POST", "./findId", true);
      xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xhr.onreadystatechange = function() {
          if (xhr.readyState === 4) {
              if (xhr.status === 200) {
                  var foundId = xhr.responseText;
                  if (foundId) {
                      alert('아이디는 ' + foundId + ' 입니다');
                      // 로그인 페이지로 이동하고 아이디 입력란에 값을 채움
                      window.location.href = "login.jsp?username=" + encodeURIComponent(foundId);
                  } else {
                      alert('이름 혹은 이메일이 다릅니다.');
                  }
              } else {
                  alert('오류가 발생했습니다. 다시 시도해주세요.');
              }
          }
      };
      xhr.send("name=" + encodeURIComponent(name) + "&email=" + encodeURIComponent(email));
    }
  </script>
</head>
<body>
  <div class="form-container">
    <h2>아이디 찾기</h2>
    <div class="input-field">
      <input type="text" id="name" placeholder="이름">
    </div>
    <div class="input-field">
      <input type="email" id="email" placeholder="이메일">
    </div>
    <div class="btn-container">
      <input type="button" value="아이디 찾기" class="btn" onclick="findId()">
    </div>
    <div id="popup" class="popup"></div>
  </div>
</body>
</html>
