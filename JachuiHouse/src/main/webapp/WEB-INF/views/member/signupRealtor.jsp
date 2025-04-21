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
				<div id="msgTag" style="color: red;"></div>
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


	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">
	    function business_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	           	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            var addr = ''; 
	            var extraAddr = ''; // 참고항목 변수
	            
	          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	            
	            
	         	// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("extraAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("extraAddress").value = '';
	            }
				
	        	// 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("userPostcode").value = data.zonecode;
	            document.getElementById("userAddress").value = addr;
				// 상세주소 입력란으로 커서 이동.
	            document.getElementById("userDetailAddress").focus();
	            }
	        
	        }).open();
    	}
    
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
        	
        	//msgTag.innerText = "";
        	
            if(!userIdExp.test(userId.value.trim())){
            	event.preventDefault();
            	const msg = "아이디는 소문자로 시작하고, 영어 소문자와 숫자로 4~12자리여야합니다."
        		showMessage(msg);
            	return false;
            }
            
            if(!userEmailExp.test(userEmail.value.trim())){
    			//msgTag.innerText = "이메일 형식이 올바르지 않습니다."
   				event.preventDefault();
    			const msg = "이메일 형식이 올바르지 않습니다."
           		showMessage(msg);
               	return false;
    		}
            
            if(!userPwExp.test(userPw.value.trim())){
            	event.preventDefault();
    			const msg = "비밀번호는 영어소문자,대문자,숫자만 입력 가능해야 하고 8~20자리여야 합니다."
           		showMessage(msg);
               	return false;
    		}
            
            if(userPwCheck.value.trim() !== userPw.value.trim()){ //.value는 input 태그에 붙이는 것이다. userPwCheck는 값만 가져옴. Expression 사용X
            	event.preventDefault();
    			const msg = "같은 값을 입력해주세요."
           		showMessage(msg);
               	return false;
    		}
            
            if(!userNameExp.test(userName.value.trim())){
            	event.preventDefault();
    			const msg = "이름은 한글만 가능합니다."
           		showMessage(msg);
               	return false;
    		}
            
            if(!userPhoneExp.test(userPhone.value.trim())){
            	event.preventDefault();
    			const msg = "010으로 시작하고 11자리여야 합니다."
           		showMessage(msg);
               	return false;
    		}
            
            if(!userPostcodeExp.test(userPostcode.value.trim())){
            	event.preventDefault();
    			const msg = "우편번호를 입력해주세요."
            	showMessage(msg);
                return false;
    		}
            
            if(!userAddressExp.test(userAddress.value.trim())){
            	event.preventDefault();
    			const msg = "도로명/지번주소를 입력해주세요."
               	showMessage(msg);
                return false;
    		}
            
            if(!userDetailAddressExp.test(userDetailAddress.value.trim())){
            	event.preventDefault();
    			const msg = "상세주소를 입력해주세요."
             	showMessage(msg);
                return false;
    		}
            
            if(!realtorNameExp.test(realtorName.value.trim())){
            	event.preventDefault();
            	const msg = "상호명은 2~20자리여야 합니다"
   				showMessage(msg);
                return false;
    		}
            
            if(!realtorNoExp.test(realtorNo.value.trim())){
    			event.preventDefault();
            	const msg = "공인중개사 등록번호는 숫자만 입력해주세요."
    			showMessage(msg);
                return false;
    		}
        	
        })
        // SweetAlert2 
        document.querySelector("#success").addEventListener("click", function() {
        	new swal(
     	       'Success',
     	       'You clicked the <b style="color:green;">Success</b> button!',
     	       'error'
    	    )
        });
    </script>
</body>
</html>