<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 재설정</title>
	<link rel="stylesheet" href="../resources/css/member/resetPw.css">
</head>
<body>
    <div class="container">
        <h2>비밀번호 재설정 하기</h2>
        <form role="form" action="/member/createNewPw" method="post">
        	<div class="form-group">
	            <label for="userPw">비밀번호 재설정</label>
	                <input type="password" name="userPw" placeholder="새비밀번호를 입력해주세요." class="form-control" required>
        	</div>
        	
	        <div class="form-group">
	            <label for="userPwCheck">비밀번호 확인</label>
	                <input type="password" name="userPwCheck" placeholder="다시 한 번 입력해주세요." class="form-control" required>
        	</div>
        	<button type="submit">변경하기</button>
        </form>
    </div>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script type="text/javascript">
	 const signUpBtn = document.querySelector(".signUpBtn");
     signUpBtn.addEventListener("click", function (event) {
     	const userPw = document.querySelector("#userPw");
     	const userPwCheck = document.querySelector("#userPwCheck");
    	const msgTag = document.querySelector("#msgTag"); // 오류 메시지 출력용
    	
    	const userPwExp = /[a-zA-Z0-9]{8,20}/;
    	const userPwCheckExp = /[a-zA-Z0-9]{8,20}$/;
    	
    	if(!userPwExp.test(userPw.value.trim())){
			//msgTag.innerText = "비밀번호는 영어소문자,대문자,숫자만 입력 가능해야 하고 8~20자리여야 합니다"
			event.preventDefault();
			const msg = "비밀번호는 영어소문자,대문자,숫자만 입력 가능해야 하고 8~20자리여야 합니다."
       		showMessage(msg);
           	return false;
		}
        
        if(userPwCheck.value.trim() !== userPw.value.trim()){ //.value는 input 태그에 붙이는 것이다. userPwCheck는 값만 가져옴. Expression 사용X
			//msgTag.innerText = "같은 값을 입력해주세요."
			event.preventDefault();
			const msg = "같은 값을 입력해주세요."
       		showMessage(msg);
           	return false;
		}
        
    })
    // SweetAlert2 
    document.querySelector("#success").addEventListener("click", function() {
    	new swal(
 	       'Success',
 	       'You clicked the <b style="color:green;">Success</b> button!',
 	       'error'
	    )
    });
</body>
</html>