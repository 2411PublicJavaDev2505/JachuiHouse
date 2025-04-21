<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
      <link rel="stylesheet" href="../resources/css/footer.css">
      <link rel="stylesheet" href="../resources/css/member/findId.css">
    </head>
    <body>
      <div class="container">
        <h2>아이디 찾기</h2>
        <form action="/member/foundId" method="post">
          <div class="form-group">
            <label for="userName">이름: </label>
            <input type="text" id="userName" name="userName" required>
          </div>
          
          <div class="form-group">
            <label for="userEmail">이메일: </label>
            <input type="email" id="userEmail" name="userEmail" required>
          </div>
          
          <label>회원 유형: </label>
          <div class="radio-group">
            <label><input type="radio" name="userRole" value="M" required> 자취생</label>
            <label><input type="radio" name="userRole" value="R" required> 공인중개사</label>
          </div>
          
          <label>인증방식</label>
          <div class="confirm-group">
            <label><input type="radio" name="confirmType" value="email" required>이메일 인증</label>
            <label><input type="radio" name="confirmType" value="phone" required>휴대폰 인증</label>
            
            <button type="submit" class="btn">아이디 찾기</button>
          </div>
        </form>
      </div>
    </body>
    </html>