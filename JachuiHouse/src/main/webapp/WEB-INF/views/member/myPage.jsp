<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	                   <c:forEach var="post" items="${pList}">
	                   		<a href="/post/detail?postNo=${post.postNo }">
						    <p>${post.postTitle}</p>
	                   		</a>
						</c:forEach>
	                </div>
	                <div class="thing">
	                    <h3>내가 올린 물건</h3>
	                </div>
						<div class="show-more-wrap">
						    <button id="showMoreBtn" onclick="toggleTradeList()">더보기</button>
						</div>
	                <div class="thing-content" id="tradeList">
		                <c:if test="${empty tList}">
						      <p>등록된 거래글이 없습니다.</p>
						</c:if>
						<c:forEach var="trade" items="${tList}" varStatus="status">
    						<c:if test="${trade.delYn != 'Y'}">
								<div class="trade-item <c:if test='${status.index >= 6}'>hidden</c:if>">					            
									<a href="/trade/detail/${trade.tradeNo}">
						                <img src="/resources/bUploadFiles/${trade.tradeFileRename}" alt="상품 이미지" class="trade-thumb">
						                <p class="trade-title">${trade.tradeTitle}</p>
						            </a>
						        </div>
							</c:if>
						</c:forEach>
	                </div>
	            </div>
	        </main>
	        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
	<script type="text/javascript">
		function toggleTradeList() {
		    const allItems = document.querySelectorAll('.trade-item');
		    const button = document.getElementById("showMoreBtn");
	
		    if (button.innerText === "더보기") {
		        // 전부 보이게
		        allItems.forEach(item => item.classList.remove('hidden'));
		        button.innerText = "간략히 보기";
		    } else {
		        // 6개만 보이게
		        allItems.forEach((item, index) => {
		            if (index >= 6) {
		                item.classList.add('hidden');
		            }
		        });
		        button.innerText = "더보기";
		    }
		}
	</script>	
</body>
</html>