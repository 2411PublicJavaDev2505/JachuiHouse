<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Report - list</title>
		<link rel="stylesheet" href="../resources/css/include/header.css">
		<link rel="stylesheet" href="../resources/css/notice/list.css">
		<link rel="stylesheet" href="../resources/css/include/footer.css">
	</head>   
<body>
    	<jsp:include page="/WEB-INF/views/include/header.jsp" />
<!-- 이 JSP는 report 컨트롤러 작업이랑 상세사항 작업 연결해야 함 -->
	<main class="main">
    	<div id="notice-div">

	        	<form class="report-form" action="/admin/search" method="get">
<!-- 	        	'신고종류' 옵션추가 -->
	        		 <div class="search">
		        		 <input class="searchplace" name="searchKeyword" type="text" placeholder="   검색어를 입력하세요.">
		        		 <button class="btn" type="submit">검색</button>
	        		 </div>	        
		        </form> 
	        		 
        	<table class="boardbl">
        		<tr>
        			<th>신고 종류</th>
        			<th>신고 사유</th>
        			<th>신고글 제목</th>
        			<th>작성자</th>
        			<th>작성일</th>
        		</tr>	
        		<c:forEach var="noticeVO" items="${rList}" varStatus="i">
        			<tr>
        				<td>
						    <c:choose>
						        <c:when test="${reportVO.noticeType == '댓글'}">
						            <span class="notice-type-common">${noticeVO.noticeType}</span>
						        </c:when>
						        <c:when test="${reportVO.noticeType == '게시판'}">
						            <span class="notice-type-student">${noticeVO.noticeType}</span>
						        </c:when>
						        <c:otherwise>
						            ${noticeVO.noticeType}
						        </c:otherwise>
						    </c:choose>
						</td>
        				<td>${reportVO.reportReason }</td>
	        				<c:if test="${sessionScope.postNo == postVO.postNo}">
	        					<td><a href="/notice/detail/${reportVO.reportNo}">${postVO.postTitle }</a></td>
<!-- 	        					자바스크립트로 창열리게 하기 -->
	        				</c:if>
        				<td>${reportVO.userId}</td>
        				<!-- pathvariable있을때 ?쓰면 안됨 -->
        				<td><fmt:formatDate pattern = "yyyy/MM/dd" value="${reportVO.reportDate }"/></td>
        			</tr>
        		</c:forEach>		 
        	</table>
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
       		<c:if test="${sessionScope.userId == 'admin'}">
       		 	<button class="btn"><a href="admin/member">회원 관리</a></button>
       		</c:if>  
       	</div>		
        </div>
	</main> 
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</body>
</html>