<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> Notice - add </title>
			<link rel="stylesheet" href="../resources/css/include/header.css">
			<link rel="stylesheet" href="../resources/css/notice/add.css">
			<link rel="stylesheet" href="../resources/css/include/footer.css">
		</head>
	<body>
    	<jsp:include page="/WEB-INF/views/include/header.jsp" />
    <main class="main">
		<div id="notice-div">
            
			<form class="report-form" action="/notice/add" method="post" enctype="multipart/form-data">
            <div id="add">
                <h2 id="notice-detail">공지사항 작성</h2>
                <hr>
            </div>
                <div class="">
                	<label>공지 종류</label>
						<input type="radio" name="noticeType" checked>공통
						<input type="radio" name="noticeType">공인중개사
						<input type="radio" name="noticeType">자취생
				</div>
            
                <div class="form-group">
                제목   <input type="text" id="" name="noticeTitle"  placeholder="제목">
				</div>

                <div class="form-group">
                    내용
                </div>
                <div id="noticeContent-detail">
                    <textarea id="real-product-detail" name="noticeContent" rows="10" cols="120" placeholder="내용 입력란"></textarea>
                </div>
               
                <div class="form-group">
                첨부파일 : <span><a href="..${NoticeVO.filePath }">${NoticeVO.fileName }</a></span>
				<input type="file" name="uploadFile" onchange="readURL(this)">
            	</div>
        		<button type="submit" class="btn">등록하기</button>
				</form>
            </div>
        </main>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</body>
</html>