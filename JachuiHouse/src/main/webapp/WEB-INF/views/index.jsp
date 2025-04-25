<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- 		캐러셀 추가 -->
	    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	    
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
<!-- 						    <button class="arrow left" onclick="changeImage(-1)">&#10094;</button> -->
							<!-- 		캐러셀 추가 -->
							<div class="carousel_main">
							    <div class="carousel_wrapper">
							        <div class="carousel_slide">
							            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA5MzBfNTUg%2FMDAxNjMyOTg3MzU1Mjg4.LbF4Exn6nnxxE2qvzmlEYgMKZh4fige3O3DH5nEdq2Qg.5HpjCmRosQHCCYj2M7B-8dXjHcUw6EWr2jBpwklRAfIg.JPEG.dreamcampus%2F%25C7%25D1%25C0%25E5%25C0%25E7%25C0%25DA%25C3%25EB%25BB%25FD_%25B2%25DC%25C6%25C1.jpg&type=a340" alt="#" />
							        </div>
							        <div class="carousel_slide">
							            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA3MjBfMTcg%2FMDAxNjI2NzYzMTEwOTIw.AsB2J8LNr8UG_iW5KZZEcDatHJ4iM7PkunXQo-P94hAg.mUl_4vATjWFI_pIISh6Qx9Mp-WoRcKGHkzmwlVs7uV8g.PNG.dreamcampus%2F%25C7%25D1%25C0%25E5%25C0%25E7%25C0%25DA%25C3%25EB%25BB%25FD%25C3%25DF%25C3%25B5%25BF%25E4%25B8%25AE_01.png&type=a340" alt="#" />
							        </div>
							        <div class="carousel_slide">
							            <img src="https://octapi.lxzin.com/imageBlockProp/image/202210/12/720/0/ad6e0563-7903-4c48-8b70-45821992255c.jpg" alt="#" />
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

	                    <h2 class="main-hello">
	                    </h2>
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
        
//         캐러셀
//         const prevButton = document.querySelector('.prev');
//         const nextButton = document.querySelector('.next');
//         const carousel = document.querySelector('.carousel');
        
//         let index = 0;//첫 리소스의 값은 0:첫 리소스에 접근해 있을 때 이전 버튼이 클릭이 되면 안됨

//         //translate3d를 활용하여 제어:숫자값인 index와 이전, 이후에 클릭 이벤트를 등록
//         prevButton.addEventListener('click', () => {
//         	if (index === 0) return;//이벤트 무효화:이전 버튼 이벤트에는 index가 0이면 return을 하여
//         	index -= 1;//각자 끝에 있는 리소스가 아닐 경우
//         	//이전 버튼에는 한 번 클릭마다 index가 1씩 감소, 이후 버튼에는 1씩 증가하면 끝 리소스에서는 이벤트가 실행x
// 			carousel.style.transform = `translate3d(-${500 * index}px, 0, 0)`;//현재 캐러셀의 넓이가 500px
//         });

//         nextButton.addEventListener('click', () => {
//         	if (index === 2) return;//이벤트 무효화:리소스는 총 3개이기 때문에-> index가 2일 때 return
//         	index += 1;
//         	carousel.style.transform = `translate3d(-${500 * index}px, 0, 0)`;
//         });

			//캐러셀2
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
		
		      prevBtn.addEventListener('click', () => {
		        if (currentSlide > 0) showSlide(currentSlide - 1);
		        updateSlideWidth()
		      });
		
		      nextBtn.addEventListener('click', () => {
		        if (currentSlide < slides.length - 1) showSlide(currentSlide + 1);
		        updateSlideWidth()
		      });
		
		      bullets.forEach((bullet, i) => {
		        bullet.addEventListener('click', () => showSlide(i));
		        updateSlideWidth()
		      });
		    });
		    
        </script>

</body>
</html>
