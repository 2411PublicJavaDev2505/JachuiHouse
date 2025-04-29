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
        const writerId = '${writerId}';
        const receiverId = '${receiverId}';
        const receiverName = '${receiverName}';

        let lastChatNo = ${empty chatList ? 0 : chatList[chatList.size()-1].chatNo};

        let isScrolledToBottom = true;
        const chatContent = document.getElementById('chatContent');

        chatContent.addEventListener('scroll', function() {
            const scrollPosition = chatContent.scrollTop + chatContent.clientHeight;
            const scrollHeight = chatContent.scrollHeight;
            isScrolledToBottom = (scrollPosition === scrollHeight);
        });

        // 메시지 전송
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
                message: messageContent
            };

            fetch('/chat/send', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(sendData)
            })
            .then(res => res.json())
            .then(data => {
                if (data.status === "success") {
                    chatInput.value = '';
                    appendMyMessage(sendData.message);
                    if (isScrolledToBottom) {
                        scrollToBottom();
                    }
                } else {
                    alert("메시지 전송 실패");
                }
            })
            .catch(error => console.error("전송 에러:", error));
        });

        setInterval(fetchChatMessages, 1000);

        function fetchChatMessages() {
            fetch(`/chat/fetch?writerId=${writerId}&receiverId=${receiverId}&lastChatNo=${lastChatNo}`)
            .then(res => res.json())
            .then(data => {
                data.forEach(chat => {
                    appendNewMessage(chat);
                });
            })
            .catch(error => console.error("fetch 에러:", error));
        }

        function appendNewMessage(chat) {
            const div = document.createElement('div');
            if (chat.writerId == writerId) {
                div.classList.add('my-msg');
                div.innerHTML = `
                    <div class="me">나</div>
                    <div class="my-msg-detail">${chat.message || '(내용 없음)'}</div>
                `;
            } else {
                div.classList.add('not-my-msg');
                div.innerHTML = `
                    <div class="receiver-name">${receiverName}</div>
                    <div class="receive-msg">${chat.message || '(내용 없음)'}</div>
                `;
            }
            chatContent.appendChild(div);
            lastChatNo = chat.chatNo;

            if (isScrolledToBottom) {
                scrollToBottom();
            }
        }

        function appendMyMessage(message) {
            const div = document.createElement('div');
            div.classList.add('my-msg');
            div.innerHTML = `
                <div class="me">나</div>
                <div class="my-msg-detail">${message}</div>
            `;
            chatContent.appendChild(div);
        }

        function scrollToBottom() {
            chatContent.scrollTop = chatContent.scrollHeight;
        }
    </script>
</body>
</html>