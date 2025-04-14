<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자취스크립트</title>
    <link rel="stylesheet" href="../resources/css/index.css">
    
    <script src="https://unpkg.com/typeit@8.7.1/dist/index.umd.js"></script>
</head>
<body>
    <div class="container">
        <!-- 헤더 -->
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
    
        <!-- 배너 슬라이드 -->
            <div class="main">
                <section class="banner">
                    <div>
                        <img src="../resources/img/download (1).jpeg"  alt="image" class="left-image">
                    </div>
                    <h2 class="main-hello">
                    </h2>
                    <div>
                        <img src="../resources/img/house.png" alt="house" class="right-image">
                    </div>
                </section>
            
                <!-- 주요 기능 소개 -->
                <div class="main-menu">
                    <div class="left-menu">
                        <a href="#">
                            <div class="user-story">
                                <h3>자취록 </h3>
                                <p>우리들의 자취 이야기</p>
                            </div>
                        </a>
                        <a href="#">
                            <div class="alone-living">
                                <h3>찾아방</h3>
                                <p>맘에드는 집을 찾아방</p>
                            </div>
                        </a>
                        <a href="#">
                            <div class="used-market">
                                <h3>사방팔아방</h3>
                                <p>자취러들의 중고장터</p>
                            </div>
                        </a>
                    </div>
                    <div class="right-menu">
                        <a href="#">
                            <div class="notice-board">
                                <h3>공지사항</h3>
                                <li>감기 조심하세요</li>
                                <li>사기 예방 안내</li>
                            </div>
                        </a>
                    </div>
                </div>     
            </div>
        <!-- 푸터 -->
        <footer>
            이용약관 | 광고문의 | 개인정보처리방침 | 찾아오시는길 | 회사명: 자취스크립트(주) | 대표자 : 강우혁 | 문의 전화: 010-2222-3333
        </footer>
    </div>
        
        <!-- JavaScript 파일 연결 -->
        <script>
        new TypeIt('.main-hello', {
            loop:true,
            speed: 90,
            waitUntilVisible: true,})
            .type("자취스크립에 오신 걸 환영합니다.", {delay:500})
            .delete(12)
            .type("서 당신의 꿀팁을 공유해주세요.")
            .go();
        </script>

</body>
</html>
</html>