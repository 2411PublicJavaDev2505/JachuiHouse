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
                    <a href="/chazabang/modify">
                        <button class="edit-btn" >수정</button>
					</a>
				</c:if>
				<div class="image-placeholder">
                    <button>◁</button>
					<img src="${pageContext.request.contextPath}/resources/images/estate/좋아보이느집.jpg" alt="등록된 사진이 없습니다."/>
                    <button>▷</button>
				</div>
				<div class="estate-conatact">
                    <div class="chat-btn">
                        <button>1:1 채팅문의</button>
                    </div>
					<div class="realtor-phone">
                        ${estate.userPhone }
                    </div>
				</div>
                <div class="estate-info">
                    <div class="estate-info-1">
                        <span class="info-title">거래정보</span>
                        <div class="estate-rent">${estate.estateRentType } ${estate.estateDeposit }/${estate.estateMonthlyRent }</div>
                    </div>
                    <div class="estate-info-2">
                        <span class="info-title">주소</span>
                        <div class="estate-address">${estate.estateAddress }</div>
                    </div>
                    <div class="estate-info-3">
                        <span class="info-title">전용면적</span>
                        <div class="estate-width">${estate.estateWidth }㎡</div>
                    </div>
                    <div class="estate-info-4">
                        <span class="info-title">형태</span>
                        <div class="estate-type">${estate.estateType }</div>
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
                        	<div class="estate-option">
		                        <c:forEach items="${estate.estateOptionList }" var="option">
		                        		<span>${option.optionName }</span>
		                        </c:forEach>
                        	</div>
                    </div>
                </div>
            </div>
        </main>
    	</div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>