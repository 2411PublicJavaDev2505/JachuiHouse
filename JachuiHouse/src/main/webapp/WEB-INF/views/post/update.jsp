<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	    <link rel="stylesheet" href="../resources/css/include/header.css">
	    <link rel="stylesheet" href="../resources/css/include/footer.css">
	    <link rel="stylesheet" href="../resources/css/post/update.css">	
	</head>
	<body>
        <div id="container">
			<jsp:include page="/WEB-INF/views/include/header.jsp"/>
            <div class="main">
            	<form action="/post/update" method="POST" value="${result.postNo}">
				    <input type="hidden" name="postNo" value="${result.postNo}" />
				
				    <div class="write">
				        <div class="head">
				            <h1>자취록 수정하기</h1>
				        </div>
				        <div class="title">
				            <select name="postType" id="postType">
				                <option value="none" ${result.postType == 'none' ? 'selected' : ''}>선택</option>
				                <option value="자유" ${result.postType == '자유' ? 'selected' : ''}>자유</option>
				                <option value="꿀팁" ${result.postType == '꿀팁' ? 'selected' : ''}>꿀팁</option>
				                <option value="질문" ${result.postType == '질문' ? 'selected' : ''}>질문</option>
				            </select>
				            <input type="text" name="postTitle" class="inputtitle"
				                   value="${result.postTitle}" placeholder="수정 할 제목을 입력하세요" />
				        </div>
				        
				        <div class="content">
				            <textarea rows="" cols="" type="text" name="postContent" class="inputcontent"
				                   value="${result.postContent}" placeholder="수정할 내용을 입력하세요" ></textarea>
				        </div>
				        <div class="btn">
				            <button class="writebtn" type="submit">수정하기</button>
				            <button class="backbtn" type="button" onclick="location.href='/post/detail?postNo=${result.postNo}'">뒤로가기</button>
				        </div>
				    </div>
				</form>
            </div>
        	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
        </div>		
	</body>
</html>