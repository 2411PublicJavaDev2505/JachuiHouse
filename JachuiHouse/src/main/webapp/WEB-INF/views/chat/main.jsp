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
	        		<c:if test="${chat.writerId ne sessionScope.id}">
	        			<div class="my-msg">
	        				<div class="me">나</div>
	        				<div class="my-msg-detail">${chat.chatContent }</div>
	        			</div>
	        		</c:if>
	        		<c:if test="${chat.writerId eq sessionScope.id}">
	        			<div class="not-my-msg">
	        				<div class="receiver-name">${receiverName }</div>
	        				<div class="receive-msg">${chat.chatContent }</div>
	        			</div>
	        		</c:if>
	        	</c:forEach>
	        </div>
        	<form action="/chat/send" method="post" enctype="multipart/form-data">
        		<div class="message">
	        		<input type="hidden" value="${writerId }" name="writerId">
	        		<input type="hidden" value="${receiverId }" name="receiverId">
	        		<input type="text" placeholder="메세지를 입력해주세요" name="chatContent" id="input" required="required">
	        		<input type="file" name="images" multiple>
		            	<button type="submit" id="submitbtn">
		                	<img src="../resources/image/send.256x233.png" alt="send">
		            	</button>	        	
        		</div>
        	</form>
	        <div class="btn">
	            <button onClick="location.href='/'">채팅방 나가기</button>
	        </div>
	    </main>
	    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>
</html>