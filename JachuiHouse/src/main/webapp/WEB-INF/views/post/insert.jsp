<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="../resources/css/include/header.css">
	    <link rel="stylesheet" href="../resources/css/include/footer.css">
	    <link rel="stylesheet" href="../resources/css/post/insert.css">
	</head>
	<body>
        <div id="container">
        	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
            <div class="main">
            	<form action="/post/insert" method="post">
            	
                <div class="write">
                    <div class="head">
                        <h1>자취록 작성하기</h1>
                    </div>
                    <div class="title">
                        <select name="postType" id="title">
                            <option value="">선택</option>
                            <option value="자유" class="free">자유</option>
                            <option value="꿀팁" class="tip">꿀팁</option>
                            <option value="질문" class="qna">질문</option>
                            <input name="postTitle" type="text" class="inputtitle" placeholder="제목을 입력하세요">
                        </select>
                    </div>
                    <div class="content">
                        <input name="postContent" type="text" class="inputcontent" placeholder="내용을 입력하세요">
                    </div>
                    <div class="btn">
                        <button class="writebtn" type="submit">작성하기</button>
                        <button class="backbtn" type="submit">뒤로가기</button>
                    </div>
                </div>
                </form>
            </div>
        	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
        </div>		
	</body>
</html>