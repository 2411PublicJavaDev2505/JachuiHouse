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
    <script src="https://unpkg.com/typeit@8.7.1/dist/index.umd.js"></script>
</head>
<body>
	<main>
		 <div class="container">    
		 	<jsp:include page="/WEB-INF/views/include/header.jsp" />
		 
	        <!-- 배너 슬라이드 -->
	            <div class="main">
	                <section class="banner">
	                   <div class="left-image-container">
						    <button class="arrow left" onclick="changeImage(-1)">&#10094;</button>
						    <img id="leftImage" src="../resources/image/main-left.jpeg" alt="image" class="left-image">
						    <button class="arrow right" onclick="changeImage(1)">&#10095;</button>
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
	                        <a href="/chazabang/list">
	                            <div class="alone-living">
	                                <h3>찾아방</h3>
	                                <p>맘에드는 집을 찾아방</p>
	                            </div>
	                        </a>
	                        <a href="/trade/list">
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
	   		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	    </div>
	</main>
        <!-- JavaScript 파일 연결 -->
        <script>
        new TypeIt('.main-hello', {
            loop:true,
            speed: 90,
            waitUntilVisible: true,})
            .type("자취하우스에 오신 걸 환영합니다.", {delay:500})
            .delete(12)
            .type("서 당신의 꿀팁을 공유해주세요.")
            .go();
        const images = [
            "../resources/image/main-left.jpeg",
            "https://d2u3dcdbebyaiu.cloudfront.net/uploads/atch_img/868/b95e315ef9ac68f64598172e66701798_res.jpeg",
            "https://prs.ohousecdn.com/apne2/any/v1-329094204354688.jpg?w=480&h=480&c=c&q=80"
        ];
        let currentImageIndex = 0;

        function changeImage(direction) {
            currentImageIndex += direction;
            if (currentImageIndex < 0) {
                currentImageIndex = images.length - 1;
            } else if (currentImageIndex >= images.length) {
                currentImageIndex = 0;
            }

            document.getElementById("leftImage").src = images[currentImageIndex];
        }
        </script>
</body>
</html>
