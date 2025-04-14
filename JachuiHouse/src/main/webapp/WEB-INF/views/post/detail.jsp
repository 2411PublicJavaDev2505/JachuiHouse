<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	    <link rel="stylesheet" href="../resources/css/include/header.css">
	    <link rel="stylesheet" href="../resources/css/include/footer.css">
	    <link rel="stylesheet" href="../resources/css/post/detail.css">
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
        <div id="container">
            <div class="main">
                <div class="post">
                        <div class="postinf">
                            <div class="p1"><div class="posttxt">게시판 종류 :</div> 질문</div> <br>
                            <div class="p1"><div class="posttxt">공고글 제목 :</div> 집에 날파리 안나오게 하는 방법 뭐가 있을까요?</div> <br> 
                        </div>
                        <div class="postcontent"> 집에 날파리가 왜이렇게 많을까요? 불편하네요 ㅜ</div>
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
                                    <td>user33</td>
                                    <td>잡아드릴까요?</td>
                                    <td><button class="reportbtn">신고하기</button></td>
                                    <td>25/04/07</td>
                                </tr>
                            </table>
                        </div>
                        <div class="underbar">
                            <button class="reportbtn2">신고하기</button>
                            <input type="text" placeholder="댓글을 입력하세요." class="commentbox">
                            <button class="commentbtn">댓글달기</button>
                            <button class="backbtn">목록으로</button>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="/WEB-INF/views/include/footer.jsp"/>		
	</body>
</html>