<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<Link rel="stylesheet" href="../resources/css/estate/list.css"/>
<Link rel="stylesheet" href="../resources/css/include/header.css"/>
<Link rel="stylesheet" href="../resources/css/include/footer.css"/>
    <title>Document</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<div class="wrapper">
    <main class="main-container">
        <div class="estate-header">
            <div class="type-menu-container">
                <ul class="type-menu">
                    <li>
                        <button class="onetwo">원룸/투룸</button>
                    </li>
                    <li>
                        <button class="apartment">아파트</button>
                    </li>
                    <li>
                        <button class="villa">주택/빌라</button>
                    </li>
                    <li>
                        <button class="officetel">오피스텔</button>
                    </li>
                </ul>
            </div>
            <div class="add-estate-btn">
                <button>매물등록</button>
            </div>
            <div class="search-container">
                <input type="text" class="input-keyword">
                <button class="search-btn">검색</button>
            </div>
        </div>
        <div class="estate-list">
            <a href="/chazabang/detail" class="estate">
                <div class="estate-style">
                    <img src="../resources/images/estate/좋아보이느집.jpg" alt="이미지 준비중입니다...">
                        <section class="estate-inf">
                            <div class="estate-inf-header">
                                <p class="estate-rent">월세 200/95</p>
                            <span class="estate-type">원룸</span>
                        </div>
                        <span class="estate-floor-and-width">3층, 20㎡</span>
                        <span class="estate-address">서울시 노원구 상계동</span>
                    </section>
                </div>
            </a>
        </div>
    </main>
	</div>
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        const buttons = document.querySelectorAll(".type-menu button");

        buttons.forEach(button => {
            button.addEventListener("click", function () {
                // 모든 버튼 초기화
                buttons.forEach(btn => {
                    btn.style.backgroundColor = ""; // 배경색 제거
                    btn.style.border = "";
                    btn.style.color = "";
                });
                // 클릭된 버튼 스타일 적용
                this.style.backgroundColor = "transparent";
                this.style.border = "1px solid #FF7C45";
                this.style.color = "#FF7C45";
            });
        });
    });
</script>

</body>
</html>