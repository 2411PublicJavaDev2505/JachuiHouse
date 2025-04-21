<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자취스크립트</title>
<link rel="stylesheet" href="../resources/css/include/header.css">
<link rel="stylesheet" href="../resources/css/member/myPage.css">
<link rel="stylesheet" href="../resources/css/include/footer.css">
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<main>
	         <div class="left-inform">
	                <div class="left-image">
		                    <img src="/resources/image/${member.profileImage}" alt="image" id="profileImage">	                			           
	                </div>
	                <div>
	                    <h3>${member.userId }</h3>
	                    <p>자취생 ${member.userName }입니다.</p>
	                </div>
	                <div class="updateBtn">
	                    <button onClick="location.href='update'">내 정보 수정</button>
	                </div>
	                <div class="my-inform">
	                    <p>${member.userAddress }</p>
	                    <p>${member.userPhone }</p>
	                    <p>${member.userEmail }</p>
	                </div>
	                <div class="dleteBtn">
	                    <button onClick="location.href='delete'">회원 탈퇴</button>
	                </div>
	                <div class="calculatorBtn">
	                    <button onClick="location.href='accountBook'">예산 계산기</button>
	                </div>
	            </div>
	            <div class="rigth-inform">
	                <div class="chat">
	                    <h3>내 채팅</h3>
	                </div>
	                <div class="chat-content">
	                    <p>최제우스 어디 사는 몇살? ㅎㅎ</p>
	                </div>
	                <div class="my-notice">
	                    <h3>내가 쓴 글</h3>
	                </div>
	                <div class="notice-content">
	                    <p>4/7(월) 저녁 8시에 술 한잔 하실분?</p>
	                    <p>이중 창 아닌 집 결로 안생기게 하는 꿀팁</p>
	                    <p>집에 날파리 안나오게 하는 방법 뭐있을까</p>
	                </div>
	                <div class="thing">
	                    <h3>내가 올린 물건</h3>
	                </div>
	                <div class="thing-content">
	                    <span><img src="" alt=""></span>
	                    <span><img src="" alt=""></span>
	                </div>
	            </div>
	        </main>
	        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>	
</body>
</html>