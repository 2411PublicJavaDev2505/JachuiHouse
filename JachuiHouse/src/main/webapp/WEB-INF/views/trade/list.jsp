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
                        <img src="${pageContext.request.contextPath}/resources/img/${empty trade.tradeFileRename ? 'default.png' : trade.tradeFileRename}" 
     						alt="${trade.tradeTitle}">
                    </a>
                    <div class="product-title">${trade.tradeTitle}</div>
                    <div class="product-price">${trade.tradePrice}원</div>
                </div>
            </c:forEach>
        </div>


        <div class="pagination">
            <a href="#" class="arrow">◀◁</a>
            <a href="#" class="page-num active">1</a>
            <a href="#" class="page-num active">2</a>
            <a href="#" class="page-num active">3</a>
            <a href="#" class="page-num active">4</a>
            <a href="#" class="page-num active">5</a>
            <a href="#" class="page-num active">6</a>
            <a href="#" class="page-num active">7</a>
            <a href="#" class="page-num active">8</a>
            <a href="#" class="page-num active">9</a>
            <a href="#" class="page-num active">10</a>
            <a href="#" class="arrow">▷▶</a>
        </div>
    
    </main>
   	 	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    
    </body>
    </html>