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

	        	<form class="report-form" action="/member/search" method="get">
	        		 <div class="search">
		        		 <input class="searchplace" name="searchKeyword" type="text" placeholder="  검색어를 입력하세요.">
		        		 <button class="btn" type="submit">검색</button>
	        		 </div>	        
		        </form> 
	        		 
        	<table class="boardbl">
        		<tr>
        			<th>회원 타입</th>
        			<th>이름</th>
        			<th>지역(주소)</th>
        			<th>아이디</th>
        			<th>이메일</th>
        			<th>생년월일</th>
        			<th>공인중개사 승인여부</th>
        		</tr>	
        		<c:forEach var="member" items="${nList}" varStatus="i">
        			<tr>
<%--         				<a href="/admin/detail/${member.userId}">이걸 자바스크립트로 해얄듯한뎅 --%>
        				<td>
						    <c:choose>
						        <c:when test="${member.userRole == 'M'}">
						            <span class="notice-type-student">자취생</span>
						        </c:when>
						        <c:when test="${member.userRole == 'R'}">
						            <span class="notice-type-agent">공인중개사</span>
						        </c:when>
						        <c:otherwise>
						            ${member.userRole}
						        </c:otherwise>
						    </c:choose>
						</td>
        				<td>${member.userName }</td>
        				<td>${member.userAddress }</td>
        				<td>${member.userId}</td>
        				<td>${member.userEmail}</td>
        				<td>${member.userBirth }"</td>
        				<td>${member.approveYn}</td>
<!--         				</a> -->
        			</tr>
        		</c:forEach>		 
        	</table>
        	<div class="pagination-container">
				<div class="pagination">
					<c:if test="${startNavi ne 1 }">
						<a href="/member/list?page=${startNavi - 1 }" class="prev">&lt;</a>
					</c:if>
					<c:forEach begin="${startNavi }" end="${endNavi }" var="p">
						<a href="/member/list?page=${p }">${p }</a>
					</c:forEach>
					<c:if test="${endNavi ne maxPage }">
						<a href="/member/list?page=${endNavi + 1 }" class="next">&gt;</a>
					</c:if>
				</div>
			</div>
        
	    <div class="board">
       		<!-- admin확인절차 넣어줘야 함 -->
       		<c:if test="${sessionScope.userId == 'admin'}">
       		 	<button class="btn"><a href="member/list">신고 관리</a></button>
       		</c:if>  
       	</div>		
        </div>
	</main> 
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</body>
</html>