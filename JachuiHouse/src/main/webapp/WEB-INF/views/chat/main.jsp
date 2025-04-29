<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>채팅</title>
    <link rel="stylesheet" href="../resources/css/include/header.css">
    <link rel="stylesheet" href="../resources/css/include/footer.css">
    <link rel="stylesheet" href="../resources/css/chat/chat.css">
</head>
<body>
	<div id="container">
	    <jsp:include page="/WEB-INF/views/include/header.jsp" />
	    <main>
	        <div class="title">
	            <h1>${receiverName} 님과의 채팅</h1>
	        </div>
	
	        <div class="chat-content">
	            <c:forEach var="chat" items="${cList}">
	                <c:if test="${chat.writerId eq writerId}">
	                    <div class="my-msg message-${chat.chatNo}">
	                        <div class="me">나</div>
	                        <div class="my-msg-detail">${chat.chatContent}</div>
	                    </div>
	                </c:if>
	                <c:if test="${chat.writerId ne writerId}">
	                    <div class="not-my-msg message-${chat.chatNo}">
	                        <div class="receiver-name">${receiverName}</div>
	                        <div class="receive-msg">${chat.chatContent}</div>
	                    </div>
	                </c:if>
	            </c:forEach>
	        </div>
	
	        <form id="chatForm" enctype="multipart/form-data">
	            <div class="message">
	                <input type="hidden" name="writerId" value="${writerId}">
	                <input type="hidden" name="receiverId" value="${receiverId}">
	                <input type="text" name="chatContent" id="input" placeholder="메시지를 입력하세요" required>
	                <input type="file" id="fileInput" name="images" multiple>
	                <button type="button" id="fileBtn">+</button>
	                <button type="submit" id="submitBtn">전송</button>
	            </div>
	        </form>
	
	        <div class="btn">
	            <button onclick="location.href='/'">채팅방 나가기</button>
	        </div>
	    </main>
	    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
	<script>
		let lastChatNo = ${empty cList ? 0 : cList[cList.size()-1].chatNo};
		
		document.getElementById('chatForm').addEventListener('submit', function (e) {
		    e.preventDefault();
		    const formData = new FormData(this);
		    fetch('/chat/send', {
		        method: 'POST',
		        body: formData
		    })
		    .then(res => res.json())
		    .then(data => {
		        if (data.status === "success") {
		            document.getElementById('input').value = '';
		            fetchChatMessages(); 
		        }
		    })
		    .catch(error => console.error(error));
		});
		function fetchChatMessages() {
		    fetch(`/chat/fetch?writerId=${'${writerId}'}&receiverId=${'${receiverId}'}&lastChatNo=${lastChatNo}`)
		    .then(res => res.json())
		    .then(data => {
		        const chatContent = document.querySelector('.chat-content');
		        data.forEach(chat => {
		            const div = document.createElement('div');
		            div.classList.add(chat.writerId === '${writerId}' ? 'my-msg' : 'not-my-msg', `message-${chat.chatNo}`);
		            div.innerHTML = chat.writerId === '${writerId}'
		                ? `<div class="me">나</div><div class="my-msg-detail">${chat.chatContent}</div>`
		                : `<div class="receiver-name">${receiverName}</div><div class="receive-msg">${chat.chatContent}</div>`;
		            chatContent.appendChild(div);
		            lastChatNo = chat.chatNo; // 마지막 채팅번호 업데이트
		        });
		        scrollToBottom();
		    })
		    .catch(error => console.error(error));
		}
		
		function scrollToBottom() {
		    const chatContent = document.querySelector('.chat-content');
		    chatContent.scrollTop = chatContent.scrollHeight;
		}
		setInterval(fetchChatMessages, 1000);
	</script>
</body>
</html>
