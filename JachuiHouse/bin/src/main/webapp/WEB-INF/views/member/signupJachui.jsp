<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/footer.css">
        <link rel="stylesheet" href="../resources/css/signup.css">
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/include/header.jsp" />
    </header>
        <div class="container">
            <div class="header">
                <h2>회원가입</h2>
                <div class="agreements">
                    <label><input type="checkbox">약관에 동의합니다. <a href="#">내용보기</a></label>
                    <label><input type="checkbox">개인정보 수집에 동의합니다. <a href="#">내용보기</a></label>
                </div>
            </div>

            <form class="form" action="/company/signup" method="POST"></form>
                <div class="form-group">
                    <label for="id">아이디</label>
                    <input type="text" name="memberId">
                    <button type="button">중복확인</button>
                </div>

                <div class="form-group"></div>
                    <label for="password">비밀번호</label>
                    <input type="password" name="memberPw">
        </div>
</body>
</html>