<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	    <link rel="stylesheet" href="../resources/css/include/header.css">
	    <link rel="stylesheet" href="../resources/css/include/footer.css">
	    <link rel="stylesheet" href="../resources/css/post/list.css">
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
        <div id="container">
            <div class="main">
                <div class="search">
                    <select name="boardbtn" id="boardbtn">
                        <option value="">전체 게시판</option>
                        <option value="">자유 게시판</option>
                        <option value="">꿀팁 게시판</option>
                        <option value="">질문 게시판</option>
                    </select>
                    <input class="searchplace" type="text" placeholder="제목으로 검색어를 입력하세요.">
                    <button class="searchbtn">검색</button>
                </div>
                <div class="board">
                    <button class="writebtn">작성하기</button>
                    <table class="boardtbl">
                        <tr>
                            <th>게시판 종류</th>
                            <th>공고글 제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>
                        <tr>
                            <td>자유</td>
                            <td>04/07(금) 저녁 8시에 술 한 잔 하실분~</td>
                            <td>user01</td>
                            <td>25/04/04</td>
                        </tr>
                        <tr>
                            <td>꿀팁</td>
                            <td>이중 창 아닌 집 결로 안생기게 하는 꿀팁!</td>
                            <td>user02</td>
                            <td>25/04/06</td>
                        </tr>
                        <tr>
                            <td>질문</td>
                            <td>집에 날파리 안나오게 하는 방법 뭐가 있을까요?</td>
                            <td>user03</td>
                            <td>25/04/08</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>		
	</body>
</html>