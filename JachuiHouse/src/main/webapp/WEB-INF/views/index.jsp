<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자취스크립트</title>
<link rel="stylesheet" href="../resources/css/include/header.css">
<link rel="stylesheet" href="../resources/css/include/index.css">
<link rel="stylesheet" href="../resources/css/include/footer.css">

</head>
<body>
	 <div class="container">    
	 	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	 
        <!-- 배너 슬라이드 -->
            <div class="main">
                <section class="banner">
                    <div>
                        <img src="../resources/image/main-left.jpeg"  alt="image" class="left-image">
                    </div>
                    <h2 class="main-hello">
                    </h2>
                    <div>
                        <img src="../resources/image/main-right.png" alt="house" class="right-image">
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
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
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