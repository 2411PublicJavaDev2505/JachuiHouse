<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자취스크립트</title>
<link rel="stylesheet" href="../resources/css/include/header.css">
<link rel="stylesheet" href="../resources/css/member/update.css">
<link rel="stylesheet" href="../resources/css/include/footer.css">
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<main>
		<form action="/member/update" method="post" enctype="multipart/form-data" class="form-main" onsubmit="return validateForm()">		        
		        <div class="profile-preview">
		            <label for="profileImageInput">
		                <img id="profileImage" src="/resources/image/${member.profileImage}" alt="사진을 선택해주세요">
		            </label>
		            <input type="file" name="profileImage" id="profileImageInput" accept="image/*" style="display:none;" onchange="previewImage(event)">
		            <p>이미지를 눌러 변경하세요</p>
		        </div>
		
		        <div class="main-container">
		            <div class="main-header">
		                <h1>회원 정보 수정</h1>
		            </div>
		            <div class="main-contents">
		                <label>ID</label>
		                <input name="userId" value="${member.userId}" readonly>
		
		                <label>비밀번호</label>
		                <input type="password" name="userPw" value="${member.userPw}">
		
		                <label>이름</label>
		                <input type="text" name="userName" value="${member.userName}">
		
		                <label>전화번호</label>
		                <input type="text" name="userPhone" value="${member.userPhone}">
		
		                <label>주소</label>
		                <input type="text" name="userAddress" value="${member.userAddress}">
		
		                <label>상호명</label>
		                <input type="text" name="realtorName" value="${member.realtorName}">
		            </div>
		
		            <div class="button">
		                <div class="cancelBtn">
		                    <button type="button" onclick="location.href='myPage'">취소</button>
		                </div>
		                <div class="updateBtn">
		                    <button type="submit" onclick="updateConfirm(event)">수정</button>
		                </div>
		            </div>
		        </div>
		    </form>
		</main>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
	<script type="text/javascript">
		function previewImage(event) {
	        const reader = new FileReader();
	        reader.onload = e => document.getElementById('profileImage').src = e.target.result;
	        reader.readAsDataURL(event.target.files[0]);
	    }
		function previewImage(event) {
	        const reader = new FileReader();
	        reader.onload = e => document.getElementById('profileImage').src = e.target.result;
	        reader.readAsDataURL(event.target.files[0]);
	    }

	    function validateForm() {
	        const password = document.querySelector('input[name="userPw"]').value.trim();
	        const phone = document.querySelector('input[name="userPhone"]').value.trim();

	        // 비밀번호 8자 이상 체크
	        if (password.length < 8) {
	            alert('비밀번호는 8자 이상이어야 합니다.');
	            return false;
	        }

	        // 전화번호 010으로 시작 + 11자리 체크
	        const phoneRegex = /^010\d{8}$/;
	        if (!phoneRegex.test(phone)) {
	            alert('전화번호는 010으로 시작하고 총 11자리여야 합니다.');
	            return false;
	        }
	        return true;
	    }
	    function updateConfirm(event) {
	        event.preventDefault(); 	
	        const isConfirmed = confirm("회원정보를 수정하시겠습니까?");
	        if (isConfirmed) {
	            document.querySelector('form').submit();
	        }
	    }
	</script>
</body>
</html>