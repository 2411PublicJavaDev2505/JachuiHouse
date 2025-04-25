<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그아웃</title>
    <link rel="stylesheet" href="../resources/css/main.css"> <!-- 아직안만들어짐 --> 
    <link rel="stylesheet" href="../resources/css/include/header.css">
    <link rel="stylesheet" href="../resources/css/include/footer.css">
    <link rel="stylesheet" href="../resources/css/member/logout.css">
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
	    <main class="main-container">
	    	<img alt="image" 
	    	src="../resources/images/logout.png">
	        <div class="message">
	            <h1>로그아웃 되었습니다.</h1>
	            <p><strong>JachuiHouse</strong>를 이용해 주셔서 감사합니다.</p>
	            <p>다시 로그인하시려면 아래 버튼을 클릭해주세요.</p>
	            <a href="/" class="mainPageBtn">메인 페이지로 이동</a>
	        </div>
	    </main>
	    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>
</html>
