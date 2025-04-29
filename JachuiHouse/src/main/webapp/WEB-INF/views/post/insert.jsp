
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자취록 작성</title>
		<link rel="stylesheet" href="../resources/css/include/header.css">
	    <link rel="stylesheet" href="../resources/css/include/footer.css">
	    <link rel="stylesheet" href="../resources/css/post/insert.css">
	</head>
	<body>
        <div id="container">
        	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
            <div class="main">
				<form action="/post/insert" method="post" onsubmit="return validateForm();">
				    <div class="write">
				        <div class="head">
				            <h1>자취록 작성하기</h1>
				        </div>
				        <div class="title">
				            <select name="postType" id="postType">
				                <option value="" disabled selected>게시판 선택</option>
				                <option value="자유" class="free">자유</option>
				                <option value="꿀팁" class="tip">꿀팁</option>
				                <option value="질문" class="qna">질문</option>
				            </select>
				            <input name="postTitle" type="text" class="inputtitle" placeholder="제목을 입력하세요" id="postTitle">
				        </div>
				        <div class="content">
				            <textarea name="postContent" class="inputcontent" placeholder="내용을 입력하세요" id="postContent"></textarea>
				        </div>
				        <div class="btn">
				            <button class="writebtn" type="submit">작성하기</button>
				            <button class="backbtn" type="button" onclick="location.href='/post/list'">뒤로가기</button>
				        </div>
				    </div>
				</form>
            </div>
        	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
        </div>		
		<script>
			function validateForm() {
			    var postType = document.getElementById('postType').value;
			    
			    if (postType === "none") {
			        alert("게시판을 선택하세요!");
			        return false; // 제출 막기
			    }
			    return true; // 정상 제출
			}
			
			function validateForm() {
			    const postType = document.getElementById("postType").value;
			    const title = document.getElementById("postTitle").value.trim();
			    const content = document.getElementById("postContent").value.trim();

			    if (postType === "") {
			        alert("게시판을 선택해주세요!");
			        return false;
			    }

			    if (title === "") {
			        alert("제목을 작성해주세요!");
			        return false;
			    }

			    if (content === "") {
			        alert("내용을 작성해주세요!");
			        return false;
			    }

			    return true; // 모든 값이 채워졌으면 제출
			}
		</script>
	</body>
</html>