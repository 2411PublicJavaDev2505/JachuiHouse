<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Notice - list</title>
		<link rel="stylesheet" href="../resources/css/include/header.css">
		<link rel="stylesheet" href="../resources/css/notice/list.css">
		<link rel="stylesheet" href="../resources/css/include/footer.css">
	</head>   
<body>
    	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<main class="main">
    	<div id="notice-div">
        
        	<form class="report-form" action="/notice/search" method="get">
        		 <div class="search">
	        		 <input class="searchplace" type="text" placeholder="  제목으로 검색어를 입력하세요.">
	        		 <button class="btn" type="submit">검색</button>
        		 </div>	        
	        </form> 

        		 <div class="board">
        		 <!-- admin확인절차 넣어줘야 함 -->
        		 <%-- <c:if test="${member.userId == 'admin'}"> --%>
        		 	<button class="btn"><a href="/notice/add">게시글 등록</a></button>
        		 <%-- </c:if> --%>  
        		 </div>
        		 	
        	<table class="boardbl">
        		<tr>
        			<th>번호</th>
        			<th>공지 분류</th>
        			<th>공지 제목</th>
        			<th>작성일</th>
        		</tr>	
        		<c:forEach var="noticeVO" items="${nList}" varStatus="i">
        			<tr>
        				<td>${noticeVO.noticeNo }</td>
        				<td>${noticeVO.noticeType }</td>
        				<td><a href="/notice/detail/${noticeVO.noticeNo}">${noticeVO.noticeTitle}</a></td>
        				<!-- pathvariable있을때 ?쓰면 안됨 -->
        				<td>${noticeVO.noticeWriteDate }</td>
        			</tr>
        		</c:forEach>		 
        	</table>
        </div>

        <div class="pagination-container">
			<div class="pagination">
				<c:if test="${startNavi ne 1 }">
					<a href="/notice/list?page=${startNavi - 1 }" class="prev">&lt;</a>
				</c:if>
				<c:forEach begin="${startNavi }" end="${endNavi }" var="p">
					<a href="/notice/list?page=${p }">${p }</a>
				</c:forEach>
				<c:if test="${endNavi ne maxPage }">
					<a href="/notice/list?page=${endNavi + 1 }" class="next">&gt;</a>
				</c:if>
			</div>
		</div>
	    <div class="board">
       		<!-- admin확인절차 넣어줘야 함 -->
       		<%-- <c:if test="${member.userId == 'admin'}"> --%>
       		 	<button class="btn"><a href="">신고 관리</a></button>
       		<%-- </c:if> --%>  
       	</div>		
	</main> 
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</body>
</html>