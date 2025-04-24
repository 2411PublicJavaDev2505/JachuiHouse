<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>찾아방 상세 페이지</title>
		<Link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/estate/detail.css"/>
		<Link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/include/header.css"/>
		<Link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/include/footer.css"/>
	</head>
	<body>
        <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        <div class="wrapper">
		<main class="main-container">
            <div class="estate-card">
                <c:if test="${userId eq estate.userId}">
                    <a href="/chazabang/modify/${estateNo }">
                        <button class="edit-btn" >수정</button>
					</a>
					
					<a href="/chazabang/delete/${estateNo }">
						<button class="del-btn">삭제</button>
					</a>
				</c:if>
				<div class="image-placeholder">
				    <button id="prevBtn">◁</button>
				    <div class="image-slider">
				        <c:forEach items="${estateImageList}" var="file">
				            <img class="estate-image"
				                 src="${file.estateFilePath}"
				                 alt="매물 이미지"
				                 style="${status.index == 0 ? '' : 'display:none;'}"/>
				        </c:forEach>
				    </div>
				    <button id="nextBtn">▷</button>
				    <button id="toggleAuto">⏸</button>
				</div>
				<c:if test="${userRole ne 'R' }">
					<div class="estate-conatact">
	                    <div class="chat-btn">
	                    	<a href="/chat/torealtor">
	                        	<button>1:1 채팅문의</button>
	                    	</a>
	                    </div>
						<div class="realtor-phone" id="phoneNumber">
						    ${estate.userPhone}
						</div>
					</div>
				</c:if>
                <div class="estate-info">
                    <div class="estate-info-1">
                        <span class="info-title">거래정보</span>
                        <c:if test="${estate.estateRentType eq 'charter'}">
						    <div class="estate-rent">전세 ${estate.transformEstateDeposit}</div>
						</c:if>
						<c:if test="${estate.estateRentType eq 'monthly'}">
						    <div class="estate-rent">월세 ${estate.transformEstateDeposit}/${estate.transformMonthlyRent}</div>
						</c:if>
                    </div>
                    <div class="estate-info-2">
                        <span class="info-title">주소</span>
                        <div class="estate-address">${estate.estateAddress }</div>
                    </div>
                    <div class="estate-info-4">
                        <span class="info-title">형태</span>
                        <c:if test="${estate.estateType eq 'onetwo'}">
                        	<div class="estate-type">원룸/투룸</div>
                        </c:if>
                        <c:if test="${estate.estateType eq 'villa'}">
                        	<div class="estate-type">주택/빌라</div>
                        </c:if>
                        <c:if test="${estate.estateType eq 'apart'}">
                        	<div class="estate-type">아파트</div>
                        </c:if>
                        <c:if test="${estate.estateType eq 'officetel'}">
                        	<div class="estate-type">오피스텔</div>
                        </c:if>
                    </div>
                    <div class="estate-info-3">
                        <span class="info-title">전용면적</span>
                        <div class="estate-width">${estate.estateWidth }㎡</div>
                    </div>
                    <div class="estate-info-5">
                        <span class="info-title">층</span>
                        <div class="estate-floor">${estate.estateFloor }층</div>
                    </div>
                    <div class="estate-info-6">
                        <span class="info-title">입주가능일</span>
						<div class="estate-movein-date">
						  	<c:choose>
							    <c:when test="${estate.moveinNowYN eq 'Y'}">
							      즉시입주가능
							    </c:when>
							    <c:otherwise>
							      ${estate.estateMoveinDate}
							    </c:otherwise>
						  	</c:choose>
						</div>
                    </div>
	                    <div class="estate-info-7">
						  <span class="info-title">옵션</span>
						  <div class="option-grid">
						    <c:forEach items="${estate.estateOptionList}" var="option">
						      <div class="option-item">
						        <div class="option-img-box">
						          <img src="${option.optionImg}" alt="${option.optionName} 아이콘"/>
						        </div>
						        <div class="option-name">${option.optionName}</div>
						      </div>
						    </c:forEach>
						  </div>
						</div>
                	</div>
            	</div>
       		</main>
    	</div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        <script>
		    let currentIndex = 0;
		    const images = document.querySelectorAll(".estate-image");
		    const totalImages = images.length;
		    let autoSlide = true;
		    let intervalId;
		
		    function showImage(index) {
		        images.forEach((img, i) => {
		            img.style.display = i === index ? "block" : "none";
		        });
		    }
		
		    function nextImage() {
		        currentIndex = (currentIndex + 1) % totalImages;
		        showImage(currentIndex);
		    }
		
		    function prevImage() {
		        currentIndex = (currentIndex - 1 + totalImages) % totalImages;
		        showImage(currentIndex);
		    }
		
		    function toggleAutoSlide() {
		        autoSlide = !autoSlide;
		        document.getElementById("toggleAuto").innerText = autoSlide ? "⏸" : "▶";
		
		        if (autoSlide) {
		            startSlide();
		        } else {
		            clearInterval(intervalId);
		        }
		    }
		
		    function startSlide() {
		        intervalId = setInterval(() => {
		            if (autoSlide) {
		                nextImage();
		            }
		        }, 3000); // 3초 간격
		    }
		
		    // 초기 슬라이드 시작
		    window.onload = () => {
		        showImage(0); // 첫 번째 이미지 바로 표시
		        startSlide();
		        document.getElementById("nextBtn").addEventListener("click", nextImage);
		        document.getElementById("prevBtn").addEventListener("click", prevImage);
		        document.getElementById("toggleAuto").addEventListener("click", toggleAutoSlide);
		    };
		        // 전화번호 가르기
		    document.addEventListener("DOMContentLoaded", () => {
		        const phoneEl = document.getElementById("phoneNumber");
		        const rawPhone = phoneEl.textContent.trim();

		        const digits = rawPhone.replace(/\D/g, '');

		        if (digits.length === 11) {
		            const formatted = digits.replace(/(\d{3})(\d{4})(\d{4})/, "$1-$2-$3");
		            phoneEl.textContent = formatted;
		        }
		    });
		</script>
	</body>
</html>