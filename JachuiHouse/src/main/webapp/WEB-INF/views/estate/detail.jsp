<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>찾아방 상세 페이지</title>
		<Link rel="stylesheet" href="../resources/css/estate/detail.css"/>
		<Link rel="stylesheet" href="../resources/css/include/header.css"/>
		<Link rel="stylesheet" href="../resources/css/include/footer.css"/>
	</head>
	<body>
        <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        <div class="wrapper">
		<main class="main-container">
            <div class="estate-card">
                <c:if test="${userId eq estate.userId}">
                    <a href="/chazabang/modify">
                        <button class="edit-btn" >수정</button>
					</a>
				</c:if>
				<div class="image-placeholder">
                    <button>◁</button>
					<img src="../resources/images/estate/좋아보이느집.jpg" alt="등록된 사진이 없습니다."/>
                    <button>▷</button>
				</div>
				<div class="estate-conatact">
                    <div class="chat-btn">
                        <button>1:1 채팅문의</button>
                    </div>
					<div class="realtor-phone">
                        010-0000-0000
                    </div>
				</div>
                <div class="estate-info">
                    <div class="estate-info-1">
                        <span class="info-title">거래정보</span>
                        <div class="estate-rent">월세 200/95</div>
                    </div>
                    <div class="estate-info-2">
                        <span class="info-title">주소</span>
                        <div class="estate-address">서울시 금천구 동산00로 000 00동 000호</div>
                    </div>
                    <div class="estate-info-3">
                        <span class="info-title">전용면적</span>
                        <div class="estate-width">25㎡</div>
                    </div>
                    <div class="estate-info-4">
                        <span class="info-title">형태</span>
                        <div class="estate-type">원룸</div>
                    </div>
                    <div class="estate-info-5">
                        <span class="info-title">층</span>
                        <div class="estate-floor">12층</div>
                    </div>
                    <div class="estate-info-6">
                        <span class="info-title">입주가능일</span>
                        <div class="estate-movein-date">즉시입주가능</div>
                    </div>
                    <div class="estate-info-7">
                        <span class="info-title">옵션</span>
                        <div class="estate-option">에어컨, 세탁기, 인덕션, 냉장고</div>
                    </div>
                </div>
            </div>
        </main>
    	</div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
    </html>