<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자취록 리스트</title>
		<link rel="stylesheet" href="../resources/css/reset.css">
	    <link rel="stylesheet" href="../resources/css/include/header.css">
	    <link rel="stylesheet" href="../resources/css/include/footer.css">
	    <link rel="stylesheet" href="../resources/css/post/list.css">

	</head>
	<body>
        <div id="container">
			<jsp:include page="/WEB-INF/views/include/header.jsp"/>
            <div class="main">
            	<form action="/post/list">
	                <div class="search">
	                    <select name="postType" id="postType">
	                        <option value="none">전체 게시판</option>
	                        <option value="자유">자유 게시판</option>
	                        <option value="꿀팁">꿀팁 게시판</option>
	                        <option value="질문">질문 게시판</option>
	                    </select>
	                    <input class="searchplace" name="searchTitle" type="text" placeholder="제목으로 검색어를 입력하세요.">
	                    <button class="searchbtn" type="button"><a href="/post/search">검색</a></button>
	                </div>
	                <div class="board">
	                	
	                    	<button class="writebtn" ><a href="/post/insert">작성하기</a></button>
	                    <table class="boardtbl">
	                        <tr>
	                            <th>게시판 종류</th>
	                            <th>공고글 제목</th>
	                            <th>작성자</th>
	                            <th>작성일</th>
	                        </tr>
                       		<c:forEach var="post" items="${pList }">
		                        <tr>
		                            <td>${post.postType }</td>
		                            <td><a href="/post/detail?postNo=${post.postNo }">${post.postTitle }</a></td>
		                            <td>${post.userId }</td>
		                            <td>${post.writeDate }</td>
		                        </tr>
                        	</c:forEach>

	                    </table>
	                </div>
            </div>
	        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>		
        </div>
	</body>
</html>