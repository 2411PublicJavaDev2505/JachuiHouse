<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="../resources/css/include/header.css">
		<link rel="stylesheet" href="../resources/css/notice/list.css">
		<link rel="stylesheet" href="../resources/css/include/footer.css">
	</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/include/header.jsp" />
    </header>
    
	<main class="main">
    	<div id="notice-div">
        
        	<form class="report-form" action="/member/search" method="get">
        		 <div class="search">
	        		 <input class="searchplace" name="searchKeyword" type="text" 
	        		 placeholder="  제목으로 검색어를 입력하세요." value="${searchKeyword}">
	        		 <button class="btn" type="submit">검색</button>
        		 </div>	        
	        </form><br>

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
	        		<c:forEach var="member" items="${searchList}" varStatus="i">
	        			<tr>
	<%--         				<a href="/member/detail/${member.userId}">이걸 자바스크립트로 해얄듯한뎅 --%>
	        				<td>
							    <c:choose>
							        <c:when test="${member.userRole == 'A'}">
							            <span class="notice-type-common">관리자</span>
							        </c:when>
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
							<a href="/member/search?page=${startNavi - 1 }&searchKeyword=${searchKeyword}" class="prev">&lt;</a>
						</c:if>
						<c:forEach begin="${startNavi }" end="${endNavi }" var="p">
							<a href="/member/search?page=${p }&searchKeyword=${searchKeyword}">${p }</a>
						</c:forEach>
						<c:if test="${endNavi ne maxPage }">
							<a href="/member/search?page=${endNavi + 1 }&searchKeyword=${searchKeyword}" class="next">&gt;</a>
						</c:if>
					</div>        	
		        </div>


<!-- 		    <div class="board"> -->
<!--         		admin확인절차 넣어줘야 함 -->
<%--         		<c:if test="${sessionScope.userId == 'admin'}"> --%>
<!--         		 	<button class="btn"><a href="">신고 관리</a></button> -->
<%--         		</c:if>   --%>
<!--         	</div>	 -->
        	</div>	
	</main>     
    <footer>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </footer>
</body>
</html>