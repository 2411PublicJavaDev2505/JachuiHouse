<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/include/header.css">
<link rel="stylesheet" href="../resources/css/member/update.css">
<link rel="stylesheet" href="../resources/css/include/footer.css">
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<main>
			<form action="/realtor/update" method="post" enctype="multipart/form-data" class="form-main" onsubmit="return validateForm()">
	            <div class="profile-preview">
		            <label for="profileImageInput">
		                <img id="profileImage" src="/resources/image/${member.profileImage}" 
		                     alt="사진을 선택해주세요" style="width:200px; height:200px; border-radius:100%; cursor:pointer;">
		            </label>
		            <input type="file" name="profileImage" id="profileImageInput" accept="image/*" style="display:none;" onchange="previewImage(event)">
		            <p>위에 이미지를 눌러주세요.</p>
		        </div>
            <div class="main-container">
                <div class="main-header">
                    <h1>회원 정보 수정</h1>
                </div>
                <div class="main-contents">
                 <label>
                        ID
                    </label>
                        <input name="userId" value="${member.userId }" readonly>
                        <label >
                            비밀번호
                        </label> 
                        <input type="password" name="userPw" value="${member.userPw }">
                        <label for="">
                            이름
                        </label> 
                        <input type="text" name="userName" value="${member.userName }">
                        <label for="">
                            전화번호
                        </label> 
                        <input type="text" name="userPhone" value="${member.userPhone }">
                        <label for="">
                            주소
                        </label> 
                        <input type="text" name="userAddress" value="${member.userAddress }">
                        <label for="">
                            상호명
                        </label> 
                        <input type="text" name="realtorName" value="${member.realtorName }">
                   </div>
	                   <div class="button">
	                       <div class="cancelBtn">
	                           <button type="button" onClick="location.href='myPage'">취소</button>
	                        </div>
	                        <div class="updateBtn">
	                            <button type="submit">수정</button>
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
		<script type="text/javascript">
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

	        // 모든 조건 통과
	        return true;
	    }
	</script>

	</script>
</body>
</html>