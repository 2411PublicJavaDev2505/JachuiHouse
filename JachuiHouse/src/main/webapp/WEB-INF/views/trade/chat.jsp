<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1 채팅메시지</title>
    <link rel="stylesheet" href="../resources/css/header.css">
    <link rel="stylesheet" href="../resources/css/trade/chat.css">
    <link rel="stylesheet" href="../resources/css/footer.css">
</head>
<body>
    <div id="container">
            <header>
                <a href="/">
                <div class="logo">
                    <img src="../resources/img/logo.png" alt="logo">
                </div>
                </a> 
                <div class="nav">
                    <a href="#">홈</a> 
                    <a href="#">자취록</a>
                    <a href="#">찾아방</a>
                    <a href="#">사방팔방</a>
                </div>
                <div class="loginBtn">
                    <a href="#">로그인</a>
                </div>
            </header>
            <main class="chat-wrapper">
                <!-- 왼쪽 영역 (판매자 정보 + 내 정보) -->
                <div class="info-panel">
                    <!-- 내 프로필 정보 -->
                    <div class="my-profile">
                        <div class="left-image">
                            <img src="../resources/img/프로필 사진.jpg" alt="image" class="profile-img">
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
                            <img src="../resources/img/포메라니안(반려동물).jpg" alt="강아지" class="chat-image">
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

            <footer>
                이용약관 | 광고문의 | 개인정보처리방침 | 찾아오시는길 | 회사명: 자취스크립트(주) | 대표자 : 강우혁 | 문의 전화: 010-2222-3333
            </footer>

</body>
</html>
