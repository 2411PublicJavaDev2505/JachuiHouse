<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- 		캐러셀 추가 -->
	    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	    
		<title>자취하우스</title>
			<link rel="stylesheet" href="../resources/css/include/header.css">
			<link rel="stylesheet" href="../resources/css/include/index.css">
			<link rel="stylesheet" href="../resources/css/include/footer.css">
	    <script src="https://unpkg.com/typeit@8.7.1/dist/index.umd.js"></script>
	</head>
<body>
		 <div class="container">    
		 	<jsp:include page="/WEB-INF/views/include/header.jsp" />
		 	<h2 class="main-hello"></h2>
			<main>
	        <!-- 배너 슬라이드 -->
	            <div class="main">
	                <section class="banner">
	                   <div class="left-image-container">
<!-- 						    <button class="arrow left" onclick="changeImage(-1)">&#10094;</button> -->
							<!-- 		캐러셀 추가 -->
							<div class="carousel_main">
							    <div class="carousel_wrapper">
							        <div class="carousel_slide">
							        	<a href="http://localhost:7777/post/detail?postNo=801">
<!-- 							            <img src="https://iii.ad/16747a" alt="#" /> -->
							            	<img src="https://iii.ad/145484" alt="첫 번째 이미지" />
							            </a>
							        </div>
							        <div class="carousel_slide">
										<a href="http://localhost:7777/post/detail?postNo=866">
							                <img src="https://iii.ad/ccc869" alt="두 번째 이미지" />
							            </a>
							        </div>
							        <div class="carousel_slide">
							            <a href="http://localhost:7777/post/detail?postNo=867">
							                <img src="https://iii.ad/054b54" alt="세 번째 이미지" />
							            </a>
							        </div>
							    </div>
							
							    <!-- 캐러셀 사이드 버튼 -->
							    <div class="carousel_button_container">
							        <button type="button" class="carousel_prev">
							            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
							                <path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
							                <path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
							            </svg>
							        </button>
							        <button type="button" class="carousel_next">
							            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
							                <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
							                <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
							            </svg>
							        </button>
							    </div>
							
							    <!-- 캐러셀 중앙 버튼 -->
							    <div class="carousel_pagination">
							        <div class="carousel_circle"></div>
							        <div class="carousel_circle"></div>
							        <div class="carousel_circle"></div>
							    </div>
							</div>
						</div>
	                    <div>
	                        <img src="../resources/image/main-right.png" alt="house" class="right-image">
	                    </div>
	                </section>                
	                            
	                <!-- 주요 기능 소개 -->
	                <div class="main-menu">
	                    <div class="left-menu">
	                        <a href="post/list">
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
	                        <a href="notice/list">
	                            <div class="notice-board">
	                                <h3>공지사항</h3>
	                                <li><a href="http://localhost:7777/notice/detail/219">감기 조심하세요</a></li>
	                                <li><a href="http://localhost:7777/notice/detail/220">사기 예방 안내</a></li>
	                            </div>
	                        </a>
	                    </div>
	                </div>     
	            </div>
	        <!-- 푸터 -->
			</main>
	   		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	    </div>
        <!-- JavaScript 파일 연결 -->
        <script src="https://unpkg.com/typeit@8.7.1/dist/index.umd.js"></script>
        <script>
<<<<<<< HEAD
=======
        new TypeIt('.main-hello', {
            loop: true,
            speed: 120,
            waitUntilVisible: true
        })
        .type("자취하우스에 오신 걸 환영합니다.", { delay: 600 })
        .delete(12)
        .type("서 당신의 꿀팁을 공유해주세요.")
        .go();
