<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자취록 리스트</title>
	    <link rel="stylesheet" href="../resources/css/include/header.css">
	    <link rel="stylesheet" href="../resources/css/include/footer.css">
	    <link rel="stylesheet" href="../resources/css/post/list.css">

	</head>
	<body>
	   	<div id="container"></div>
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
	                     		<c:forEach var="post" items="${searchList }">
	                        <tr>
	                            <td style="width : 150px;">
	                            	<c:choose>
	                            		<c:when test="${post.postType == '자유' }">
	                            			<span class="pType-free">${post.postType }</span>
	                            		</c:when>	
	                            		<c:when test="${post.postType == '꿀팁' }">
	                            			<span class="pType-tip">${post.postType }</span>
	                            		</c:when>	
	                            		<c:when test="${post.postType == '질문' }">
	                            			<span class="pType-qna">${post.postType }</span>
	                            		</c:when>	
	                            	</c:choose>
	                            </td>
	                            <td style="width : 700px;"><a href="/post/detail?postNo=${post.postNo }">${post.postTitle }</a></td>
	                            <td>${post.userId }</td>
	                            <td>${post.writeDate }</td>
	                        </tr>
                      	</c:forEach>
                   </table>	                    	
               	</div>
	               	            <!-- 검색 결과 없음 메시지 -->
	            <c:if test="${empty searchList}">
	                <div class="no-result">검색 결과가 없습니다.</div>
	            </c:if>
	            <c:if test="${not empty searchList }">
		            <div class="pagination-container">
					    <div class="pagination">
					
					        <c:if test="${currentPage > 1}">
					            <a href="/post/search?page=1&searchKeyword=${searchKeyword}&category=${category}" class="first">◁◁</a>
					            <a href="/post/search?page=${startNavi - 1}&searchKeyword=${searchKeyword}&category=${category}" class="prev">◀</a>
					        </c:if>
				        	<c:forEach begin="${startNavi}" end="${endNavi}" var="p">
					            <a href="/post/search?page=${p}&searchKeyword=${searchKeyword}&category=${category}" class="${p == currentPage ? 'active' : ''}">${p}</a>
					        </c:forEach>
					
					        <!-- endNavi + 1이 maxPage보다 작을 때만 출력 -->
					        <c:if test="${endNavi < maxPage}">
					            <a href="/post/search?page=${endNavi + 1}&searchKeyword=${searchKeyword}&category=${category}" class="next">▶</a>
					        </c:if>
					
					        <c:if test="${currentPage < maxPage}">
					            <a href="/post/search?page=${maxPage}&searchKeyword=${searchKeyword}&category=${category}" class="last">▷▷</a>
					        </c:if>
					
				    	</div>
					</div>
	            </c:if>
               						
            </div>
	        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>		
        </div>
	</body>
</html>