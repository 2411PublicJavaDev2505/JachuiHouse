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
	    document.getElementById('fileBtn').addEventListener('click', function() {
	        document.getElementById('fileInput').click();
	    });
	    
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
	        .then(response => response.json())  // 서버의 응답 처리
	        .then(data => {
	            // 서버에서 메시지가 성공적으로 처리된 후 새 메시지를 화면에 추가
	            // 화면에 메시지 추가 (새 메시지 추가하는 부분은 생략)
	            
	            // 메시지가 전송되면 자동 스크롤
	            scrollToBottom();
	        })
	        .catch(error => console.error("Error:", error));
	    }

	    // 새로운 메시지가 올 때마다 자동으로 스크롤 내리기
	    function updateChatContent(newMessage) {
	        const chatContent = document.querySelector('.chat-content');
	        const messageDiv = document.createElement('div');
	        messageDiv.classList.add('chat-message');
	        messageDiv.innerHTML = `<p>${newMessage}</p>`;  // 새 메시지 추가

	        chatContent.appendChild(messageDiv);

	        // 새 메시지가 추가된 후 스크롤을 맨 아래로 내리기
	        scrollToBottom();
	    }

	    // 사용자가 스크롤을 올릴 때, 스크롤을 유지하려면 아래와 같은 코드로 처리
	    let isScrolling = false;  // 사용자가 스크롤을 올렸는지 여부 확인

	    document.querySelector('.chat-content').addEventListener('scroll', function() {
	        const chatContent = document.querySelector('.chat-content');
	        
	        // 스크롤이 맨 아래에 있지 않으면, 새 메시지가 왔을 때 스크롤을 자동으로 내리지 않도록 설정
	        if (chatContent.scrollTop + chatContent.clientHeight < chatContent.scrollHeight - 10) {
	            isScrolling = true;  // 사용자가 스크롤을 올리고 있다는 표시
	        } else {
	            isScrolling = false;  // 스크롤이 맨 아래에 있음
	        }
	    });

	    // 새 메시지가 수신될 때마다 자동으로 스크롤 내려줌 (스크롤을 올린 상태가 아닐 경우)
	    function handleNewMessage(newMessage) {
	        if (!isScrolling) {
	            updateChatContent(newMessage);  // 새 메시지 추가
	        }
	    }
</script>
	
</body>
</html>