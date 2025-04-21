<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> Notice - add </title>
			<link rel="stylesheet" href="../../resources/css/include/header.css">
			<link rel="stylesheet" href="../../resources/css/notice/detail.css">
			<link rel="stylesheet" href="../../resources/css/include/footer.css">
	</head>
	<body>
<%-- 	<p>세션에 저장된 userId: ${sessionScope.userId}</p> --%>
	
        <form action="/notice/detail" method="get">
    	<jsp:include page="/WEB-INF/views/include/header.jsp" />
        <main class="detail-container">
        	<h2>공지사항 상세페이지</h2>
      
      	    <input type="hidden" name="userId" value="${notice.userId}" />
      	            
          	<div class="detail-box">
	            <div class="info-row">
		            <div class="label">등록일자</div>
		            <div class=""><fmt:formatDate pattern = "yyyy/MM/dd" value="${notice.noticeWriteDate}"/></div>
	            </div>
      
	            <div class="info-row">
		            <div class="label">공지종류</div>
		            <div class="value">${notice.noticeType}</div>
	            </div>
	            
	            <div class="info-row">
		            <div class="label">공지제목</div>
		            <div class="value">${notice.noticeTitle}</div>
	            </div>
      
            	<div class="info-row">
	                <div class="label">상세내용</div>
	                <div class="value description">${notice.noticeContent}
                </div>
              </div>
              
              	<div class="info-row">
	                <div class="label">첨부파일</div>
	                <div class="value">
	                    <span class="file-button">첨부파일</span>
	                    <span class="file-name">
                    		<a href="../..${notice.noticeFileName}" download>${notice.noticeFileName}</a>
                		</span>
                	</div>
              	</div>
          	</div><br>
          	

	            <c:if test="${sessionScope.userId == 'admin'}">
		     	    <button type = "submit" class="btn" >
						<a style='text-decoration:none;' href = "/notice/modify/${notice.noticeNo }" >수정하기</a>
					</button>
		     		<button type = "submit" class="btn" >
						<a style='text-decoration:none;' href = "/notice/delete?noticeNo=${notice.noticeNo }"=${notice.noticeNo }" >삭제하기</a>
					</button>
				</c:if>

        </main>
        </form>
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>