<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
</head>
<body>
	<div>비밀번호 찾기 결과</div>
	<p>찾은 비밀번호는 다음과 같습니다.
	<p th:if="${password != null}">
		찾은 비밀번호는 <span style="color: #dc3545; font-weight: bold" th:text="${password}"></span> 입니다.
	</p>
	<p th:if="${password == null}" th:text="'일치하는 비밀번호가 없습니다.'" style="color: #dc3545; font-weight: bold"></p>
	<button class="w-100 btn btn-secondary btn-lg" onclick="location.href='/member/resetPw'" th:onclick="|location.href='@{/resetPw}'|" type="button">비밀번호 찾기</button>
	<button class="w-100 btn btn-secondary btn-lg" onclick="location.href='/'" th:onclick="|location.href='@{/}'|" type="button">메인페이지</button>
	<button class="btn" onclick="location.href='/member/login'" th:onclick="|location.href='@{/login}'|" type="button">로그인</button>
</body>
</html>