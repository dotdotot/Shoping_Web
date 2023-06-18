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
      text-align: left;
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
      <form action="/save" method="POST">
        <div class="input-field">
          <label for="username">아이디</label>
          <input type="text" id="username" name="username"  required>
          <button type="button" id="check-username-btn" class="btn">중복확인</button>
        </div>
        <div class="input-field">
          <label for="password">비밀번호</label>
          <input type="password" id="password" name="password"  required>
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
          <button type="button" id="search-address-btn" class="search-address-btn">주소 검색</button>
        </div>
        <div class="input-field">
          <label for="phone">전화번호</label>
          <input type="text" id="phone" name="phone" required>
        </div>
        <div class="input-field">
          <label for="gender">성별</label>
          <select id="gender" name="gender">
            <option value="male">남성</option>
            <option value="female">여성</option>
            <option value="other">기타</option>
          </select>
        </div>
        <div class="btn-container">
          <input type="submit" value="등록" class="btn">
        </div>
      </form>
    </div>
  </div>
  <script>
  var passwordInput = document.getElementById('password');
  var confirmPasswordInput = document.getElementById('confirm-password');
  var passwordMismatchMessage = document.querySelector('.password-mismatch-message');
  var passwordMatchMessage = document.querySelector('.password-match-message');
  var passwordRequirements = document.querySelector('.password-requirements');

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
    
    <%-- function save(){
		<%
		
		String email = request.getParameter("username");
		String email_d=request.getParameter("email_domain");
		String email_di=request.getParameter("email_domain_input");
		String remail = "";
		if(email_d != null && email_d.equals("직접입력")){
			remail = email+"@"+email_di;
		}else{
			remail = email+"@"+email_d;
		}
		Connection conn = null;
		PreparedStatement pstmt = null;
		String url = "jdbc:mysql://13.209.55.246/project?characterEncoding=UTF-8&serverTimezone=UTC";
		String id = "projectuser";
		String pw = "projectuser";
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,id,pw);
		
		String sql = "insert into users(uid, pwd, name, email, phone, address, gender, updated_at, deleted_at)"
				+"values(?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("username"));
		pstmt.setString(2, request.getParameter("username"));
		pstmt.setString(3, request.getParameter("name"));
		pstmt.setString(4, remail);
		pstmt.setString(5, request.getParameter("phone"));
		pstmt.setString(6, request.getParameter("address"));
		pstmt.setString(7, request.getParameter("gender"));
		pstmt.setDate(10, null);
		pstmt.setDate(11, null);
			
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		response.sendRedirect("main.jsp");
		%>  		
  	} --%>
   </script>
</body>
</html>

