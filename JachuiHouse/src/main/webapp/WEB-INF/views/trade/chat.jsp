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
        <!-- 왼쪽 영역 -->
        <div class="info-panel">
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
                    document.querySelector('.updateBtn button').addEventListener('click', function () {
                        const confirmUpdate = confirm("회원정보를 수정하시겠습니까?");
                        if (confirmUpdate) {
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
            <div class="chat-messages"></div>
            <div class="chat-input-wrapper">
                <label class="image-icon">
                    <input type="file" class="file-input" style="display:none">
                    <img src="https://cdn-icons-png.flaticon.com/512/1828/1828817.png" alt="파일 첨부" />
                </label>
                <input type="text" placeholder="채팅메시지" class="chat-input" />
                <button class="send-button">전송</button>
            </div>

            <!-- WebSocket -->
            <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>
            <script>
                const socket = new SockJS('/ws');
                const stompClient = Stomp.over(socket);

                stompClient.connect({}, function () {
                    stompClient.subscribe('/topic/messages', function (message) {
                        const msg = JSON.parse(message.body);
                        const chatBox = document.querySelector('.chat-messages');
                        const newMsg = document.createElement('div');
                        newMsg.classList.add('message', 'received');

                        if (msg.filePath) {
                            const fileLink = document.createElement('a');
                            fileLink.href = msg.filePath;
                            fileLink.innerText = "파일 다운로드";
                            fileLink.target = "_blank";
                            newMsg.appendChild(fileLink);
                        } else {
                            newMsg.innerText = msg.chatContent;
                        }

                        chatBox.appendChild(newMsg);
                        chatBox.scrollTop = chatBox.scrollHeight;
                    });
                });

                document.querySelector('.send-button').addEventListener('click', function () {
                    const input = document.querySelector('.chat-input');
                    const message = input.value.trim();

                    if (message !== "") {
                        const newMessage = {
                            sender: "사용자이름",
                            chatContent: message
                        };

                        stompClient.send("/app/chat", {}, JSON.stringify(newMessage));

                        const chatMessages = document.querySelector('.chat-messages');
                        const newMsg = document.createElement('div');
                        newMsg.classList.add('message', 'sent');
                        newMsg.innerText = message;
                        chatMessages.appendChild(newMsg);
                        input.value = "";
                        chatMessages.scrollTop = chatMessages.scrollHeight;
                    }
                });

                // 파일 첨부 핸들링
                document.querySelector('.file-input').addEventListener('change', function () {
                    const file = this.files[0];
                    if (!file) return;

                    const formData = new FormData();
                    formData.append("file", file);

                    fetch("/chat/uploadFile", {
                        method: "POST",
                        body: formData
                    })
                    .then(response => response.json())
                    .then(data => {
                        const fileMessage = {
                            sender: "사용자이름",
                            chatContent: "",
                            filePath: data.filePath // 서버에서 돌려주는 경로
                        };
                        stompClient.send("/app/chat", {}, JSON.stringify(fileMessage));

                        const chatMessages = document.querySelector('.chat-messages');
                        const fileDiv = document.createElement('div');
                        fileDiv.classList.add('message', 'sent');
                        const fileLink = document.createElement('a');
                        fileLink.href = data.filePath;
                        fileLink.innerText = "첨부파일 다운로드";
                        fileLink.target = "_blank";
                        fileDiv.appendChild(fileLink);
                        chatMessages.appendChild(fileDiv);
                        chatMessages.scrollTop = chatMessages.scrollHeight;
                    });
                });

                // 아이콘 클릭 시 파일 선택 열기
                document.querySelector('.image-icon img').addEventListener('click', function () {
                    document.querySelector('.file-input').click();
                });
            </script>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</div>
</body>
</html>