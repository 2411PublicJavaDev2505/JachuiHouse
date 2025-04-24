<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<Link rel="stylesheet" href="../resources/css/estate/list.css"/>
<Link rel="stylesheet" href="../resources/css/include/header.css"/>
<Link rel="stylesheet" href="../resources/css/include/footer.css"/>
    <title>찾아방</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<div class="wrapper">
    <main class="main-container">
        <div class="estate-header">
            <div class="type-menu-container">
                <ul class="type-menu">
				    <li><button class="onetwo" data-type="onetwo">원룸/투룸</button></li>
				    <li><button class="apartment" data-type="apart">아파트</button></li>
				    <li><button class="villa" data-type="villa">주택/빌라</button></li>
				    <li><button class="officetel" data-type="officetel">오피스텔</button></li>
				</ul>
            </div>
            <c:if test="${userRole eq 'R'}">
			    <div class="add-estate-btn">
			        <button onClick="location.href='/chazabang/insert'">매물등록</button>
			    </div>
			</c:if>
            <div class="search-container">
                <form method="get" action="/chazabang/list" class="search-container">
				    <input type="text" name="keyword" class="input-keyword" placeholder="주소 검색" value="${param.keyword}">
				    <button type="submit" class="search-btn">검색</button>
				</form>
            </div>
        </div>
        <div class="estate-grid">
        	<c:forEach items="${estList }" var="est">
	            <a href="/chazabang/detail/${est.estateNo }" class="estate" data-type="${est.estateType}">
	                <div class="estate-style">
	                    <img src="${est.estateFileList[0].estateFilePath}" alt="이미지 준비중">

	                        <section class="estate-inf">
	                            <div class="estate-inf-header">
	                            <c:if test="${est.estateRentType eq 'charter'}">
								    <div class="estate-rent">전세 ${est.transformEstateDeposit}</div>
								</c:if>
								<c:if test="${est.estateRentType eq 'monthly'}">
								    <div class="estate-rent">월세 ${est.transformEstateDeposit}/${est.transformMonthlyRent}</div>
								</c:if>
	                            <span class="estate-type">
	                            	<c:if test="${est.estateType eq 'onetwo'}">
			                        	<span class="estate-type">원룸/투룸</span>
			                        </c:if>
			                        <c:if test="${est.estateType eq 'villa'}">
			                        	<span class="estate-type">주택/빌라</span>
			                        </c:if>
			                        <c:if test="${est.estateType eq 'apart'}">
			                        	<span class="estate-type">아파트</span>
			                        </c:if>
			                        <c:if test="${est.estateType eq 'officetel'}">
			                        	<span class="estate-type">오피스텔</span>
			                        </c:if>
	                            </span>
	                        </div>
	                        <span class="estate-floor-and-width">${est.estateFloor }층, ${est.estateWidth }㎡</span>
	                        <span class="estate-address">${est.estateAddress }</span>
	                    </section>
	                </div>
	            </a>
        	</c:forEach>
        </div>
    </main>
	</div>
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    <script>
		document.addEventListener("DOMContentLoaded", function () {
		    const buttons = document.querySelectorAll(".type-menu button");
		    const estates = document.querySelectorAll(".estate");
		
		    let selectedType = null; // 현재 선택된 타입
		
		    buttons.forEach(button => {
		        button.addEventListener("click", function () {
		            const type = this.getAttribute("data-type");
		
		            // 같은 버튼을 다시 누른 경우 => 초기화
		            if (selectedType === type) {
		                selectedType = null;
		
		                // 스타일 초기화
		                buttons.forEach(btn => {
		                    btn.style.backgroundColor = ""; 
		                    btn.style.border = "";
		                    btn.style.color = "";
		                });
		
		                // 전체 매물 다시 보여줌
		                estates.forEach(estate => {
		                    estate.style.display = "block";
		                });
		
		                return; // 종료
		            }
		
		            // 새로운 버튼 선택
		            selectedType = type;
		
		            // 버튼 스타일 적용
		            buttons.forEach(btn => {
		                btn.style.backgroundColor = ""; 
		                btn.style.border = "";
		                btn.style.color = "";
		            });
		            this.style.backgroundColor = "transparent";
		            this.style.border = "1px solid #FF7C45";
		            this.style.color = "#FF7C45";
		
		            // 매물 필터링
		            estates.forEach(estate => {
		                const estateType = estate.getAttribute("data-type");
		                estate.style.display = (estateType === type) ? "block" : "none";
		            });
		        });
		    });
		});
	</script>
</body>
</html>