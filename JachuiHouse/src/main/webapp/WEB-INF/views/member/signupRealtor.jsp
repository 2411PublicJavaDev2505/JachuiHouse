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
            <div class="logo-container">
				<div class="login-image">
					<a href="http://localhost:7777">
						<img src="../resources/image/loginEnter.png" alt="로그인 이미지">
					</a>
				</div>
				<div>
					<span>공인중개사 회원가입</span>
				</div>
				</div>
               
               <div class="agreements">
                   <label><input type="checkbox" required>약관에 동의합니다. <a href="#">내용보기</a></label>
                   <label><input type="checkbox" required>개인정보 수집에 동의합니다. <a href="#">내용보기</a></label>
               </div>

               <form class="form" action="/member/signupRealtor" method="POST" id="signup_form">
                   <div class="form-group">
                       <h3>아이디 입력</h3>
                       <label for="userId" >아이디: </label>
                       <input class="form-control" type="text" name="userId" id="userId" minlength="4" maxlength="12" placeholder="영어 소문자와 숫자로 4~12자리"  autofocus required >
                       <button id="btn-di-check">중복확인</button>
                       <div id="id-check-result" class="area"></div>
                   </div>
   
   				<div class="form-group">
		            <label for="userEmail">이메일: </label>
		            <input type="email" id="userEmail" name="userEmail" required>
		        </div> 
   
                <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" name="userPw" id="userPw" required>
                </div>

                <div class="form-group">
                    <label for="confirm-password">비밀번호 확인</label>
                    <input type="password" name="userPwCheck" id="userPwCheck" placeholder="비밀번호를 한 번 더 입력해주세요." required>
                </div>

                <div class="form-group">
                    <label for="name">이름</label>
                    <input type="text" name="userName" id="userName" required>
                </div>

                <div class="form-group">
                    <label for="phoneNumber">전화번호</label>
                    <input type="text" name="userPhone" id="userPhone" placeholder="ex.01012345678" maxlength="11" required>
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
                    <label for="realtorName" >상호명</label>
                    <input type="text" name="realtorName" id="realtorName" required>
                </div>

                <div class="form-group">
                    <label for="realtorNo">공인중개사 등록번호</label>
                    <input type="text" name="realtorNo" id="realtorNo" required>
                </div>

                <button type="submit" class="signUpBtn">가입신청하기</button>
            </form>
        </div>
    </div>



    <script type="text/javascript">
        const signUpBtn = document.querySelector(".signUpBtn");
        signUpBtn.addEventListener("click", function (event) {
        	const userId = document.querySelector("#userId");
        	const userEmail = document.querySelector("#userEmail");
        	const userPw = document.querySelector("#userPw");
        	const userPwCheck = document.querySelector("#userPwCheck");
        	const userName = document.querySelector("#userName");
        	const userPhone = document.querySelector("#userPhone");
        	const userPostcode = document.querySelector("#userPostcode");
        	const userAddress = document.querySelector("#userAddress");
        	const userDetailAddress = document.querySelector("#userDetailAddress");
        	const realtorName =  document.querySelector("#realtorName");
        	const realtorNo = document.querySelector("#realtorNo");
        	const msgTag = document.querySelector("#msgTag"); // 오류 메시지 출력용
        	
        	const userIdExp = /^[a-z][a-z0-9]{3,11}$/;
        	const userEmailExp = /^[a-zA-Z0-9._%+-]{4,12}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        	const userPwExp = /[a-zA-Z0-9]{8,20}/;
        	const userPwCheckExp = /[a-zA-Z0-9]{8,20}$/;
        	const userNameExp = /^[가-힣]+$/;
        	const userPhoneExp = /^010\d{8}$/;
        	const userPostcodeExp = /^\d{5}$/;
        	const userAddressExp = /^[가-힣\s]{5,20}/;
        	const userDetailAddressExp = /^[가-힣\s]{5,20}/;
        	const realtorNameExp = /[a-zA-Z0-9ㄱ-힣]{2,20}/;
        	const realtorNoExp = /^[0-9]{6,15}$/;
        	
            if(!userIdExp.test(userId.value.trim())){
            		msgTag.innerText = "아이디는 소문자로 시작하고, 영어 소문자와 숫자로 4~12자리여야합니다."
            		event.preventDefalut();
            }
            
            if(!userEmailExp.test(userEmail.value.trim())){
    			msgTag.innerText = "이메일 형식이 올바르지 않습니다."
    			event.preventDefault();
    		}
            
            if(!userPwExp.test(userPw.value.trim())){
    			msgTag.innerText = "비밀번호는 영어소문자,대문자,숫자만 입력 가능해야 하고 8~20자리여야 합니다"
    			event.preventDefault();
    		}
            
            if(userPwCheckExp.value.trim() !== userPw.value.trim()){
    			msgTag.innerText = "같은 값을 입력해주세요."
    			event.preventDefault();
    		}
            
            if(!userNameExp.test(userName.value.trim())){
    			msgTag.innerText = "이름은 한글만 가능합니다."
    			event.preventDefault();
    		}
            
            if(!userPhoneExp.test(userPhone.value.trim())){
    			msgTag.innerText = "010으로 시작하고 11자리여야 합니다."
    			event.preventDefault();
    		}
            
            if(!userPostcodeExp.test(userPostcode.value.trim())){
    			msgTag.innerText = "우편번호를 입력해주세요."
    			event.preventDefault();
    		}
            
            if(!userAddressExp.test(userAddress.value.trim())){
    			msgTag.innerText = "도로명/지번주소를 입력해주세요."
    			event.preventDefault();
    		}
            
            if(!userDetailAddressExp.test(userDetailAddress.value.trim())){
    			msgTag.innerText = "상세주소를 입력해주세요."
    			event.preventDefault();
    		}
            
            if(!realtorNameExp.test(realtorName.value.trim())){
    			msgTag.innerText = "상호명은 2~20자리여야 합니다"
    			event.preventDefault();
    		}
            
            if(!realtorNoExp.test(realtorNo.value.trim())){
    			msgTag.innerText = "공인중개사 등록번호는 숫자만 입력해주세요."
    			event.preventDefault();
    		}
        	
        })
    </script>
</body>
</html>