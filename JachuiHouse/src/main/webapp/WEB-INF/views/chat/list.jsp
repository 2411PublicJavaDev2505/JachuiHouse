<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../resources/css/include/header.css">
<link rel="stylesheet" href="../../resources/css/include/footer.css">
<link rel="stylesheet" href="../../resources/css/realtor/chatlist.css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <main>
        <div id="mainAll">
            <div id="mainLeft">
                <div id="profile">
                    <div id="photo">
                        <img src="/resources/image/${member.profileImage}" alt="image" id="profileImage" style="width:200px; height:200px; margin-left:50px; border-radius:100%;">	               
                    </div>
                </div>
                <div id="name">
                    <b>${member.userId }</b>
                </div>
                <div id="intro">
                    공인중개사 ${member.userName }입니다.
                </div>
                <div id="company">
                   	${member.realtorName}
                </div>
                <div id="phone">
                    ${member.userPhone }
                </div>
                <div id="email">
                    ${member.userEmail }
                </div>
                <div id="modi">
                	<a href="/realtor/update">
                    	<button type="submit" id="modify">정보 수정</button>
                    </a>
                </div>
                <div id="del">
                	<a href="/member/delete">
                    	<button type="submit" id="delete">회원 탈퇴</button>
                    </a>
                </div>
            </div>
            <div id="mainRight">
                <div id="content-intro">
                    <b>채팅</b>
                    <a href="/realtor/myPage">
                    	<button type="submit" id="chatList">게시글 목록</button>
                    </a>
                </div>
                <div id="content" >
                    <div id="chat-intro">
                        <div id="chatmokrok">
                            <b>채팅 목록</b>
<!--                              <button id="showMoreChatBtn" onclick="toggleChatList()">더보기</button>
 -->                        </div>
                    </div>
                    <c:if test="${empty chatwithList}">
					     <p>채팅내역이 없습니다.</p>
					</c:if>
                            <c:forEach var="cwl" items="${chatwithList}" varStatus="status">
							<div id="list" >
                        		<div id="nickname">
                            <div id="nicknameText">
					        <a href="${pageContext.request.contextPath}/chat/room?chatRoomNo=${cwl.chatRoom.chatRoomNo}&itemname=${cwl.chatRoom.itemType}&itemNo=${cwl.chatRoom.itemNo}&user1Id=${cwl.chatRoom.user2Id}&user2Id=${cwl.chatRoom.user1Id}">
					            <b>${cwl.opponentName} </b>님과의 채팅        
					        </a>
                            </div>     
                        </div>
 					    <a href="${pageContext.request.contextPath}/chat/room?chatRoomNo=${cwl.chatRoom.chatRoomNo}&itemname=${cwl.chatRoom.itemType}&itemNo=${cwl.chatRoom.itemNo}&user1Id=${cwl.chatRoom.user2Id}&user2Id=${cwl.chatRoom.user1Id}">       
                        	<div id="time">
                           		${cwl.chat.createDate }
                        	</div>
                        </a>
					    <a href="${pageContext.request.contextPath}/chat/room?chatRoomNo=${cwl.chatRoom.chatRoomNo}&itemname=${cwl.chatRoom.itemType}&itemNo=${cwl.chatRoom.itemNo}&user1Id=${cwl.chatRoom.user2Id}&user2Id=${cwl.chatRoom.user1Id}">
                        <div id="chat">
                            <b>${cwl.chat.message}</b>
                        </div>
                        </a>
                    </div>
					    </c:forEach>
                </div>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
    
    <!-- <script type="text/javascript">
	function toggleChatList() {
	    const allChatItems = document.querySelectorAll('#list');
	    const button = document.getElementById("showMoreChatBtn");
	    if (button.innerText === "더보기") {
	        allChatItems.forEach(item => item.classList.remove('hidden'));
	        button.innerText = "간략히 보기";
	    } else {
	        allChatItems.forEach((item, index) => {
	        	if (index >= 4) {
                    item.classList.add('hidden');
                } else {
                    item.classList.remove('hidden'); // 처음 3개는 항상 보여야 함
                }
	        });
	        button.innerText = "더보기";
	    }
	}
	</script> -->
</body>
</html>