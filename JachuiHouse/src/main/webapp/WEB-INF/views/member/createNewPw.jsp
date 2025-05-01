<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 재설정</title>
	<link rel="stylesheet" href="../resources/css/member/createNewPw.css">
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
		        <h2>비밀번호 재설정 하기</h2>
		        <h3>${error }</h3>
	        <div id="msgTag" style="color: red;"></div>
			</div>
		</div>
        
        <form action="/member/createNewPw" method="post">
        	<input type="hidden" name="userId" value="${userId }">
	        <div class="form-group">
	            <label for="userPwCheck">새 비밀번호: </label>
	                <input type="password" name="userPwCheck" id="userPwCheck" placeholder="새비밀번호를 입력해주세요." class="form-control" required>
        	</div>
        	
        	<div class="form-group">
	            <label for="userPwCheck2">새 비밀번호 확인: </label>
	                <input type="password" name="userPwCheck2" id="userPwCheck2" placeholder="다시 한 번 입력해주세요." class="form-control" required>
        	</div>
        	
        	<button type="submit" class="signUpBtn">비밀번호 변경하기</button>
        </form>
    </div>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script type="text/javascript">
		// 비밀번호 유효성 검사
	    const signUpBtn = document.querySelector(".signUpBtn");
     	signUpBtn.addEventListener("click", function (event) {
	     	const userPwCheck = document.querySelector("#userPwCheck");
	     	const userPwCheck2 = document.querySelector("#userPwCheck2");
	    	
	     	const msgTag = document.querySelector("#msgTag"); // 오류 메시지 출력용
	    	
	    	const userPwCheckExp = /^[a-zA-Z0-9]{8,20}$/;
	    	const userPwCheck2Exp = /^[a-zA-Z0-9]{8,20}$/;
	    	
	    	if(!userPwCheckExp.test(userPw.value.trim())){
				//msgTag.innerText = "비밀번호는 영어소문자,대문자,숫자만 입력 가능해야 하고 8~20자리여야 합니다"
				event.preventDefault();
				showMessage("비밀번호는 영어소문자,대문자,숫자만 입력 가능해야 하고 8~20자리여야 합니다.");
	           	return false;
			}
	        
	        if(userPwCheckExp.value.trim() !== userPwCheck2.value.trim()){ //.value는 input 태그에 붙이는 것이다. userPwCheck는 값만 가져옴. Expression 사용X
				//msgTag.innerText = "같은 값을 입력해주세요."
				event.preventDefault();
				showMessage("새 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
	           	return false;
			}
        
    });
    // SweetAlert2 
    document.querySelector("#success").addEventListener("click", function() {
    	new swal(
 	       'Success',
 	       'You clicked the <b style="color:green;">Success</b> button!',
 	       'error'
	    )
    	
    // 비밀번호 변경 성공 시 SweetAlert2 표시
    window.onload = function() {
    		<c:if test="${not empty success}">
    			Swal.fire({
    				title: '성공',
    				text: '비밀번호가 성공적으로 변경되었습니다!',
    				icon: 'success',
    				confirmButtonText: '확인'
    			}).then((result) => {
    				if(result.isConfirmed) {
    					window.location.href = '/member/login' // 성공 후 로그인 페이지로 이동
    				}
    			});
    		</c:if>
	    };
	</script>
</body>
</html>