>>>>>>> 7955d1b0d186ed1d8fe9a01ab20ee771afc57d26
        const images = [
            "../resources/image/main-left.jpeg",
            "https://d2u3dcdbebyaiu.cloudfront.net/uploads/atch_img/868/b95e315ef9ac68f64598172e66701798_res.jpeg",
            "https://prs.ohousecdn.com/apne2/any/v1-329094204354688.jpg?w=480&h=480&c=c&q=80",
            "https://octapi.lxzin.com/imageBlockProp/image/202210/12/720/0/ad6e0563-7903-4c48-8b70-45821992255c.jpg"
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
        
<<<<<<< HEAD
//         캐러셀

			document.addEventListener("DOMContentLoaded", function () {
		      const swiper = document.querySelector('.carousel_wrapper');
		      const slides = document.querySelectorAll('.carousel_slide');
		      const prevBtn = document.querySelector('.carousel_prev');
		      const nextBtn = document.querySelector('.carousel_next');
		      const bullets = document.querySelectorAll('.carousel_circle');
// 		      const slideWidth = slides[0].offsetWidth;
	          let slideWidth;
			  let currentSlide = 0;
				
			  function updateSlideWidth() {
			    slideWidth = slides[0].clientWidth;
			  }
		
		      function showSlide(value) {
		    	const setValue = "-" + (value * slideWidth) + "px"; 
		        swiper.style.transform = `translateX(`+setValue+`)`;
		        currentSlide = value;
		        bullets.forEach((bullet, i) => {
		          bullet.classList.toggle('active', i === value);
		        });
		      }
		
		      prevBtn.addEventListener('click', (e) => {
		    	    e.stopPropagation();  // 추가!! 링크 이동 막음
		    	    e.preventDefault();    // 기본 동작 막기 (링크 이동 금지)
		        if (currentSlide > 0) showSlide(currentSlide - 1);
		        updateSlideWidth()
		      });
		
		      nextBtn.addEventListener('click',  (e) => {
		    	    e.stopPropagation();  // 추가!! 링크 이동 막음
		    	    e.preventDefault();    // 기본 동작 막기 (링크 이동 금지)
		        if (currentSlide < slides.length - 1) showSlide(currentSlide + 1);
		        updateSlideWidth()
		      });
		
		      bullets.forEach((bullet, i) => {
		        bullet.addEventListener('click',  (e) => {
		            e.stopPropagation();  // 추가!! 링크 이동 막음
		            e.preventDefault();    // 기본 동작 막기 (링크 이동 금지)
		        	showSlide(i);
// 		        	updateSlideWidth()
		      });
		    });
		      
		      window.addEventListener('resize', updateSlideWidth);
		      updateSlideWidth();
		      showSlide(0); // 처음에 슬라이드 보이게 설정
		    });
		</script>
        <script>
		document.addEventListener("DOMContentLoaded", function () {
        new TypeIt('.main-hello', {
            loop:true,
            speed: 90,
            waitUntilVisible: true,
		})
            .type("자취하우스에 오신 걸 환영합니다.", {delay:500})
            .delete(12)
            .type("서 당신의 꿀팁을 공유해주세요.")
            .go();
		});
        </script>
=======
        document.addEventListener("DOMContentLoaded", function () {
            const swiper = document.querySelector('.carousel_wrapper');
            const slides = document.querySelectorAll('.carousel_slide');
            const prevBtn = document.querySelector('.carousel_prev');
            const nextBtn = document.querySelector('.carousel_next');
            const bullets = document.querySelectorAll('.carousel_circle');

            let slideWidth;
            let currentSlide = 0;

            function updateSlideWidth() {
                slideWidth = slides[0].clientWidth;
            }

            function showSlide(value) {
                const setValue = "-" + (value * slideWidth) + "px"; 
                swiper.style.transform = `translateX(${setValue})`;
                currentSlide = value;
                bullets.forEach((bullet, i) => {
                    bullet.classList.toggle('active', i === value);
                });
            }

            prevBtn.addEventListener('click', (e) => {
                e.stopPropagation();
                updateSlideWidth();  // <- 이게 위로 올라와야 정확
                if (currentSlide > 0) showSlide(currentSlide - 1);
            });

            nextBtn.addEventListener('click', (e) => {
                e.stopPropagation();
                updateSlideWidth();
                if (currentSlide < slides.length - 1) showSlide(currentSlide + 1);
            });

            bullets.forEach((bullet, i) => {
                bullet.addEventListener('click', (e) => {
                    e.stopPropagation();
                    updateSlideWidth();
                    showSlide(i);
                });
            });

            // 페이지 로드시 초기 슬라이드 세팅
            updateSlideWidth();
            showSlide(0);
        });
        </script>

>>>>>>> 7955d1b0d186ed1d8fe9a01ab20ee771afc57d26
</body>
</html>
