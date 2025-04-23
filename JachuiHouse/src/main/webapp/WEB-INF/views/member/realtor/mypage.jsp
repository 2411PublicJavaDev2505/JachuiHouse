<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사-마이페이지</title>
<link rel="stylesheet" href="../../resources/css/include/header.css">
<link rel="stylesheet" href="../../resources/css/include/footer.css">
<link rel="stylesheet" href="../../resources/css/realtor/mypage.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
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
                	<a href="/member/realtor/update">
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
                    <b>나의 게시글</b>
                    <a href="/chat/chat?writerId=${userId }">
                    	<button type="submit" id="chatList">채팅 내역</button>
                    </a>
                </div>
                <div id="content">
                    <div id="roomImg">

                    </div>
                    <div id="roomIntro">
                        <div id="top">
                            <div id="top-in">
                                <div id="jongro">
                                    <b>종로구 1000/50</b>
                                </div>
                                <div id="button-box">
                                    <button type="submit" id="update">수정</button>
                                    <button type="submit" id="x">삭제</button>
                                </div>
                            </div>
                        </div>
                        <div id="mid">
                            <div id="top-in">
                                <b>원룸</b>
                            </div>
                        </div>
                        <div id="bot">
                            <div id="top-in">
                                <text>원룸</text>
                            </div>
                        </div>
                </div>
                </div>
                <div id="content">
                    <div id="roomImg">
                        <img src="/Image20250120123326.png">
                    </div>
                    <div id="roomIntro">
                        <div id="top">
                            <div id="top-in">
                                <div id="jongro">
                                    <b>종로구 1000/50</b>
                                </div>
                                <div id="button-box">
                                    <button type="submit" id="update">수정</button>
                                    <button type="submit" id="x">삭제</button>
                                </div>
                            </div>
                        </div>
                        <div id="mid">
                            <div id="top-in">
                                <b>원룸</b>
                            </div>
                        </div>
                        <div id="bot">
                            <div id="top-in">
                                <text>원룸</text>
                            </div>
                        </div>
                </div>
                </div>
                <div id="content">
                    <div id="roomImg">
						
                    </div>
                    <div id="roomIntro">
                        <div id="top">
                            <div id="top-in">
                                <div id="jongro">
                                    <b>종로구 1000/50</b>
                                </div>
                                <div id="button-box">
                                    <button type="submit" id="update">수정</button>
                                    <button type="submit" id="x">삭제</button>
                                </div>
                            </div>
                        </div>
                        <div id="mid">
                            <div id="top-in">
                                <b>원룸</b>
                            </div>
                        </div>
                        <div id="bot">
                            <div id="top-in">
                                <text>원룸</text>
                            </div>
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