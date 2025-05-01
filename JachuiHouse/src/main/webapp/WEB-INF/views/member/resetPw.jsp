<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 찾기</title>
	<link rel="stylesheet" href="../resources/css/member/resetPw.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
</head>
<body>
    <div class="container">
    	<div class="logo-container">
			<div class="login-image">
				<a href="http://localhost:7777">
					<img src="../resources/image/loginEnter.png" alt="로그인 이미지">
				</a>
			</div>
			<div>
        		<h2>비밀번호 재설정</h2>
        	<div id="msgTag" style="color: red;"></div>
			</div>
		</div>
				
        <form role="form" action="/member/resetPw" method="post">
        	<div class="form-group">
	            <label for="userId">아이디: </label>
	                <input type="text" name="userId" id="userId" placeholder="아이디를 입력해주세요." class="form-control" required>
        	</div>
        	
	        <div class="form-group">
	            <label for="userEmail">이메일: </label>
	                <input type="email" name="userEmail" id="userEmail"  placeholder="가입 시 기재한 이메일 주소를 입력해주세요." class="form-control" required>
        	</div>
        	<button type="button" class="signUpBtn">변경하기</button>
        </form>
    </div>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script>
		// SweetAlert
	    function showMessage(msg) {
	    	Swal.fire({            		
	     		title: '다시 한 번 확인해주세요.',
	     		text: msg,
	     		icon: 'error',
	   		});
	    }
		
		const signUpBtn = document.querySelector(".signUpBtn");
	    signUpBtn.addEventListener("click", function (event) {
	    	const userId = document.querySelector("#userId");
	    	const userEmail = document.querySelector("#userEmail");
	    	const msgTag = document.querySelector("#msgTag"); // 오류 메시지 출력용
	    	
	    	const userIdExp = /^[a-z][a-z0-9]{3,11}$/;
	    	const userEmailExp = /^[a-zA-Z0-9._%+-]{4,12}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	    	
	    	if(!userIdExp.test(userId.value.trim())){
	        	event.preventDefault();
	        	const msg = "아이디는 소문자로 시작하고, 영어 소문자와 숫자로 4~12자리여야합니다."
	    		showMessage(msg);
	        	return false;
	        }
	        
	        if(!userEmailExp.test(userEmail.value.trim())){
				//msgTag.innerText = "이메일 형식이 올바르지 않습니다."
				event.preventDefault();
				const msg = "이메일 형식이 올바르지 않습니다."
	       		showMessage(msg);
	           	return false;
			}
	    });
    </script>
</body>
</html>