<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   	<link rel="stylesheet" href="../resources/css/reset.css">
	<link rel="stylesheet" href="../resources/css/include/header.css">
	<link rel="stylesheet" href="../resources/css/include/footer.css">
	<link rel="stylesheet" href="../resources/css/chat/chat.css">
    <title>채팅</title>
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
	    <main>
	        <div class="title">
	            <h1>${receiverName } 님과의 채팅</h1>
	            <h2><i class="fa-light fa-paper-plane"></i></h2>
	        </div>
	        <div class="chat-content">
	        	<c:forEach var="chat" items="${cList }">
	        		<c:if test="${chat.writerId eq writerId}">
	        			<div class="my-msg">
	        				<div class="me">나</div>
	        				<div class="my-msg-detail">${chat.chatContent }</div>
	        			</div>
	        		</c:if>
	        		<c:if test="${chat.writerId ne writerId}">
	        			<div class="not-my-msg">
	        				<div class="receiver-name">${receiverName }</div>
	        				<div class="receive-msg">${chat.chatContent }</div>
	        			</div>
	        		</c:if>
	        	</c:forEach>
	        </div>
        	<form action="/chat/send" method="post" enctype="multipart/form-data">
        		<div class="message">
				    <input type="hidden" value="${writerId}" name="writerId">
				    <input type="hidden" value="${receiverId}" name="receiverId">
				    <input type="text" placeholder="메세지를 입력해주세요" name="chatContent" id="input" required="required">
				    <input type="file" id="fileInput" name="images" multiple>
				    <button type="button" id="fileBtn">+</button>
				    <button type="submit" id="submitbtn">
				        전송
				    </button>     
				</div>
        	</form>
	        <div class="btn">
	            <button onClick="location.href='/'">채팅방 나가기</button>
	        </div>
	    </main>
	    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
	<script>
	    // 페이지 로드 시 스크롤을 가장 아래로 이동
	    window.onload = function() {
	        scrollToBottom();
	    };
	
	    // 스크롤을 가장 아래로 내리기 위한 함수
	    function scrollToBottom() {
	        const chatContent = document.querySelector('.chat-content');
	        chatContent.scrollTop = chatContent.scrollHeight;
	    }
	
	    // 메시지를 전송한 후 자동으로 스크롤을 맨 아래로 내리기
	    function sendMessage() {
	        const messageContent = document.querySelector("#input").value;
	        const formData = new FormData();
	        formData.append("chatContent", messageContent);
	        
	        // 메시지 전송 (AJAX)
	        fetch("/chat/send", {
	            method: "POST",
	            body: formData
	        })
	        .then(response => response.json())
	        .then(data => {
	            scrollToBottom();
	        })
	        .catch(error => console.error("Error:", error));
	    }
	
	    function updateChatContent(newMessage) {
	        const chatContent = document.querySelector('.chat-content');
	        const messageDiv = document.createElement('div');
	        messageDiv.classList.add('chat-message');
	        messageDiv.innerHTML = `<p>${newMessage}</p>`;  
	
	        chatContent.appendChild(messageDiv);
	
	        scrollToBottom();
	    }
	
	    let isScrolling = false;
	
	    document.querySelector('.chat-content').addEventListener('scroll', function() {
	        const chatContent = document.querySelector('.chat-content');
	        
	        if (chatContent.scrollTop + chatContent.clientHeight < chatContent.scrollHeight - 10) {
	            isScrolling = true; 
	        } else {
	            isScrolling = false; 
	        }
	    });
	
	    function handleNewMessage(newMessage) {
	        if (!isScrolling) {
	            updateChatContent(newMessage); 
	        }
	    }
	
	    // 1초마다 채팅 목록 가져오기
	    setInterval(fetchChatMessages, 1000);
	
	    function fetchChatMessages() {
	        fetch("/chat/chat?writerId=${writerId}&receiverId=${receiverId}")
	            .then(response => response.json())
	            .then(data => {
	                const chatContent = document.querySelector('.chat-content');
	                
	                // 새로운 메시지가 있을 때만 추가
	                data.forEach(chat => {
	                    // 기존에 있는 메시지가 아닌 새로운 메시지만 추가
	                    if (!document.querySelector(`.message-${chat.chatNo}`)) {
	                        const messageDiv = document.createElement('div');
	                        messageDiv.classList.add(chat.writerId === '${writerId}' ? 'my-msg' : 'not-my-msg');
	                        messageDiv.classList.add(`message-${chat.chatNo}`);
	
	                        if (chat.writerId === '${writerId}') {
	                            messageDiv.innerHTML = `
	                                <div class="me">나</div>
	                                <div class="my-msg-detail">${chat.chatContent}</div>`;
	                        } else {
	                            messageDiv.innerHTML = `
	                                <div class="receiver-name">${receiverName}</div>
	                                <div class="receive-msg">${chat.chatContent}</div>`;
	                        }
	                        chatContent.appendChild(messageDiv);
	                    }
	                });
	
	                scrollToBottom();  // 스크롤 맨 아래로 이동
	            })
	            .catch(error => console.error("Error:", error));
	    }
	</script>

	
</body>
</html>