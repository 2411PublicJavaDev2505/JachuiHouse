<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사방팔아방 - 목록</title>
    
    <!-- 공통 스타일 시트 -->
    <link rel="stylesheet" href="../resources/css/include/header.css">
    <link rel="stylesheet" href="../resources/css/trade/list.css">
    <link rel="stylesheet" href="../resources/css/include/footer.css">
</head>
<body>
    <div id="container">
    	<!-- 공통 헤더 포함 -->
        <jsp:include page="/WEB-INF/views/include/header.jsp" />

        <main class="container">
            <!-- 검색창 -->
            <form action="/trade/search" method="get">
                <div class="search-bar">
                	<!-- 검색 조건 선택: 제목 or 작성자 -->
                    <select name="category" class="dropdown">
                        <option value="title">물품명</option>
                        <option value="writer">작성자</option>
                    </select>
                    
                    <!-- 검색어 입력 -->
                    <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요" class="search-input"/>
                    <!-- 검색 버튼 -->
                    <button type="submit" class="search-btn" onclick="handlerSearch()">검색</button>
                </div>
            </form>

            <!-- 관리자 전용 글쓰기 버튼 -->
            <c:if test="${userRole eq 'M'}">
                <form class="write-btn" action="/trade/insert" method="get">
                  	<!-- 관리자만 글쓰기 가능 -->
                    <button onClick="location.href='/trade/insert'">게시글 작성</button>
                </form>
            </c:if>

            <!-- 상품 리스트(목록 영역) -->
            <div class="product-list">
                <c:forEach var="trade" items="${tList}">
                    <div class="product-card">
                    	<!-- 거래 상세페이지로 이동하는 링크 (이미지 클릭) -->
                        <a href="/trade/detail/${trade.tradeNo}" class="trade">
                            <img src="${trade.tradeFilepath}" alt="${trade.tradeTitle}">
                        </a>
                        
                        <!-- 거래 제목, 가격, 조회수 출력 -->
                        <div class="product-title">${trade.tradeTitle}</div>
                        <div class="product-price">${trade.tradePrice}원</div>
                        <div class="product-views">조회수 ${trade.viewCount}</div>
                        
                        <!-- 거래 상태 출력: Y(판매중), N(거래완료) -->
                        <div class="product-yn">
                            상태:
                            <c:choose>
                                <c:when test="${trade.tradeYn == 'Y'}">판매중</c:when>
                                <c:when test="${trade.tradeYn == 'N'}">거래완료</c:when>
                                <c:otherwise>상태 미지정</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- 페이지 네비게이션 -->
            <c:if test="${not empty tList}">
                <div class="pagination-container">
                    <div class="pagination">

                        <!-- [◁◁] 첫 페이지로 이동 / [◀] 이전 페이지로 이동 -->
                        <c:if test="${currentPage > 1}">
                            <a href="/trade/list?page=1" class="first">◁◁</a>
                            <a href="/trade/list?page=${currentPage - 1}" class="prev">◀</a>
                        </c:if>

                        <!-- 페이지 번호 리스트 출력 -->
                        <c:forEach begin="${startNavi}" end="${endNavi}" var="p">
                            <a href="/trade/list?page=${p}" class="${p == currentPage ? 'active' : ''}">${p}</a>
                        </c:forEach>

                        <!-- [▶] 다음 페이지로 이동 / [▷▷] 마지막 페이지로 이동 -->
                        <c:if test="${currentPage < maxPage}">
                            <a href="/trade/list?page=${currentPage + 1}" class="next">▶</a>
                            <a href="/trade/list?page=${maxPage}" class="last">▷▷</a>
                        </c:if>
                    </div>
                </div>
            </c:if>
        </main>
        
        <!-- 공통 푸터 포함 -->
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
</body>
</html>