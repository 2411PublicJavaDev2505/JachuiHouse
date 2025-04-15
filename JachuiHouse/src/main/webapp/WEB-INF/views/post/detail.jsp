<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자취록 상세조회</title>
	    <link rel="stylesheet" href="../resources/css/include/header.css">
	    <link rel="stylesheet" href="../resources/css/include/footer.css">
	    <link rel="stylesheet" href="../resources/css/post/detail.css">

	</head>
	<body>
        <div id="container">
			<jsp:include page="/WEB-INF/views/include/header.jsp"/>
            <div class="main">
            	<form action="/post/detail">
	                <div class="post">
	                        <div class="postinf">
	                            <div class="p1"><div class="posttxt">게시판 종류 :</div> ${result.postType }</div> <br>
	                            <div class="p1"><div class="posttxt">공고글 제목 :</div> ${result.postTitle }</div> <br> 
	                        </div>
	                        <div class="postcontent"> ${result.postContent }</div>
	                        <div class="comment">
	                            <table class="commenttbl">
	                                <tr>
	                                    <th>작성자</th>
	                                    <th>내용</th>
	                                    <th>신고</th>
	                                    <th>작성일시</th>
	                                </tr>
	                                <tr>
	                                    <td>user11</td>
	                                    <td>치우고 사세요</td>
	                                    <td><button class="reportbtn">신고하기</button></td>
	                                    <td>25/04/05</td>
	                                </tr>
	                                <tr>
	                                    <td>user22</td>
	                                    <td>여름이니까 많죠</td>
	                                    <td><button class="reportbtn">신고하기</button></td>
	                                    <td>25/04/06</td>
	                                </tr>
	                                <tr>
	                                    <td>${comment.userId}</td>
	                                    <td>${comment.commentContent}</td>
	                                    <td><button class="reportbtn">신고하기</button></td>
	                                    <td>${comment.writeDate}</td>
	                                </tr>
	                            </table>
	                        </div>
	                        <div class="underbar">
	                            <button class="reportbtn2">신고하기</button>
	                            <input name="commentContent" type="text" placeholder="댓글을 입력하세요." class="commentbox">
	                            <button class="commentbtn" type="submit">댓글달기</button>
	                            <button class="backbtn">목록으로</button>
	                        </div>
	                    </div>
                    </form>
                </div>
	            <jsp:include page="/WEB-INF/views/include/footer.jsp"/>		
            </div>
	</body>
</html>