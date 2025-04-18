<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사방팔아방 등록페이지</title>
        <link rel="stylesheet" href="/resources/css/include/header.css">
	    <link rel="stylesheet" href="/resources/css/trade/insert.css">
	    <link rel="stylesheet" href="/resources/css/include/footer.css">
    </head>
      <body>
        <div id="container">
             <jsp:include page="/WEB-INF/views/include/header.jsp" />
    
        <main class="detail-container">
          <h2>사방팔아방 등록페이지</h2>
      
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
                <div class="label">이미지</div>
                <div class="value image-wrapper">
                    <img src="../resources/img/중고 옷걸이.jpg" alt="이미지 썸네일">
                </div>
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
                    <a href="../..${trade.filename}" download alt>${trade.filename}</a>
                </span>
                </div>
              </div>
          </div>
          <div class="register-button-wrapper">
            <button class="register-button" onclick="handleRegist()">등록</button>
          </div>

          <script>
            function handleRegist() {
              alert("게시글이 등록되었습니다");
              // 실제 수정 동작 연결은 여기에
              location.href = "/trade/list";
            }
          </script>

        </main>
         <jsp:include page="/WEB-INF/views/include/footer.jsp" />
        </div>
      </body>
      </html>