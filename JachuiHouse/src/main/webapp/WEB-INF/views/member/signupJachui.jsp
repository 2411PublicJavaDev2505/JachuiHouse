<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
        <link rel="stylesheet" href="../resources/css/member/signupJachui.css">
</head>
<body>
    <div class="container">
        <div class="inner">
        <p class="logo_jachuiHouse">
            <a href="http://localhost:7777" class="link">
                <span class="blind">JachuiHouse</span>
            </a>
        </p>
            <div class="content">
                <h2>회원가입</h2>
                <div class="agreements">
                    <label><input type="checkbox">약관에 동의합니다. <a href="#">내용보기</a></label>
                    <label><input type="checkbox">개인정보 수집에 동의합니다. <a href="#">내용보기</a></label>
                </div>

                <form class="form" action="/member/signupJachui" method="POST" id="signup_form">
                        <div class="form-group">
                        	<h3>아이디 입력</h3>
                            <label for="id">아이디</label>
                            <input class="form-control" type="text" name="userId" id="userId" minlength="4" maxlength="10" placeholder="4자~10자 사이 영어+숫자, 공백없이" onkeydown="inputIdChk()" autofocus required>
                            <label id="label1"></label>
                            <!-- <button type="button" onClick="fn_dbCheckId()" name="dbCheckId" class="checkId">중복확인</button>
                            <input type="hidden" name="idDuplication" value="idUncheck"> -->
                        </div>
                        
                    <div class="form-group">
			            <label for="userEmail">이메일: </label>
			            <input type="email" id="userEmail" name="userEmail" required>
			        </div>  
        			
                    <div class="form-group">
                        <label for="password">비밀번호</label>
                        <input type="password" name="userPw" required>
                    </div>
        
                    <div class="form-group">
                        <label for="confirm-password">비밀번호 확인</label>
                        <input type="password" name="userPwCheck" required>
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
                        <label for="userAddress">주소</label>
                        <div class="signUp-input-area">
                            <input type="text" name="userPostcode" placeholder="우편번호" maxlength="6" id="userPostcode" required>
                            <button type="button" onclick="business_execDaumPostcode()">검색</button>
                        </div>
        
        
                        <div class="signUp-input-area">
                            <input type="text" name="userAddress" placeholder="도로명/지번 주소" id="userAddress" required>
                        </div>
        
        
                        <div class="signUp-input-area">
                            <input type="text" name="userDetailAddress" placeholder="상세 주소" id="userDetailAddress" required>
                        </div>
                    </div>
        
                    <div class="form-group">
                        <label for="BirthDay">생년월일</label>
                        <input type="date" name="userBirth" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="gender">성별</label>
                        <input type="radio" name="gender" value="M" required>남
                        <input type="radio" name="gender" value="W" required>여
                    </div>
        
                    <div class="form-group">
                        <label for="aloneLiving">자취년차</label>
                        <input type="text" name="userBirth" placeholder="선택 사항입니다. 숫자만 입력해주세요.">
                    </div>
        
                    <button type="submit" class="signUpBtn">회원가입</button>
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
                var extraAddr = '';
              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
              
              		if(data.bname !== '' && / [동|로|가]$/g.test(data.bname)){
              			extraAddr +=data.bname;
              		}
	              	// 건물명이 있을 경우
	              	if(data.buildingName !== '' && data.apartment === 'Y'){
	              		extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	              	}
                              
                } else {
                    addr = data.jibunAddress;
                }
				
            	// 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("userPostcode").value = data.zonecode;
                document.getElementById("userAddress").value = addr;
				// 상세주소 입력란으로 커서 이동.
                document.getElementById("userDetailAddress").focus();
                }
            
            	document.getElementById("extraAddress").value = extraAddr;
            }).open();
        }

        // id 입력 후 버튼 클릭 시 dbCheckId.do로 controller에 요청
        function fn_dbCheckId() {
            var signup_form = document.signup_form;
            var id = signup_form.id.value;
            if(id.length==0 || id==""){
                alert("아이디를 입력해주세요.");
                signup_form.id.focus();
            }else {
            window.open("${contextPath}/member/dbCheckId.do?user_id="+id,"","width=500, height=300");
    		}
        }       
    </script>
</body>
</html>