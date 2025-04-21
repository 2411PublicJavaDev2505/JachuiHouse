<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사방팔아방 - 목록</title>
        <link rel="stylesheet" href="../resources/css/include/header.css">
	    <link rel="stylesheet" href="../resources/css/trade/list.css">
	    <link rel="stylesheet" href="../resources/css/include/footer.css">
    </head>
    <body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/include/header.jsp" />
    
    <main class="container">
 
		<form action="/trade/search" method="get">
			<div class="search-bar">
				<select name="category" class="dropdown">
					<option value="title">제목</option>
					<option value="writer">작성자</option>
				</select>
				<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요" class="search-input"/>
				<button type="submit" class="search-btn" onclick="handlerSearch()">검색</button>
			</div>
		</form>
		<c:if test="${userRole eq 'M'}"> 
	        <form class="write-btn" action="/trade/insert" method="get">
	            <button onClick="location.href='/trade/insert'">게시글 작성</button>
	        </form>
        </c:if>
    
        <!-- 상품 리스트 -->
        <div class="product-list">
            <c:forEach var="trade" items="${tList}">
                <div class="product-card">
                    <a href="/trade/detail/${trade.tradeNo}" class="trade">
                        <img src="${pageContext.request.contextPath}/resources/bUploadFiles/${empty trade.tradeFileRename ? 'default.png' : trade.tradeFileRename}" 
     						alt="${trade.tradeTitle}">
                    </a>
                    <div class="product-title">${trade.tradeTitle}</div>
                    <div class="product-price">${trade.tradePrice}원</div>
                	<div class="product-views">조회수 ${trade.viewCount}</div>
                </div>
            </c:forEach>
        </div>


        <div class="pagination-container">
		    <div class="pagination">
		        <!-- 첫 페이지가 아닐 때만 '처음', '이전' 버튼 표시 -->
		        <c:if test="${currentPage > 1}">
		            <a href="/trade/list?page=1" class="first">◁◁</a>
		            <a href="/trade/list?page=${startNavi - 1}" class="prev">◀</a>
		        </c:if>
		
		        <!-- 페이지 숫자 -->
		        <c:forEach begin="${startNavi}" end="${endNavi}" var="p">
		            <a href="/trade/list?page=${p}" class="${p == currentPage ? 'active' : ''}">${p}</a>
		        </c:forEach>
		
		        <!-- 마지막 페이지가 아닐 때만 '다음', '끝' 버튼 표시 -->
		        <c:if test="${currentPage < maxPage}">
		            <a href="/trade/list?page=${endNavi + 1}" class="next">▶</a>
		            <a href="/trade/list?page=${maxPage}" class="last">▷▷</a>
		        </c:if>
		    </div>
		</div>
    </main>
   	 	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    
    </body>
    </html>