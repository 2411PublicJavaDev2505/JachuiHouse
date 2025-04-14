
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>에러메시지</title>
	</head>
	<body>
		<h1>에러메시지</h1>
		<h2>${errorMsg}</h2>
		<a href="/">홈으로</a> 
		<button type="button" onclick="history.back();">이전페이지</button>
		<a href="/member/login">로그인</a>
		
		<script >
			
		</script>
	</body>
</html>