<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디 찾기 결과</title>
	<link rel="stylesheet" href="../resources/css/foundId.css">
</head>
<body>
	<div class="container">
		<h2>고객님의 정보와 일치하는 아이디 목록입니다.</h2>
		
		<c:choose>  <!-- 비교문 -->
			<c:when test="${not empty matchedList}"> <!-- true 일때 -->
				<table>
					<tr>
						<th>아이디</th>
						<th>가입일자</th>
					</tr>
					<!-- 반복문 넣어줌 -->
					<c:forEach var="member" items="${matchedList}">
						<tr>
							<td>${member.userId}</td>
							<td><fmt:formatDate value="{member.joinDate}" pattern="yyyy-MM-dd" /></td>  <!-- fmt:formatDate 이게 없으면 동작하지 않는다. -->
						</tr> 
					</c:forEach>
				</table>
			</c:when>
			
			<c:otherwise> <!-- false 일때 -->
				<p>일지하는 정보가 없습니다.</p>
			</c:otherwise>
		</c:choose>
		
		<a href="/member/login" class="btn">로그인하기</a>
		<a href="/member/resetPw" class="btn">비밀번호 재설정</a>
	</div>
</body>
</html>