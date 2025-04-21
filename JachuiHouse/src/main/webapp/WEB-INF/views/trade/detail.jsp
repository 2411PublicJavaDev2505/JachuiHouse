<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
              <div class="label">가격</div>
              <div class="value">${trade.tradePrice}</div>
            </div>
            
            <c:if test="${not empty trade.tradeFileRename}">
			  <div class="info-row image-row">
			    <div class="label">상품 이미지</div>
			    <div class="value image-box">
			      <img src="${pageContext.request.contextPath}/resources/bUploadFiles/${trade.tradeFileRename}" 
			           alt="${trade.tradeTitle}" 
			           class="product-image"/>
			    </div>
			  </div>
			</c:if>
      
            <div class="info-row description-row">
                <div class="label">상세내용</div>
                <div class="value description">${trade.tradeContent}</div>
            </div>
              
              <%-- <div class="info-row">
                <div class="label">이미지 변경</div>
                <div class="value">
                  <span class="file-button">첨부파일</span>
                  <span class="file-name">
                    <a href="${pageContext.request.contextPath}/resources/img/${trade.tradeFileRename}" download>
					    ${trade.tradeFilename}
					</a>
                  </span>
                </div>
              </div> --%>
          </div>
          
          <c:if test="${trade.userId eq sessionScope.userId}">
	          <div class="button-container">
	            <button class="custom-button" onclick="handleUpdate()">수정</button>
	            <button class="custom-button" onclick="handleDelete()">삭제</button>
	          </div>
          </c:if>

          <script>
			  function handleUpdate() {
			    const tradeNo = "${trade.tradeNo}";
			    location.href = "/trade/update/" + tradeNo; // 수정 페이지로 이동
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