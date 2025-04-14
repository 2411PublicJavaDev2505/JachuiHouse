<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그아웃</title>
    <link rel="stylesheet" href="../resources/css/main.css"> <!-- 아직안만들어짐 --> 
    <link rel="stylesheet" href="../resources/css/header.css">
    <link rel="stylesheet" href="../resources/css/footer.css">
    <link rel="stylesheet" href="../resources/css/success.css"> <!-- 아직안만들어짐 -->
</head>
<body>
    <jsp:include page="/WEB-INF/views/include/header.jsp" />

    <main class="container">
        <div class="message">
            <h1>로그아웃 되었습니다.</h1>
            <p><strong>JachuiHouse</strong>를 이용해 주셔서 감사합니다.</p>
            <p>다시 로그인하시려면 아래 버튼을 클릭해주세요.</p>
            <a href="/member/login" class="btn">로그인 페이지로 이동</a>
            <a href="/" class="btn btn-secondary">메인 페이지로 이동</a>
        </div>
    </main>

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
