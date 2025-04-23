<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>찾아방 매물 삭제 완료</title>
			<style>
		@charset "UTF-8";
		body {
			margin: 0;
			background-color: #FFF9E9;
			font-family: Arial, sans-serif;
		}

		.delete-container {
			text-align: center;
			padding: 100px 20px;
			background-color: #fafaf8;
			margin-top: 100px;
			width: 800px;
			margin-left: auto;
			margin-right: auto;
			border-radius: 25px;
			box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
		}

		.delete-container h1 {
			margin-bottom: 40px;
		}

		.link-button {
			display: inline-block;
			margin: 10px;
			padding: 15px 30px;
			text-decoration: none;
			color: white;
			background-color: #FF804A;
			border-radius: 20px;
			transition: background-color 0.3s ease;
		}

		.link-button:hover {
			background-color: #FF7337;
		}
	</style>
</head>
<body>
	<div class="delete-container">
		<h1>삭제가 완료되었습니다</h1>
		<a class="link-button" href="/">홈으로 돌아가기</a>
		<a class="link-button" href="/chazabang/list">찾아방으로 돌아가기</a>
	</div>
</body>
</html>