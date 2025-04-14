<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	    <link rel="stylesheet" href="../resources/css/include/header.css">
	    <link rel="stylesheet" href="../resources/css/include/footer.css">
	    <link rel="stylesheet" href="../resources/css/post/detail.css">	
	</head>
	<body>
        <div id="container">
			<jsp:include page="/WEB-INF/views/include/header.jsp"/>
            <div class="main">
                <div class="write">
                    <div class="head">
                        <h1>자취록 수정하기</h1>
                    </div>
                    <div class="title">
                        <select name="title" id="title">
                            <option value="none">선택</option>
                            <option value="" class="free">자유</option>
                            <option value="" class="tip">꿀팁</option>
                            <option value="" class="qna">질문</option>
                            <input type="text" class="inputtitle" placeholder="수정 할 제목을 입력하세요">
                        </select>
                    </div>
                    <div class="content">
                        <input type="text" class="inputcontent" placeholder="수정할 내용을 입력하세요">
                    </div>
                    <div class="btn">
                        <button class="writebtn">수정하기</button>
                        <button class="backbtn">뒤로가기</button>
                    </div>
                </div>
            </div>
        	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
        </div>		
	</body>
</html>