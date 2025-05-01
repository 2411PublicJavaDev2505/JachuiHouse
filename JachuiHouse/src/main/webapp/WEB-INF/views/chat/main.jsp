<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>채팅</title>
    <link rel="stylesheet" href="/resources/css/include/header.css">
    <link rel="stylesheet" href="/resources/css/include/footer.css">
    <link rel="stylesheet" href="/resources/css/chat/chat.css">
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/include/header.jsp" />
        <main>
            	<div class="chat-item-info">
				    <c:choose>
				        <c:when test="${itemName eq 'estate'}">
				        	<a href="/chazabang/detail/${item.estateNo }" class="item-box-link" data-type="${item.estateType}">
					            <div class="item-box">
					                <div class="item-details">
						                <div class="estate-style">
						                    <img src="${item.estateFileList[0].estateFilePath}" alt="이미지 준비중">
						                        <section class="estate-inf">
						                            <div class="estate-inf-header">
						                            <c:if test="${item.estateRentType eq 'charter'}">
													    <div class="estate-rent">전세 ${item.transformEstateDeposit}</div>
													</c:if>
													<c:if test="${item.estateRentType eq 'monthly'}">
													    <div class="estate-rent">월세 ${item.transformEstateDeposit}/${item.transformMonthlyRent}</div>
													</c:if>
						                            <span class="estate-type">
						                            	<c:if test="${item.estateType eq 'onetwo'}">
								                        	<span class="estate-type">원룸/투룸</span>
								                        </c:if>
								                        <c:if test="${item.estateType eq 'villa'}">
								                        	<span class="estate-type">주택/빌라</span>
								                        </c:if>
								                        <c:if test="${item.estateType eq 'apart'}">
								                        	<span class="estate-type">아파트</span>
								                        </c:if>
								                        <c:if test="${item.estateType eq 'officetel'}">
								                        	<span class="estate-type">오피스텔</span>
								                        </c:if>
						                            </span>
						                        </div>
						                        <span class="estate-floor-and-width">${item.estateFloor }층, ${item.estateWidth }㎡</span>
						                        <span class="estate-address">${item.estateAddress }</span>
						                    </section>
						                </div>
					                </div>
					            </div>
						   	</a>
				        </c:when>
				        <c:when test="${itemName eq 'trade'}">
					    	<a href="/trade/detail/${item.tradeNo}" class="item-box-link">
				            	<div class="item-box">
		                            <img src="${item.tradeFilepath}" alt="${item.tradeTitle}">
		                            <div class="trade-inf">
				                        <div class="product-title">${item.tradeTitle}</div>
				                        <div class="product-price">${item.tradePrice}원</div>
		                            </div>
					            </div>
		                    </a>
				        </c:when>
				    </c:choose>
				</div>
            <div class="title-with-exit">
                <h1>${receiverName} 님과의 채팅</h1>
            	<c:if test="${itemName eq 'estate'}">
            		<button class="exit-btn" onclick="location.href='/chazabang/detail/${itemNo}'">채팅방 나가기</button>
            	</c:if>
            	<c:if test="${itemName eq 'trade'}">
	                <button class="exit-btn" onclick="location.href='/${itemName }/detail/${itemNo}'">채팅방 나가기</button>
            	</c:if>
            </div>

            <!-- 채팅 메시지 출력 영역 -->
            <div class="chat-content" id="chatContent">
                <c:forEach var="chat" items="${chatList}">
                    <c:if test="${chat.writerId eq writerId}">
                        <div class="my-msg message-${chat.chatNo}" data-chat-no="${chat.chatNo}">
                            <div class="me">나</div>
                            <div class="my-msg-detail">${chat.message}</div>
                        </div>
                    </c:if>
                    <c:if test="${chat.writerId ne writerId}">
                        <div class="not-my-msg message-${chat.chatNo}" data-chat-no="${chat.chatNo}">
                            <div class="receiver-name">${receiverName}</div>
                            <div class="receive-msg">${chat.message}</div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>

            <!-- 메시지 전송 폼 -->
            <form id="chatForm">
                <div class="message">
                    <input type="hidden" name="writerId" value="${writerId}">
                    <input type="hidden" name="receiverId" value="${receiverId}">
                    <input type="text" name="message" id="input" placeholder="메시지를 입력하세요" required>
                    <button type="submit" id="submitBtn">전송</button>
                </div>
            </form>
        </main>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>

    <!-- 스크립트 -->
	<script>
		const writerId = '${writerId}';
		const receiverId = '${receiverId}';
		const receiverName = '${receiverName}';
		const chatRoomNo = '${chatRoomNo}';
		
		let lastChatNo = ${lastChatNo}; // 최초 렌더링된 마지막 메시지 번호
		
		// 이미 렌더링된 chatNo 저장용 Set
		const renderedChatNos = new Set();
		document.querySelectorAll('[data-chat-no]').forEach(el => {
		    const chatNo = parseInt(el.getAttribute('data-chat-no'));
		    renderedChatNos.add(chatNo);
		});
		
		const chatContent = document.getElementById('chatContent');
		
		// ✅ 첫 진입 시 스크롤 맨 아래로 이동
		window.onload = () => {
		    scrollToBottom();
		};
		
		// ✅ 메시지 전송 - DB 저장만, 화면에는 append 하지 않음
		document.getElementById('chatForm').addEventListener('submit', function (e) {
		    e.preventDefault();
		
		    const chatInput = document.getElementById('input');
		    const messageContent = chatInput.value.trim();
		    if (!messageContent) {
		        alert("메시지를 입력하세요!");
		        return;
		    }
		
		    const sendData = {
		        writerId,
		        receiverId,
		        message: messageContent,
		        chatRoomNo
		    };
		
		    fetch('/chat/send', {
		        method: 'POST',
		        headers: { 'Content-Type': 'application/json' },
		        body: JSON.stringify(sendData)
		    })
		    .then(res => res.json())
		    .then(data => {
		        if (data.success) {
		            chatInput.value = '';
		            // 메시지는 곧 fetch를 통해 렌더링됨
		        } else {
		            alert("메시지 전송 실패");
		        }
		    })
		    .catch(err => console.error("전송 에러:", err));
		});
		
		// ✅ 1초마다 새로운 메시지 fetch
		setInterval(fetchNewMessages, 1000);
		
		function fetchNewMessages() {
		    fetch(`/chat/fetch?chatRoomNo=${chatRoomNo}&lastChatNo=${lastChatNo}`)
		        .then(res => res.json())
		        .then(data => {
		            if (data.success && data.messages && data.messages.length > 0) {
		                data.messages.forEach(chat => {
		                    appendMessage(chat);
		                });
		                scrollToBottom();
		            }
		        })
		        .catch(err => console.error("fetch 에러:", err));
		}
		
		// ✅ 메시지 추가 함수 (중복 방지 포함)
		function appendMessage(chat) {
		    if (renderedChatNos.has(chat.chatNo)) {
		        return; // 이미 표시된 메시지면 무시
		    }
		
		    const div = document.createElement('div');
		    div.classList.add(chat.writerId === writerId ? 'my-msg' : 'not-my-msg');
		    div.classList.add(`message-${chat.chatNo}`);
		    div.setAttribute('data-chat-no', chat.chatNo);
		
		    if (chat.writerId === writerId) {
		        div.innerHTML = `
		            <div class="me">나</div>
		            <div class="my-msg-detail">`+chat.message+`</div>
		        `;
		    } else {
		        div.innerHTML = `
		            <div class="receiver-name">`+receiverName+`</div>
		            <div class="receive-msg">`+chat.message+`</div>
		        `;
		    }
		
		    chatContent.appendChild(div);
		    renderedChatNos.add(chat.chatNo);
		    lastChatNo = Math.max(lastChatNo, chat.chatNo);
		}
		
		// ✅ 스크롤 아래로 이동
		function scrollToBottom() {
		    chatContent.scrollTop = chatContent.scrollHeight;
		}
	</script>
</body>
</html>
