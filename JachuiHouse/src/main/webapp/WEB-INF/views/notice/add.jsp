<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Notice - add </title>
</head>

<body>
	<form action="/notice/add" method="post" enctype="multipart/form-data">
		<div id="notice-div">
            <div id="add">
                <h1 id="notice-detail">공지사항 작성</h1>
                <hr>
            </div>
            
              <div id="noticeType">
                    분류
                </div>
                <div id="noticeType-detail">
	                <select id="inflPlatform-name" name = "noticeType">
						<option value="공통" selected>공통</option>
						<option value="공인중개사">공인중개사</option>
						<option value="자취생">자취생</option>
					</select>
				</div>
            
            <div id="detail">
                <div id="title">
                    제목
                </div>
                <div id="d2">
                    <input type="text" id="" name="noticeTitle" placeholder="제목">
                </div>

                <div id="noticeContent">
                    내용
                </div>
                <div id="noticeContent-detail">
                    <textarea id="real-product-detail" name="noticeContent" rows="10" cols="50" placeholder="내용 입력란"></textarea>
                </div>
               
                첨부파일 : <span><a href="..${NoticeVO.filePath }">${NoticeVO.fileName }</a></span>
				<input type="file" name="uploadFile" onchange="readURL(this)">
               
        		<button type="submit" class="add-button">등록하기</button>
            </div>
        </div>
	</form>
</body>
</html>