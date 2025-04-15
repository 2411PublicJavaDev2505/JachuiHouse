<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"></html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <link rel="stylesheet" href="../resources/css/member/login.css">
    
</head>
<body>
	<div class="container">
   <jsp:include page="/WEB-INF/views/include/header.jsp" />
    <main class="login-main">
        <div class="login-container">
            
            <div class="login-form">
                <div class="logo-container">
                    <div class="login-image">
                        <img src="../resources/image/loginEnter.png" alt="로그인 이미지">
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
                            <a href="/member/signupJachui">자취생 회원가입</a>
                            <a href="/member/signupRealtor">공인중개사 회원가입</a>
                        <p>아이디·비밀번호 찾기</p>
                                <a href="/member/findId">아이디 찾기</a> 
                                <a href="/member/resetPw">비밀번호 재설정</a> 
                    </div>
                	</form>
                    </div>
          	  </div>
   	 </main>
	
	</div>
</body>