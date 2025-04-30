<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사방팔아방 - 검색</title>
    <link rel="stylesheet" href="../resources/css/include/header.css">
    <link rel="stylesheet" href="../resources/css/trade/list.css">
    <link rel="stylesheet" href="../resources/css/include/footer.css">
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/include/header.jsp" />

        <main class="container">

            <!-- 검색창 -->
            <form action="/trade/search" method="get">
                <div class="search-bar">
                    <select name="category" class="dropdown">
                        <option value="title">물품명</option>
                        <option value="writer">작성자</option>
                    </select>
                    <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요" class="search-input"/>
                    <button type="submit" class="search-btn" onclick="handlerSearch()">검색</button>
                </div>
            </form>

            <!-- 관리자 전용 글쓰기 버튼 -->
            <c:if test="${userRole eq 'M'}">
                <form class="write-btn" action="/trade/insert" method="get">
                    <button onClick="location.href='/trade/insert'">게시글 작성</button>
                </form>
            </c:if>

            <!-- 상품 리스트 -->
            <div class="product-list">
                <c:forEach var="trade" items="${searchList}">
                    <div class="product-card">
                        <a href="/trade/detail/${trade.tradeNo}" class="trade">
                            <img src="${pageContext.request.contextPath}/resources/tUploadFiles/${empty trade.tradeFileRename ? 'default.png' : trade.tradeFileRename}" 
                                 alt="${trade.tradeTitle}">
                        </a>
                        <div class="product-title">${trade.tradeTitle}</div>
                        <div class="product-price">${trade.tradePrice}원</div>
                        <div class="product-views">조회수 ${trade.viewCount}</div>
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

            <!-- 검색 결과 없음 메시지 -->
            <c:if test="${empty searchList}">
                <div class="no-result">검색 결과가 없습니다.</div>
            </c:if>

            <!-- 페이지 네비게이션 -->
			<c:if test="${not empty searchList}">
			    <div class="pagination-container">
			        <div class="pagination">
			
			            <!-- 이전 버튼 -->
			            <c:if test="${currentPage > 1}">
			                <c:choose>
			                    <c:when test="${not empty param.category and not empty param.searchKeyword}">
			                        <a href="/trade/search?category=${param.category}&searchKeyword=${param.searchKeyword}&page=1" class="first">◁◁</a>
			                        <a href="/trade/search?category=${param.category}&searchKeyword=${param.searchKeyword}&page=${currentPage - 1}" class="prev">◀</a>
			                    </c:when>
			                    <c:otherwise>
			                        <a href="/trade/search?page=1" class="first">◁◁</a>
			                        <a href="/trade/search?page=${currentPage - 1}" class="prev">◀</a>
			                    </c:otherwise>
			                </c:choose>
			            </c:if>
			
			            <!-- 페이지 번호 -->
			            <c:forEach begin="${startNavi}" end="${endNavi}" var="p">
			                <a href="/trade/search?page=${p}&category=${param.category}&searchKeyword=${param.searchKeyword}" 
			                   class="${p == currentPage ? 'active' : ''}">${p}</a>
			            </c:forEach>
			
			            <!-- 다음 버튼 -->
			            <c:if test="${currentPage < maxPage}">
			                <c:choose>
			                    <c:when test="${not empty param.category and not empty param.searchKeyword}">
			                        <a href="/trade/search?category=${param.category}&searchKeyword=${param.searchKeyword}&page=${currentPage + 1}" class="next">▶</a>
			                        <a href="/trade/search?category=${param.category}&searchKeyword=${param.searchKeyword}&page=${maxPage}" class="last">▷▷</a>
			                    </c:when>
			                    <c:otherwise>
			                        <a href="/trade/search?page=${currentPage + 1}" class="next">▶</a>
			                        <a href="/trade/search?page=${maxPage}" class="last">▷▷</a>
			                    </c:otherwise>
			                </c:choose>
			            </c:if>
			        </div>
			    </div>
			</c:if>
        </main>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
</body>
</html>