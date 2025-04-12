<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <link rel="stylesheet" href="../resources/css/footer.css">
    <link rel="stylesheet" href="login.css">
    
</head>
<body>
    <!-- <header>
        <jsp:include page="/WEB-INF/views/include/header.jsp" />
    </header> -->

    <main class="login-main">
        <div class="login-container">
            
            <div class="login-form">
                <div class="logo-container">
                    <div class="login-image">
                        <img src="../resources/images/loginEnter.png" alt="로그인 이미지">
                    </div>
                    <h1>로그인</h1>
                </div>
                <form class="login-form" action="/member/login" method="post">
                    <div class="form-group">
                        <label for=>아이디: </label>
                        <input type="text" name="memberId">
                    </div>
                    <div class="form-group">
                        <label for="">비밀번호: </label>
                        <input type="password" name="memberPw">
                    </div>
                    <div class="checkbox-container">
                        <input type="checkbox" id="save-id">
                        <label for="save-id">아이디 저장</label><br>
                    </div>
                    <button type="submit" class="loginBtn">로그인</button><br>
                    <div class="confirm-container">
                        <p>계정이 없으신가요?</p> 
                            <a href="/member/insert">자취생 회원가입</a>
                            <a href="/member/insert">공인중개사 회원가입</a>
                        </p>
                        <p>비밀번호를 잊으셨나요?</p>
                                <a href="/member/password">비밀번호 재설정</a> 
                    </div>
                    </div>
                </form>
            </div>
        </div>

    </main>
</body>