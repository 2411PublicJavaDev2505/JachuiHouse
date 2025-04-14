<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사방팔아방 상세페이지</title>
        <link rel="stylesheet" href="../resources/css/header.css">
	    <link rel="stylesheet" href="../resources/css/trade/insert.css">
	    <link rel="stylesheet" href="../resources/css/footer.css">
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
                    <a href="#">사방팔방</a>
                </div>
                <div class="loginBtn">
                    <a href="#">로그인</a>
                </div>
            </header>
    
        <main class="detail-container">
          <h2>사방팔아방 등록페이지</h2>
      
          <div class="detail-box">
            <div class="info-row">
              <div class="label">작성자</div>
              <div class="value">${trade.userId}USER01</div>
            </div>
      
            <div class="info-row">
              <div class="label">물품명</div>
              <div class="value">${trade.tradeTitle}중고 옷걸이</div>
            </div>
      
            <div class="info-row">
                <div class="label">이미지</div>
                <div class="value image-wrapper">
                    <img src="../resources/img/중고 옷걸이.jpg" alt="이미지 썸네일">
                </div>
              </div>
      
            <div class="info-row">
                <div class="label">상세내용</div>
                <div class="value description">${trade.tradeContent}좁은 공간 또는 여행지에서 빨래를 건조하거나,<br>
                  옷을 걸 때 유용한 도구<br><br>
                  창틀, 등(0.15~8.3cm)에 고정시켜주면<br>
                  간단한 옷걸이가 완성돼요<br>
                  색상은 랜덤입니다
                </div>
              </div>
              
              <div class="info-row">
                <div class="label">첨부파일</div>
                <div class="value">
                  <span class="file-button">첨부파일</span>
                  <span class="file-name">
                    <a href="../..${trade.fileName}" download alt>${trade.fileName}중고 옷걸이</a>
                </span>
                </div>
              </div>
          </div>
          <div class="register-button-wrapper">
            <button class="register-button" onclick="handleRegist()">등록</button>
          </div>

          <script>
            function handleRegist() {
              alert("게시글이 등록록되었습니다");
              // 실제 수정 동작 연결은 여기에
              location.href = "/trade/list";
            }
          </script>

        </main>
        <footer>
            이용약관 | 광고문의 | 개인정보처리방침 | 찾아오시는길 | 회사명: 자취스크립트(주) | 대표자 : 강우혁 | 문의 전화: 010-2222-3333
        </footer>
        </div>
      </body>
      </html>