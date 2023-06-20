function check() {
  //변수에 담아주기
  
  var uid = document.getElementById("uid");
  var pwd = document.getElementById("passwd");
  var name = document.getElementById("name");
  var n1 = document.getElementById("n1");
  var phone2 = document.getElementById("phone2");
  var phone3 = document.getElementById("phone3");


  var regId =/^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
  	
 if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			   document.addForm.submit();
   }
 else{
	document.addForm.reset();
		   }
  if (uid.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
    alert("아이디를 입력하세요.");
    uid.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
  };
    if (n1.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
    alert("수량을 입력하세요.");
    uid.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
  };
  
    if (!regId.test(uid.value)) {
    alert("아이디는 문자로 시작해주세요.");
    uid.focus();
    return false;
  };

  if (pwd.value == "") {
    alert("비밀번호를 입력하세요.");
    pwd.focus();
    return false;
  };

  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
  var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

  if (!pwdCheck.test(pwd.value)) {
    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
    pwd.focus();
    return false;
  };


  var regname =/^[가-힣]*$/;
  
  if (name.value == "") {
    alert("이름을 입력하세요.");
    name.focus();
    return false;
  };
  
    if (!regname.test(name.value)) {
    alert("이름을 한글만 입력하세요.");
    name.focus();
    return false;
  };
  
  //phone
    if (phone2.value == "") {
    alert("전화번호를 입력하세요.");
    phone2.focus();
    return false;
  };
  
    if (phone3.value == "") {
    alert("전화번호를 입력하세요.");
    phone3.focus();
    return false;
  };
  



/* 
  var reg = /^[0-9]+/g; //숫자만 입력하는 정규식

  if (!reg.test(mobile.value)) {
    alert("전화번호는 숫자만 입력할 수 있습니다.");
    mobile.focus();
    return false;
  }*/



  //입력 값 전송
  join_form.submit(); //유효성 검사의 포인트   

}

