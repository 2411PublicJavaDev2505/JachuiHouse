<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자취하우스 마이페이지</title>
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
					    <c:if test="${empty cList}">
					        <p>채팅내역이 없습니다.</p>
					    </c:if>
					
<%-- 					    <c:forEach var="chatRoom" items="${cList}"> --%>
<%-- 					        <c:set var="otherUserId" value="${chatRoom.user1Id == sessionScope.userId ? chatRoom.user2Id : chatRoom.user1Id}" /> --%>
					
<%-- 					        <a href="${pageContext.request.contextPath}/chat/chat?writerId=${sessionScope.userId}&receiverId=${otherUserId}"> --%>
<%-- 					            <p>${otherUserId}님과의 대화</p> --%>
<!-- 					        </a> -->
<%-- 					    </c:forEach> --%>
					</div>
	                <div class="my-notice">
	                    <h3>내가 쓴 글</h3>
	                </div>
	               <div class="show-more-wrap-post">
					   <button id="showMorePostBtn" onclick="togglePostList()">더보기</button>
					</div>
					<div class="notice-content" id="postList">
					   <c:if test="${empty pList}">
					      <p>등록된 게시글이 없습니다.</p>
					   </c:if>
					   <c:forEach var="post" items="${pList}" varStatus="status">
					       <c:choose>
					           <c:when test="${status.index < 3}">
						           	<div class="post-item">
						               <a href="/post/detail?postNo=${post.postNo}">
						                   <p>${post.postTitle}</p>
					               		</a>
						           	</div>
					           </c:when>
					           <c:otherwise>
					               <div class="post-item hidden">
					                   <a href="/post/detail?postNo=${post.postNo}">
					                       <p>${post.postTitle}</p>
					                   </a>
					               </div>
					           </c:otherwise>
					       </c:choose>
					   </c:forEach>
					</div>
	                <div class="thing">
	                    <h3>내가 올린 물건</h3>
	                </div>
						<div class="show-more-wrap-trade">
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
	    function togglePostList() {
	        const allPostItems = document.querySelectorAll('.post-item');
	        const button = document.getElementById("showMorePostBtn");
	        if (button.innerText === "더보기") {
	            allPostItems.forEach(item => item.classList.remove('hidden'));
	            button.innerText = "간략히 보기";
	        } else {
	        	allPostItems.forEach((item, index) => {
	                if (index >= 3) {
	                    item.classList.add('hidden');
	                } else {
	                    item.classList.remove('hidden'); // 처음 3개는 항상 보여야 함
	                }
	            });
	            button.innerText = "더보기";
	        }
	    }
	</script>	
</body>
</html>