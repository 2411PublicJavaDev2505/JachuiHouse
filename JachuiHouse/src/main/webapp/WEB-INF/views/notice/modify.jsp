<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 - 수정</title>
			<link rel="stylesheet" href="../../resources/css/include/header.css">
			<link rel="stylesheet" href="../../resources/css/notice/add.css">
			<link rel="stylesheet" href="../../resources/css/include/footer.css">
	</head>
	<body>
		<form class="report-form" action="/notice/add" method="post" enctype="multipart/form-data">
    	<jsp:include page="/WEB-INF/views/include/header.jsp" />
		    <main class="detail-container">
	            <h2>공지사항 수정</h2>
				
				<div class="detail-box">
	            	<div class="info-row">
	            		<div class="label">공지종류</div>
	                	<div class="">
							<input type="radio" name="noticeType" checked>공통
							<input type="radio" name="noticeType">공인중개사
							<input type="radio" name="noticeType">자취생
						</div>
					</div>
	            
	            	<div class="info-row">
			            <div class="label">공지제목</div>
			            <div>
			            	<input class="value" type="text" id="" name="noticeTitle" value="${notice.noticeTitle }" placeholder="제목">
			            </div>
		            </div>
		            
		            <div class="info-row">
		                <div class="label">상세내용</div>
		                <div>
			                <textarea class="value description" id="real-product-detail" 
			                value="${notice.noticeContent }" name="noticeContent" rows="10" 
			                placeholder="내용 입력란"></textarea>
	                	</div>
	              	</div>
	               
	                <div class="info-row">
		                <div class="label">첨부파일</div>
		                <div class="value">
			                <span><a href="..${notice.noticeFilePath }">${notice.noticeFileName }</a></span>
							<input type="file" name="uploadFile" onchange="readURL(this)">
	                	</div>
	              	</div>
	            
	        		<button type="submit" class="btn">등록하기</button>
		        </div>
	        </main>
	
		</form>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</body>
</html>