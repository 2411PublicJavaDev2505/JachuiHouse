<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사방팔아방 상세페이지</title>
    <link rel="stylesheet" href="/resources/css/include/header.css">
    <link rel="stylesheet" href="/resources/css/trade/detail.css">
    <link rel="stylesheet" href="/resources/css/include/footer.css">
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/include/header.jsp" />

        <main class="detail-container">
            

            <div class="detail-box">
				<div class="top-info-bar">
                    <div class="chat-btn-wrapper">
                        <c:if test="${not empty sessionScope.userId and trade.userId ne sessionScope.userId}">
                            <a href="/chat/totrade?tradeNo=${tradeNo}">
                                <button class="chat-btn">1:1 채팅문의</button>
                            </a>
                        </c:if>
                    </div>

                    <div class="view-count-wrapper">
                        <span class="view-count-label">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" 
                                 viewBox="0 0 24 24" stroke="#f38b3f" fill="none" stroke-width="2" 
                                 stroke-linecap="round" stroke-linejoin="round">
                                <path d="M1 12s4-7 11-7 11 7 11 7-4 7-11 7S1 12 1 12z"/>
                                <circle cx="12" cy="12" r="3"/>
                            </svg>
                            조회수
                        </span>
                        <span class="view-count-number">${trade.viewCount}</span>
                    </div>
                </div>

                <div class="info-row">
                    <div class="label">작성자</div>
                    <div class="value">${trade.userId}</div>
                </div>

                <div class="info-row">
                    <div class="label">작성일</div>
                    <div class="value">${trade.writeDate}</div>
                </div>

                <div class="info-row">
                    <div class="label">물품명</div>
                    <div class="value">${trade.tradeTitle}</div>
                </div>

                <div class="info-row">
                    <div class="label">가격</div>
                    <div class="value">${trade.tradePrice}</div>
                </div>

                <c:if test="${not empty trade.tradeFileRename}">
                    <div class="info-row image-row">
                        <div class="label">상품 이미지</div>
                        <div class="value image-box">
                            <img src="${pageContext.request.contextPath}/resources/bUploadFiles/${trade.tradeFileRename}" 
                                 alt="${trade.tradeTitle}" class="product-image"/>
                        </div>
                    </div>
                </c:if>

                <div class="info-row description-row">
                    <div class="label">상세내용</div>
                    <div class="value description">${trade.tradeContent}</div>
                </div>

                <!-- 거래 상태 표시 -->
                <div class="info-row">
                    <div class="label">상태</div>
                    <div class="value">
                        <c:choose>
                            <c:when test="${trade.tradeYn == 'Y'}">
                                판매중
                            </c:when>
                            <c:otherwise>
                                <div class="trade-status complete">거래완료</div>
                                <div class="trade-date">
                                    <strong>거래 완료일:</strong>
                                    <c:if test="${not empty trade.tradeDate}">
                                        <fmt:formatDate value="${trade.tradeDate}" pattern="yyyy-MM-dd"/>
                                    </c:if>
                                    <c:if test="${empty trade.tradeDate}">
                                        <span>날짜 없음</span>
                                    </c:if>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <!-- 상태 변경 버튼 (작성자만 가능) -->
                <c:if test="${trade.userId eq sessionScope.userId}">
                    <form id="statusForm" method="post" action="${pageContext.request.contextPath}/trade/updateYn">
                        <input type="hidden" name="tradeNo" value="${trade.tradeNo}" />
                        <input type="hidden" name="tradeYn" id="tradeYnInput" />
                        <button type="button" class="custom-button" onclick="submitTradeStatus()">
                            <c:choose>
                                <c:when test="${trade.tradeYn == 'Y'}">거래완료로 변경</c:when>
                                <c:otherwise>판매중으로 변경</c:otherwise>
                            </c:choose>
                        </button>
                    </form>
                </c:if>

                <script>
                    function submitTradeStatus() {
                        const current = '${trade.tradeYn}';
                        const next = current === 'Y' ? 'N' : 'Y';
                        const confirmed = confirm("정말 거래 상태를 변경하시겠습니까?");
                        if (confirmed) {
                            document.getElementById("tradeYnInput").value = next;
                            document.getElementById("statusForm").submit();
                        }
                    }
                </script>

                <%-- 
                <div class="info-row">
                    <div class="label">이미지 변경</div>
                    <div class="value">
                        <span class="file-button">첨부파일</span>
                        <span class="file-name">
                            <a href="${pageContext.request.contextPath}/resources/img/${trade.tradeFileRename}" download>
                                ${trade.tradeFilename}
                            </a>
                        </span>
                    </div>
                </div> 
                --%>
            </div>

            <!-- 작성자에게만 수정/삭제 버튼 노출 -->
            <c:if test="${trade.userId eq sessionScope.userId}">
                <div class="button-container">
                	<button class="custom-button left-button" onclick="handleList()">목록</button> <!-- 목록 버튼 추가 -->
                    <button class="custom-button" onclick="handleUpdate()">수정</button>
                    <button class="custom-button" onclick="handleDelete()">삭제</button>
				</div>
            </c:if>

            <script>
			    function handleList() {
			        // 목록 페이지로 리디렉션
			        location.href = "/trade/list";  // trade/list는 목록 페이지 URL에 맞게 수정 필요
			    }
			    
                function handleUpdate() {
                    const tradeNo = "${trade.tradeNo}";
                    location.href = "/trade/update/" + tradeNo;
                }

                function handleDelete() {
                    const tradeNo = "${trade.tradeNo}";
                    const confirmed = confirm("정말 이 게시글을 삭제하시겠습니까?");
                    if (confirmed) {
                        location.href = "/trade/delete?tradeNo=" + tradeNo;
                    }
                }
            </script>
        </main>

        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
</body>
</html>