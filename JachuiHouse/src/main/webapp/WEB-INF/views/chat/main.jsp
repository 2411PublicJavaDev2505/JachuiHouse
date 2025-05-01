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
        <c:if test="${empty sessionScope.userId}">
		    <script>
		        alert("로그인이 필요합니다.");
		        location.href = "/member/login";
		    </script>
		</c:if>
            <div class="title">
                <h1>${receiverName} 님과의 채팅</h1>
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

            <div class="btn">
                <button onclick="location.href='/'">채팅방 나가기</button>
            </div>
        </main>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>

    <!-- 스크립트 -->
    <script>
		document.addEventListener("DOMContentLoaded", function () {
		    const form = document.getElementById("chatForm");
		    const input = document.getElementById("input");
		    const chatContent = document.getElementById("chatContent");
		
		    const writerId = "${writerId}";
		    const receiverId = "${receiverId}";
		    const receiverName = "${receiverName}";
		    const chatRoomNo = "${chatRoomNo}";
		    let lastChatNo = ${lastChatNo}; // 서버에서 전달된 마지막 채팅번호
		
		    // 페이지 처음 로딩 시, 가장 아래로 이동
		    scrollToBottom();
		
		    // 메시지 전송 (댓글 작성과 유사)
		    form.addEventListener("submit", function (e) {
		        e.preventDefault();
		
		        const message = input.value.trim();
		        if (!message) return;
		
		        const payload = {
		            writerId,
		            receiverId,
		            message,
		            chatRoomNo: parseInt(chatRoomNo)
		        };
		
		        fetch("/chat/send", {
		            method: "POST",
		            headers: { "Content-Type": "application/json" },
		            body: JSON.stringify(payload)
		        })
		        .then(res => res.json())
		        .then(data => {
		            if (data.status === "success") {
		                input.value = "";
		                fetchNewMessages(); // 즉시 반영
		            } else {
		                alert("전송 실패: " + data.message);
		            }
		        })
		        .catch(err => console.error("전송 오류:", err));
		    });
		
		    // 새로운 메시지를 주기적으로 받아오기
		    function fetchNewMessages() {
		        fetch(`/chat/fetch?writerId=${writerId}&receiverId=${receiverId}&lastChatNo=${lastChatNo}`)
		            .then(res => res.json())
		            .then(messages => {
		                messages.forEach(chat => {
		                    const msgBox = document.createElement("div");
		                    msgBox.className = (chat.writerId === writerId ? "my-msg" : "not-my-msg") + ` message-${chat.chatNo}`;
		                    msgBox.dataset.chatNo = chat.chatNo;
		
		                    if (chat.writerId === writerId) {
		                        msgBox.innerHTML = `
		                            <div class="me">나</div>
		                            <div class="my-msg-detail">${chat.message}</div>
		                        `;
		                    } else {
		                        msgBox.innerHTML = `
		                            <div class="receiver-name">${receiverName}</div>
		                            <div class="receive-msg">${chat.message}</div>
		                        `;
		                    }
		
		                    chatContent.appendChild(msgBox);
		                    lastChatNo = chat.chatNo;
		                });
		
		                if (messages.length > 0) {
		                    scrollToBottom(); // 새 메시지 있으면 스크롤 아래로
		                }
		            })
		            .catch(err => console.error("수신 오류:", err));
		    }
		
		    // 자동 갱신 (2초마다 새로운 메시지 확인)
		    setInterval(fetchNewMessages, 2000);
		
		    // 스크롤 아래로 이동 함수
		    function scrollToBottom() {
		        chatContent.scrollTop = chatContent.scrollHeight;
		    }
		});
	</script>
</body>
</html>