<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디 찾기 결과</title>
	<link rel="stylesheet" href="../resources/css/member/foundId.css">
</head>
<body>
	<div class="container">
		<h2>아이디 찾기 결과</h2>
		<c:if test="${not empty member}">
			<p>회원님의 아이디는 <strong>${member.userId}</strong> 입니다.</p> 
		</c:if>
		<c:if test="${empty member}">
			<p>입력하신 정보와 일치하는 아이디가 없습니다.</p>
		</c:if>
		
		<a href="/member/login" class="btn">로그인하기</a>
		<a href="/member/resetPw" class="btn">비밀번호 재설정</a>
	</div>
</body>
</html>