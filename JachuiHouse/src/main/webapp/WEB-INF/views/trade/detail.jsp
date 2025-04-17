<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <h2>사방팔아방 상세페이지</h2>
      
          <div class="detail-box">
            <div class="info-row">
              <div class="label">작성자</div>
              <div class="value">${trade.userId}</div>
            </div>
      
            <div class="info-row">
              <div class="label">물품명</div>
              <div class="value">${trade.tradeTitle}</div>
            </div>
      
            <div class="info-row">
                <div class="label">상세내용</div>
                <div class="value description">${trade.tradeContent}</div>
            </div>
              
              <div class="info-row">
                <div class="label">첨부파일</div>
                <div class="value">
                  <span class="file-button">첨부파일</span>
                  <span class="file-name">
                    <a href="../..${trade.tradeFilepath}" download alt>${trade.tradeFilename}</a>
                  </span>
                </div>
              </div>
          </div>
        </main>
         <jsp:include page="/WEB-INF/views/include/footer.jsp" />
        </div>
      </body>
      </html>