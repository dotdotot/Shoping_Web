<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"
	import="java.sql.*"%>
	
<!DOCTYPE html>
<html>
<head>
  <title>웹쇼핑몰 회원가입</title>
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      flex-direction: column;
    }

    .signup-container {
      border: 1px solid #ccc;
      padding: 20px;
      width: 500px;
      text-align: center;
    }

    .form-box {
      border: 1px solid #ccc;
      padding: 20px;
      margin-bottom: 20px;
    }

    .form-title {
      text-align: center;
      margin-bottom: 20px;
    }

    .input-field {
      margin-bottom: 15px;
      display: flex;
      align-items: center;
      justify-content: flex-start;
    }

    .input-field label {
      width: 100px;
      text-align: center;
      margin-right: 10px;
      font-size: 14px
    }

    .input-field input,
    .input-field select {
      padding: 5px;
      height: 30px;
      font-size: 12px
    }

    .input-field .search-address-btn,
    .input-field .btn {
      height: 30px;
      margin-left: 5px;
      width: 100px;
      font-size: 12px
    }

    .error-message,
    .success-message {
      color: red;
      font-size: 12px;
      margin-top: 5px;
      text-align: center;
    }

    .password-requirements {
      color: red;
      font-size: 12px;
      margin-top: 5px;
      text-align: center;
    }
    
    .password-mismatch-message {
	  color: red;
	  font-size: 12px;
 	  margin-top: 5px;
 	  text-align: center;
	}

	.password-match-message {
	 	color: limegreen;
  		font-size: 12px;
  		margin-top: 5px;
  		text-align: center;
  		display: none;
}
    
    .valid-password {
    color: limegreen;
  }
  </style>
