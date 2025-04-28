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
            	<form action="/post/search" method="get">
				   <div class="search">
				       <select name="category" id="postType">
				           <option value="none">전체 게시판</option>
				           <option value="free" class="free">자유 게시판</option>
				           <option value="tip" class="tip">꿀팁 게시판</option>
				           <option value="qna" class="qna">질문 게시판</option>
				       </select>
				       <input class="searchplace" name="searchKeyword" type="text" placeholder="제목으로 검색어를 입력하세요.">
				       
				        <button class="searchbtn" type="submit">검색</button>
				    </div>
				</form>
	                <div class="board">
	                	<div class="writebtn-container">
	                    	<button class="writebtn" onclick="location.href='/post/insert'">작성하기</button>
	                    </div>	
	                    	<div class="table">
			                    <table class="boardtbl">
			                        <tr>
			                            <th>게시판 종류</th>
			                            <th>공고글 제목</th>
			                            <th>작성자</th>
			                            <th>작성일</th>
			                        </tr>
									
		                       		<c:forEach var="post" items="${pList }">
				                        <tr>
				                            <td style="width : 150px;">${post.postType }</td>
				                            <td style="width : 700px;"><a href="/post/detail?postNo=${post.postNo }">${post.postTitle }</a></td>
				                            <td>${post.userId }</td>
				                            <td>${post.writeDate }</td>
				                        </tr>
		                        	</c:forEach>
			                        <!--  <tr>
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
			                        </tr>-->
			                    </table>	                    	
	                    	</div>					
				            <div class="pagination-container">
				                <div class="pagination">
				
				                    <c:if test="${currentPage > 1}">
				                        <a href="/post/list?page=1" class="first">◁◁</a>
				                        <a href="/post/list?page=${startNavi - 1}" class="prev">◀</a>
				                    </c:if>
				
				                    <c:forEach begin="${startNavi}" end="${endNavi}" var="p">
				                        <a href="/post/list?page=${p}" class="${p == currentPage ? 'active' : ''}">${p}</a>
				                    </c:forEach>
				
				                    <c:if test="${currentPage < maxPage}">
				                        <a href="/post/list?page=${endNavi + 1}" class="next">▶</a>
				                        <a href="/post/list?page=${maxPage}" class="last">▷▷</a>
				                    </c:if>
				
				                </div>
           				 </div>
          			</div>
	        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>		
        </div>
	</body>
</html>