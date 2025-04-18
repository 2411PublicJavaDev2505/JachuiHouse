<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
      
          <form action="${pageContext.request.contextPath}/trade/insert" method="post" enctype="multipart/form-data" class="detail-box">
  
		    <div class="info-row">
		      <div class="label">작성자</div>
		      <div class="value">
		        <input type="text" name="userId" required />
		      </div>
		    </div>
		
		    <div class="info-row">
		      <div class="label">물품명</div>
		      <div class="value">
		        <input type="text" name="tradeTitle" required />
		      </div>
		    </div>

		    <div class="info-row">
		      <div class="label">상품이미지</div>
		      <div class="value image-wrapper">
		        <input type="file" name="uploadFile" />
		      </div>
		    </div>
		
		    <div class="info-row">
		      <div class="label">상세내용</div>
		      <div class="value">
		        <input type="text" name="tradeContent" required />
		      </div>
		    </div>
		
		
		    <div class="info-row">
		      <div class="label">첨부파일</div>
		      <div class="value description">
		        <textarea name="tradeContent" rows="5" required></textarea>
		      </div>
		    </div>
		
		    <div class="register-button-wrapper">
		      <button type="submit" class="register-button">등록</button>
		    </div>

	          <script>
	            function handleRegist() {
	              alert("게시글이 등록되었습니다");
	              // 실제 수정 동작 연결은 여기에
	              location.href = "/trade/list";
	            }
	          </script>
          </form>
		</main>
         <jsp:include page="/WEB-INF/views/include/footer.jsp" />
        </div>
      </body>
      </html>