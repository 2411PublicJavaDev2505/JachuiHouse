<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <form action="/notice/detail" method="get">
    	<jsp:include page="/WEB-INF/views/include/header.jsp" />
        <main class="detail-container">
          <h2>공지사항 상세페이지</h2>
      
          <div class="detail-box">
            <div class="info-row">
              <div class="label">등록일</div>
              <div class="value">${notice.noticeWriteDate}</div>
            </div>
      
            <div class="info-row">
              <div class="label">제목</div>
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
     	    <button type = "submit" class="btn" >
			<a style='text-decoration:none;' href = "/notice/modify/${notice.noticeNo }" 
			onclick="modifylist">수정하기</a></button>
     		<button type = "submit" class="btn" >
			<a style='text-decoration:none;' href = "/notice/delete?noticeNo=${notice.noticeNo }"=${notice.noticeNo }" 
			onclick="deletelist">삭제하기</a></button>
        </main>
        </form>
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>