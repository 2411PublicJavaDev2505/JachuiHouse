<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <!-- 헤더 -->
<<<<<<< HEAD
<header>
    <a href="/">
    <div class="logo">
        <img src="/resources/image/logo.png" alt="logo">
    </div>
    </a> 
    <div class="nav">
        <a href="/">홈</a> 
        <a href="/post/list">자취록</a>
        <a href="/chazabang/list">찾아방</a>
        <a href="/trade/list">사방팔방</a>
    </div>
    <div class="loginBtn">
    <c:if test="${sessionScope.userId eq null }">
        <a href="/member/login">로그인</a>
    </c:if>
    <c:if test="${sessionScope.userId ne null }">
    	<c:if test="${sessionScope.userRole eq 'A' }">
    		<a href="/report/list">관리자 페이지</a>
    	</c:if>
    	<c:if test="${sessionScope.userRole eq 'R' }">
    		<a href="/member/realtor/myPage">마이페이지</a>
    	</c:if>
    	<c:if test="${sessionScope.userRole eq 'M' }">
    		<a href="/member/myPage">마이페이지</a>
    	</c:if>
    	<a href="/member/logout">로그아웃</a> 
    </c:if>
    </div>
</header>
=======
        <header>
            <a href="/">
            <div class="logo">
                <img src="/resources/image/logo.png" alt="logo">
            </div>
            </a> 
            <div class="nav">
                <a href="/">홈</a> 
                <a href="/post/list">자취록</a>
                <a href="/chazabang/list">찾아방</a>
                <a href="/trade/list">사방팔방</a>
            </div>
            <div class="loginBtn">
            <c:if test="${sessionScope.userId eq null }">
                <a href="/member/login">로그인</a>
            </c:if>
            <c:if test="${sessionScope.userId ne null }">
            	<c:if test="${sessionScope.userRole eq 'A' }">
            		<a href="/admin/rlist">관리자 페이지</a>
            	</c:if>
            	<c:if test="${sessionScope.userRole eq 'R' }">
            		<a href="/realtor/myPage">마이페이지</a>
            	</c:if>
            	<c:if test="${sessionScope.userRole eq 'M' }">
            		<a href="/member/myPage">마이페이지</a>
            	</c:if>
            	<a href="/member/logout">로그아웃</a> 
            </c:if>
            </div>
        </header>
</body>
</html>
>>>>>>> 046afdcb3d8405d0f9a44ab3d13f53002cd4854e
