<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
        <link rel="stylesheet" href="../resources/css/member/signupRealtor.css">
</head>
<body>
    <div class="container">
        <div class="inner">
            <h1 class="logo_jachuiHouse">
                <a href="http://localhost:7777" class="link">
                    ::before
                    <span class="blind">JachuiHouse</span>
                </a>
            </h1>
            <div class="content">
                <h2>공인중개사 회원가입</h2>
                <div class="agreements">
                    <label><input type="checkbox" required>약관에 동의합니다. <a href="#">내용보기</a></label>
                    <label><input type="checkbox" required>개인정보 수집에 동의합니다. <a href="#">내용보기</a></label>
                </div>

                <form class="form" action="/member/signupRealtor" method="POST" id="signup_form">
                    <div class="form-group">
                        <label for="id">아이디</label>
                        <input type="text" name="userId" minlength="4" maxlength="10" placeholder="4자~10자 사이, 공백없이" onkeydown="inputIdChk()" required>
                        <button type="button" onClick="fn_dbCheckId()" name="dbCheckId" class="checkId">중복확인</button>
                        <input type="hidden" name="idDuplication" value="idUncheck">
                    </div>
    
                    <div class="form-group">
                        <label for="password">비밀번호</label>
                        <input type="password" name="userPw" required>
                    </div>
    
                    <div class="form-group">
                        <label for="confirm-password">비밀번호 확인</label>
                        <input type="password" name="userPwCheck" placeholder="비밀번호를 한 번 더 입력해주세요." required>
                    </div>
    
                    <div class="form-group">
                        <label for="name">이름</label>
                        <input type="text" name="userName" required>
                    </div>
    
                    <div class="form-group">
                        <label for="phoneNumber">전화번호</label>
                        <input type="text" name="userPhone" placeholder="ex.01012345678" maxlength="11" required>
                    </div>
    
                    <div class="form-group">
                        <label for="userAddress">사무실 주소</label>
                        <div class="signUp-input-area">
                            <input type="text" name="businessAddress" placeholder="우편번호" maxlength="6" id="userPostcode" required>
                            <button type="button" onclick="business_execDaumPostcode()">검색</button>
                        </div>
    
    
                        <div class="signUp-input-area">
                            <input type="text" name="businessAddress" placeholder="도로명/지번 주소" id="userAddress" required>
                        </div>
    
    
                        <div class="signUp-input-area">
                            <input type="text" name="businessAddress" placeholder="상세 주소" id="userDetailAddress" required>
                        </div>
                    </div>
    
                    <div class="form-group">
                        <label for="realtorName">상호명</label>
                        <input type="text" name="realtorName" required>
                    </div>
    
                    <div class="form-group">
                        <label for="realtorNo">공인중개사 등록번호</label>
                        <input type="text" name="realtorNo" required>
                    </div>
    
                    <button type="submit" class="signUpBtn">가입신청하기</button>
                </form>
            </div>
        </div>

    </div>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/"></script>
    <script>
        function business_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                var addr = ''; 

                if (data.userSelectedTtype === 'R') {
                    addr = data.roadAddress;
                } else{
                    addr = data.jibunAddress;
                }

                document.getElementById("business_postcode").value = data.zonecode;
                document.getElementById("business_Address").value = addr;

                document.getElementById("business_detailAddress").focus();
                }
            }).open();
        }

        // id 입력 후 버튼 클릭 시 dbCheckId.do로 controller에 요청
        function fn_dbCheckId() {
            var joinForm = document.joinForm;
            var id = joinForm.id.value;
            if(id.length==0 || id==""){
                alert("아이디를 입력해주세요.");
                joinForm.id.focus();
            }else {
            window.open("${contextPath}/member/dbCheckId.do?user_id="+id,"","width=500, height=300");
            }
        }
    </script>
</body>
</html>