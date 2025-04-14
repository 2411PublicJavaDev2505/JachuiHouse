<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice - list</title>
</head>
    <link rel="stylesheet" href="../resources/css/noticelist.css">
<body>
    <main class="notice-container">
        <h1>공지사항</h1>
        <table class="notice-table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>분류</th>
                    <th>제목</th>
                    <th>날짜</th>
                </tr>
            </thead>
            <div class="write-btn-container">
<%--             <c:if test="${member.userId == 'admin'}"> --%>
		        <a href="/notice/add" class="write-btn">글쓰기</a>
<%-- 		    </c:if> --%>
		    </div>
            <tbody>
                <c:forEach var="noticeVO" items="${nList}" varStatus="i">
                    <tr>
                        <td>${noticeVO.noticeNo}</td>
                        <td>${noticeVO.noticeType }</td>
                        <td><a href="/notice/detail?noticeNo=${noticeVO.noticeNo}">${noticeVO.noticeTitle}</a></td>
						<td>${noticeVO.noticeWriteDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
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

	    <div class="search-filter">
	        <form action="/notice/search" method="get">
	            <select class="filter-dropdown">
	                <option value="all">항목 선택 </option>
	                <option value="title">제목</option>
	                <option value="content">내용</option>
	            </select>
	            <input type="text" class="search-input" name="searchKeyword" placeholder="검색어 입력">
	            <button type="submit" class="search-btn">검색하기</button>
	        </form>
	    </div>

    </main>
</body>
</html>