</head>
<body>
  <div class="signup-container">
    <h2 class="form-title">회원가입</h2>
    <div class="form-box">
      <form action="./save" method="POST">
        <div class="input-field">
          <label for="username">아이디</label>
          <input type="text" id="username" name="username"  required>
          <button type="button" id="check-username-btn" onclick="checkUsername()" class="btn">중복확인</button>
		 </div>
        <div class="input-field">
          <label for="pwd">비밀번호</label>
          <input type="password" id="pwd" name="pwd"  required>
        </div>
        <p class="password-requirements">  비밀번호는 10자리 이상 20자리 이하로 입력해주세요.</p>
        <div class="input-field">
          <label for="confirm-password">비밀번호 확인</label>
          <input type="password" id="confirm-password" name="confirm_password"  required>
        </div>
		<p class="password-mismatch-message"> 비밀번호가 일치하지 않습니다.</p>
		<p class="password-match-message">  비밀번호가 일치합니다.</p>

		<div class="input-field">
          <label for="email-username">이메일</label>
          <input type="text" id="email-username" name="email_username" required>
          <span>@</span>
          <select id="email-domain-select" name="email_domain">
            <option value="naver.com">naver.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="직접입력">직접입력</option>
          </select>
          <input type="text" id="email-domain-input" name="email_domain_input" placeholder="뒷자리 입력" class="email-domain-input" style="display: none;">
        </div>
        <div class="input-field">
          <label for="name">이름</label>
          <input type="text" id="name" name="name" required>
        </div>
        <div class="input-field">
          <label for="address">주소</label>
          <input type="text" id="address" name="address" required>
        </div>
        <div class="input-field">
          <label for="phone">전화번호</label>
          <input type="text" id="phone" name="phone"  placeholder="-없이 숫자만 입력" required>
        </div>
        <div class="input-field">
          <label for="gender">성별</label>
          <select id="gender" name="gender">
            <option value="male">남성</option>
            <option value="female">여성</option>
          
          </select>
        </div>
        <div class="btn-container">
          <input type="submit" value="등록" class="btn" onclick="check_rgForm()">
        </div>
      </form>
    </div>
  </div>
  <script>
  var usernameInput = document.getElementById('username');
  var addressInput = document.getElementById('address');
  var passwordInput = document.getElementById('pwd');
  var confirmPasswordInput = document.getElementById('confirm-password');
  var passwordMismatchMessage = document.querySelector('.password-mismatch-message');
  var passwordMatchMessage = document.querySelector('.password-match-message');
  var passwordRequirements = document.querySelector('.password-requirements');

  usernameInput.addEventListener('keyup', function(event) {
    var charCode = event.key.charCodeAt(0);
    if (charCode >= 97 && charCode <= 122) {
      return true; // Allow lowercase English letters
    } else {
      event.preventDefault(); // Prevent input
      return false;
    }
  });

  addressInput.addEventListener('keyup', function(event) {
    var charCode = event.key.charCodeAt(0);
    if (charCode >= 12592 && charCode <= 12687) {
      return true; // Allow Hangul characters
    } else {
      event.preventDefault(); // Prevent input
      return false;
    }
  });
	
  
  function validatePassword() {
  	
 	 if (passwordInput.value.length < 10 || passwordInput.value.length > 20) {
 	        passwordRequirements.style.color = 'red';
 	      } else {
 	        passwordRequirements.style.color = 'limegreen';
 	      }

 	
 	if (confirmPasswordInput.value !== passwordInput.value || passwordInput.value.length < 10 || passwordInput.value.length > 20 ) {
 	    passwordMismatchMessage.style.display = 'block';
 	    passwordMatchMessage.style.display = 'none';
 	  } else {
 	    passwordMismatchMessage.style.display = 'none';
 	    passwordMatchMessage.style.display = 'block';
 	  }
   
   }

  // 비밀번호 입력란에 이벤트 리스너를 추가합니다
  passwordInput.addEventListener('input', validatePassword);

  var emailDomainSelect = document.getElementById('email-domain-select');
  var emailDomainInput = document.getElementById('email-domain-input');

  function handleEmailDomainChange() {
      if (emailDomainSelect.value === '직접입력') {
        emailDomainInput.style.display = 'inline-block';
      } else {
        emailDomainInput.style.display = 'none';
      }
    }

  confirmPasswordInput.addEventListener('input', validatePassword);
  emailDomainSelect.addEventListener('change', handleEmailDomainChange);


  function check_rgForm() {
    var passwordInput = document.getElementById('pwd');
    var usernameInput = document.getElementById('uid');
    var nameInput = document.getElementById('name');
    var emailInput = document.getElementById('email');
    var addressInput = document.getElementById('address');
    var phoneInput = document.getElementById('phone');

  	  if (passwordInput.value.length < 10 || passwordInput.value.length > 20) {
  	    alert("비밀번호는 10자 이상 20자 이하로 입력해주세요.");
  	    passwordInput.focus();
  	    return;
  	  }
  	  
  	  // 빈칸 검사
  	  if (usernameInput.value.trim() === "") {
  	    alert("아이디를 입력해주세요.");
  	    usernameInput.focus();
  	    return;
  	  }
  	  
  	  if (nameInput.value.trim() === "") {
  	    alert("이름을 입력해주세요.");
  	    nameInput.focus();
  	    return;
  	  }
  	  
  	  if (emailInput.value.trim() === "") {
  	    alert("이메일을 입력해주세요.");
  	    emailInput.focus();
  	    return;
  	  }
  	  
  	  if (addressInput.value.trim() === "") {
  	    alert("주소를 입력해주세요.");
  	    addressInput.focus();
  	    return;
  	  }
  	  
  	  var phonePattern = /^0[0-9]{8,12}$/; // 0으로 시작하고 8자리에서 12자리 사이의 숫자

  	  if (!phonePattern.test(phoneInput.value)) {
  	    alert("전화번호는 숫자만 입력해주세요.");
  	    phoneInput.value = ""; // 입력 필드 초기화
  	    phoneInput.focus(); // 입력 필드에 포커스 맞춤
  	    return;
  	  }

  	  // 모든 유효성 검사가 통과하면 폼을 제출합니다.
  	  document.getElementById('rgForm').submit();
  	}

  confirmPasswordInput.addEventListener('input', validatePassword);
  emailDomainSelect.addEventListener('change', handleEmailDomainChange);


  var checkUsernameBtn = document.getElementById('check-username-btn');
  checkUsernameBtn.addEventListener('click', checkUsername);

  var rgFormSubmitBtn = document.getElementById('rgFormSubmitBtn');
  rgFormSubmitBtn.addEventListener('click', check_rgForm);
  
  function checkUsername() {
	    var usernameInput = document.getElementById('username');

	    // 아이디 입력 확인
	    if (usernameInput.value.trim() === "") {
	        alert("아이디를 입력해주세요.");
	        return;
	    }

	    // AJAX 요청
	    var xhr = new XMLHttpRequest();
	    xhr.onreadystatechange = function() {
	    	if (xhr.readyState === XMLHttpRequest.DONE) {
	    		  if (xhr.status === 200) {
	    		    var response = xhr.responseText;
	    		    if (response === "duplicate") {
	    		      alert("다른 아이디를 사용해 주세요.");
	    		      usernameInput.value = ""; // 아이디 입력 필드 초기화
	    		    } else if (response === "available") {
	    		      // 중복된 아이디가 없는 경우 처리
	    		      // 예: 아이디 사용 가능 메시지 출력 등
	    		      alert("사용 가능한 아이디입니다.");
	    		    } else {
	    		      // 기타 처리 사항
	    		      alert("중복된 아이디 입니다.");
	    		      usernameInput.value = "";
	    		    }
	    		  } else {
	    		    // 요청 실패 처리
	    		    alert("요청 실패");
	    		  }
	    		}
	    }
	    xhr.open("GET", "checkUsername?username=" + encodeURIComponent(usernameInput.value), true);
	    xhr.send();
	}

</script>
</body>
</html>

