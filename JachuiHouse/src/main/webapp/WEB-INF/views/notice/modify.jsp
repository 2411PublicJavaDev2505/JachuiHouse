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
		<form class="report-form" action="/notice/modify" method="post" enctype="multipart/form-data">
    	<jsp:include page="/WEB-INF/views/include/header.jsp" />
		    <main class="detail-container">
	            <h2>공지사항 수정</h2>
	            
	            <input type="hidden" name="noticeNo" value="${notice.noticeNo}" />
	            <input type="hidden" name="userId" value="${notice.userId}" />
				
				<div class="detail-box">
						<div class="info-row">
						  <div class="label">공지종류</div>
						  <div>
						    <label><input type="radio" name="noticeType" value="공통" checked /> 공통</label>
						    <label><input type="radio" name="noticeType" value="공인중개사" /> 공인중개사</label>
						    <label><input type="radio" name="noticeType" value="자취생" /> 자취생</label>
						  </div>
						</div>

	            
	            	<div class="info-row">
			            <div class="label">공지제목</div>
			            <div>
			            	<input class="add" type="text" id="" name="noticeTitle" value="${notice.noticeTitle }" placeholder="제목">
			            </div>
		            </div>
		            
		            <div class="info-row">
		                <div class="label">상세내용</div>
		                <div>
<!-- 		                <textarea>는 input과 다르게 value 속성이 없고, 값은 시작 태그와 종료 태그 사이에 출력해야 합니다. -->

			                <textarea class="add description" id="real-product-detail" 
			                name="noticeContent" rows="10" 
			                placeholder="내용 입력란">${notice.noticeContent }</textarea>
	                	</div>
	              	</div>
	               
	                <div class="info-row">
		                <div class="label">첨부파일</div>
		                <div class="add">
			                <span><a href="..${notice.noticeFilePath }">${notice.noticeFileName }</a></span>
							<input type="file" name="reloadFile" onchange="readURL(this)">
	                	</div>
	              	</div>
	            
	        		<button type="submit" class="btn">등록하기</button>
		        </div>
	        </main>
	
		</form>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		
	</body>
</html>