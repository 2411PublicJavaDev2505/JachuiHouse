<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>에러메시지</title>
		<link rel="stylesheet" href="../resources/css/member/error.css">
	</head>
	<body>
		<div class="container">
			<main class="main-container">
				<img src="../resources/images/error1.gif" alt="error-image" class="error-image">
				<div class="message">
					<h1>에러발생</h1>
					<h2>${errorMsg}</h2>
					<p>요청하신 페이지를 찾을 수 없습니다.</p>
				</div>
				
				<div class="navi-container">
					<a href="/" class="btn-navi">홈으로</a> 
					<button type="button" onclick="history.back();" class="btn-navi">이전페이지</button>
					<a href="/member/login" class="btn-navi">로그인</a>
				</div>
			</main>
		</div>
		<script >
			// 에러 발생 시 대체 이미지로 변경
			function displayErrorMessage() {
				const errorImage = documet.getElementById('error-image');
				errorImage.src = '../resources/css/images/error1.gif';
			}
			
			// 에러 이벤트 발생 시 호출될 함수 
			window.addEventListener('error', displayErrorMessage);
			
		</script>
	</body>
</html>