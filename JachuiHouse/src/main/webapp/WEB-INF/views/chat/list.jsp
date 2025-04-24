<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<header>
        <a href="/">
            <div class="logo">
                <img src="../resources/image/logo.png" alt="logo">
            </div>
            </a> 
            <div class="nav">
                <a href="/">홈</a> 
                <a href="/post/list">자취록</a>
                <a href="/chazabang/list">찾아방</a>
                <a href="#">사방팔방</a>
            </div>
            <div class="loginBtn">
                <a href="/member/login">로그인</a>
            </div>
    </header>
    <main>
        <div id="mainAll">
            <div id="mainLeft">
                <div id="profile">
                    <div id="photo">
                        <img src="/Image20250120123326.png">
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
                    <button type="submit" id="chatList">게시글 목록</button>
                </div>
                <div id="content">
                    <div id="chat-intro">
                        <div id="chatmokrok">
                            <b>채팅 목록</b>
                        </div>
                    </div>
                    <div id="list">
                        <div id="nickname">
                            <div id="nicknameText">
                                <b>익명의 아르마딜로</b>
                            </div>
                            
                        </div>
                        <div id="time">
                            17:40
                        </div>
                        <div id="chat">
                            <b>방이 너무 비싸요</b>
                        </div>
                    </div>
                    <div id="list">
                        <div id="nickname">
                            <div id="nicknameText">
                                <b>익명의 로랜드고릴라</b>
                            </div>
                            
                        </div>
                        <div id="time">
                            17:40
                        </div>
                        <div id="chat">
                            <b>방이 너무 비싸요</b>
                        </div>
                    </div>
                    <div id="list">
                        <div id="nickname">
                            <div id="nicknameText">
                                <b>익명의 긴팔원숭이</b>
                            </div>
                        </div>
                        <div id="time">
                            17:40
                        </div>
                        <div id="chat">
                            <b>방이 너무 비싸요</b>
                        </div>
                    </div>
                </div>
        </div>
    </main>
    <footer>
		이용약관 | 광고문의 | 개인정보처리방침 | 찾아오시는길 | 회사명: 자취스크립트(주) | 대표자 : 강우혁 | 문의 전화: 010-2222-3333
    </footer>
</body>
</html>