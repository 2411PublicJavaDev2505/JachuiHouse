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
               <form action="/member/update" method="post"  enctype="multipart/form-data" class="form-main">
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
                    </label> <br>
                        <input name="userId" value="${member.userId }" readonly> <br>
                        <label >
                            비밀번호
                        </label> <br>
                        <input type="password" name="userPw" value="${member.userPw }"> <br>
                        <label for="">
                            이름
                        </label> <br>
                        <input type="text" name="userName" value="${member.userName }"> <br>
                        <label for="">
                            전화번호
                        </label> <br>
                        <input type="text" name="userPhone" value="${member.userPhone }"> <br>
                        <label for="">
                            주소
                        </label> <br>
                        <input type="text" name="userAddress" value="${member.userAddress }"> <br>
                        <label for="">
                            상호명
                        </label> <br>
                        <input type="text" name="realtorName" value="${member.realtorName }"> <br>
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
	</script>
</body>
</html>