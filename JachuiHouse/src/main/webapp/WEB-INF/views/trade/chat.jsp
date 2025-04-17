<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1 채팅메시지</title>
    <link rel="stylesheet" href="/resources/css/include/header.css">
    <link rel="stylesheet" href="/resources/css/trade/chat.css">
    <link rel="stylesheet" href="/resources/css/include/footer.css">
</head>
<body>
    <div id="container">
            <jsp:include page="/WEB-INF/views/include/header.jsp" />
            <main class="chat-wrapper">
                <!-- 왼쪽 영역 (판매자 정보 + 내 정보) -->
                <div class="info-panel">
                    <!-- 내 프로필 정보 -->
                    <div class="my-profile">
                        <div class="left-image">
                            <img src="/resources/img/프로필 사진.jpg" alt="image" class="profile-img">
                        </div>
                        <h3>강우혁</h3>
                        <p>자취생 강우혁입니다.</p>
                        <div class="updateBtn">
                            <button>내 정보 수정</button>
                        </div>
                        <script>
                            // 내 정보 수정 버튼 클릭 시 확인창
                            document.querySelector('.updateBtn button').addEventListener('click', function () {
                                const confirmUpdate = confirm("회원정보를 수정하시겠습니까?");
                                if (confirmUpdate) {
                                    // 수정 페이지로 이동하는 예시 (원하는 경로로 바꿔줘)
                                    window.location.href = "/user/edit"; 
                                }
                            });
                        </script>
                        <div class="my-inform">
                            <p>서울시 종로구</p>
                            <p>010-1111-8888</p>
                            <p>kh@kh.com</p>
                        </div>
                    </div>
                </div>
            
                <!-- 오른쪽 채팅창 -->
                <div class="chat-box">
                    <div class="chat-header">내 채팅</div>
                    <div class="chat-messages">
                        <div class="message received">안녕하세요</div>
                        <div class="message sent">안녕하세요 반갑습니다</div>
                        <div class="message received">물건 구매하려하는데요</div>
                        <div class="message received">조금 싸게는 안될까요?</div>
                        <div class="message sent">안됩니다</div>
                        <div class="message sent">
                            <img src="/resources/img/포메라니안(반려동물).jpg" alt="강아지" class="chat-image">
                        </div>
                    </div>
                    <div class="chat-input-wrapper">
                        <label class="image-icon">
                            <input type="file" style="display:none">
                            <img src="https://cdn-icons-png.flaticon.com/512/1828/1828817.png" alt="파일 첨부" />
                        </label>
                        <input type="text" placeholder="채팅메시지" class="chat-input" />
                        <button class="send-button">전송</button>
                        <script>
                            // 전송 버튼 클릭 시 메시지 전송 처리
                            document.querySelector('.send-button').addEventListener('click', function () {
                                const input = document.querySelector('.chat-input');
                                const message = input.value.trim();
                        
                                if (message !== "") {
                                    const chatMessages = document.querySelector('.chat-messages');
                        
                                    const newMessage = document.createElement('div');
                                    newMessage.classList.add('message', 'sent');
                                    newMessage.textContent = message;
                        
                                    chatMessages.appendChild(newMessage);
                                    input.value = ""; // 입력창 비우기
                        
                                    // 자동 스크롤 아래로
                                    chatMessages.scrollTop = chatMessages.scrollHeight;
                                }
                            });
                        </script>


                    </div>
                </div>
            </main>

             	 	<jsp:include page="/WEB-INF/views/include/footer.jsp" />

</body>
</html>
