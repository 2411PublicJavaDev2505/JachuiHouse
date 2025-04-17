<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
        <header>
            <a href="/">
            <div class="logo">
                <img src="../resources/img/logo.png" alt="logo">
            </div>
            </a> 
            <div class="nav">
                <a href="#">홈</a> 
                <a href="#">자취록</a>
                <a href="#">찾아방</a>
                <a href="trade/list">사방팔방</a>
            </div>
            <div class="loginBtn">
                <a href="#">로그인</a>
            </div>
        </header>
    
    <main class="container">
 
        <div class="search-bar">
            <form action="list.jsp" method="get">
                <select name="category" class="dropdown">
                    <option value="title">제목</option>
                    <option value="title">작성자</option>
                </select>
                <input type="text" name="keyword" placeholder="검색어를 입력하세요" class="search-input"/>
                <button type="submit" class="search-btn" onclick="handlerSearch()">검색</button>
            </form>
        </div>
    
        <form class="write-btn" action="/trade/insert" method="get">
            <button type="submit">게시글 작성</button>
        </form>
    
        <div class="product-list">
        <c:forEach var="trade" items="${tradeList}">
            <div class="product-card">
                <a href="/trade/detail/${trade.tradeNo}">
                    <img src="/resources/img/${trade.tradeFileRename}" alt="${trade.tradeTitle}">
                </a>
                <div class="product-title">${trade.tradeTitle}</div>
                <div class="product-price">${trade.tradePrice}원</div>
            </div>
        </c:forEach>
            <div class="product-card">
                <a href="/trade/detail/2">
                    <img src="../resources/img/욕실 발매트 러그.jpeg" alt="욕실 발매트 러그">
                </a>
                <div class="product-title">욕실 발매트 러그</div>
                <div class="product-price">가격 20,000</div>
            </div>
            <div class="product-card">
                <a href="/trade/detail/3">
                    <img src="../resources/img/중고 옷걸이.jpg" alt="옷걸이">
                </a>
                <div class="product-title">옷걸이</div>
                <div class="product-price">가격 1,000</div>
            </div>
            <div class="product-card">
                <a href="/trade/detail/4">
                    <img src="../resources/img/커피머신.jpg" alt="커피머신">
                </a>
                <div class="product-title">커피머신</div>
                <div class="product-price">가격 75,000</div>
            </div>
            <div class="product-card">
                <a href="/trade/detail/5">
                    <img src="../resources/img/조립식 옷장.jpeg" alt="조립식 옷장">
                </a>
                <div class="product-title">조립식 옷장</div>
                <div class="product-price">가격 55,000</div>
            </div>
            <div class="product-card">
                <a href="/trade/detail/6">
                    <img src="../resources/img/포메라니안(반려동물).jpg" alt="반려동물">
                </a>
                <div class="product-title">반려동물</div>
                <div class="product-price">가격 싯가</div>
            </div>
            <div class="product-card">
                <a href="/trade/detail/7">
                    <img src="../resources/img/빨래건조대.jpg" alt="빨래건조대">
                </a>
                <div class="product-title">빨래건조대</div>
                <div class="product-price">가격 5,000</div>
            </div>
            <div class="product-card">
                <a href="/trade/detail/8">
                    <img src="../resources/img/1인용 소파.jpg" alt="1인용 소파">
                </a>
                <div class="product-title">1인용 소파</div>
                <div class="product-price">가격 15,000</div>
            </div>
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
    <footer>
        이용약관 | 광고문의 | 개인정보처리방침 | 찾아오시는길 | 회사명: 자취스크립트(주) | 대표자 : 강우혁 | 문의 전화: 010-2222-3333
    </footer>
    </div>
    
    </body>
    </html>