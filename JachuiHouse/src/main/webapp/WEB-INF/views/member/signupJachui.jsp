<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
    <link rel="stylesheet" href="../resources/css/member/signupJachui.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
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
	                <span class="signup">회원가입</span>
            	</div>    
            <div id="msgTag" style="color: red;"></div>
			</div>
            <div class="content">
                <div class="agreements">
                    <label><input type="checkbox">약관에 동의합니다. <a href="#">내용보기</a></label>
                    <label><input type="checkbox">개인정보 수집에 동의합니다. <a href="#">내용보기</a></label>
                </div>
				
                <form class="form" action="/member/signupJachui" method="POST" id="signup_form">
                    <div class="form-group">
                    	<h3>아이디 입력</h3>
                        <label for="id">아이디</label>
                        <input class="form-control" type="text" name="userId" id="userId" minlength="4" maxlength="10" placeholder="영어 소문자와 숫자로 4~12자리여야 합니다." autofocus required>
                        <label id="label1"></label>
                        <button id="overlappedID" type="button">중복확인</button><br>
                  		<span id="idOlMessage"></span>
                    </div>
                        
                    <div class="form-group">
			            <label for="userEmail">이메일: </label>
			            <input type="email" id="userEmail" name="userEmail" autofocus required>
			            <button id="overlappedEmail" type="button">중복확인</button><br> 
			            <span id="emailOlMessage"></span> 
			        </div>  
        			
                    <div class="form-group">
                        <label for="password">비밀번호</label>
                        <input type="password" id="userPw"  name="userPw" placeholder="비밀번호는 영어소문자,대문자,숫자만 입력 가능해야 하고 8~20자리여야 합니다." required>
                    </div>
        
                    <div class="form-group">
                        <label for="confirm-password">비밀번호 확인</label>
                        <input type="password" id="userPwCheck" name="userPwCheck" >
                    </div>
        
                    <div class="form-group">
                        <label for="name">이름</label>
                        <input type="text" id="userName" name="userName" >
                    </div>
        
                    <div class="form-group">
                        <label for="phoneNumber">전화번호</label>
                        <input type="text" name="userPhone" id="phoneNumber" placeholder="ex.01012345678" maxlength="11" >
                    </div>
        
                    <div class="form-group">
                        <label for="userAddress">주소</label>
                        <div class="signUp-input-area">
                            <input type="text" name="userPostcode" placeholder="우편번호" maxlength="6" id="userPostcode" >
                            <input type="button" id="userPostcodeBtn" onclick="business_execDaumPostcode()" value="우편번호 찾기"><br>
                        </div>
        
        
                        <div class="form-group">
                            <input type="text" name="userAddress" placeholder="도로명/지번 주소" id="userAddress" ><br>
                        </div>
        
        
                        <div class="form-group">
                            <input type="text" name="userDetailAddress" placeholder="상세 주소" id="userDetailAddress" ><br>
                        </div>
                        
                        <div class="form-group">
					        <input type="text" name="extraAddress" placeholder="참고 항목" id="extraAddress" readonly><br>
					    </div>
                    </div>
        
                    <div class="form-group">
                        <label for="BirthDay">생년월일</label>
                        <input type="date" name="userBirth" required>
                    </div>
                    
                    <ul class="register-radio-group">
                    	<label for="gender">성별</label>
						<li class="register-radio">
							<label for="male">
							<img src="../resources/images/male.png" alt="남">
							<input type="radio" id="male" name="gender" value="M" checked>
							</label>
						</li>
						<li class="register-radio">
							<label for="female">
							<img src="../resources/images/female.png" alt="여">
							<input type="radio" id="female" name="gender" value="F">
							</label>
						</li>
					</ul>
                    
                    <!-- <div class="form-group">
                        <label for="gender">성별</label>
                        <input type="radio" id="Gender" name="gender" value="M" >남</input>
                        <input type="radio" id="Gender" name="gender" value="W" >여
                    </div> -->
        
                    <div class="form-group">
                        <label for="aloneLiving">자취년차</label>
                        <input type="text" name="aloneLiving" id="aloneLiving" placeholder="선택 사항입니다. 숫자만 입력해주세요.">
                    </div>
        
                    <button type="submit" class="signUpBtn">회원가입</button>
                    </form>
            </div>
        </div>
    </div>
    
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    let isIdChecked = false; // 아이디 중복확인 완료 여부
    let isEmailChecked = false; // 이메일 중복확인 완료 여부
   		
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

        /* // id 입력 후 버튼 클릭 시 dbCheckId.do로 controller에 요청
        function fn_dbCheckId() {
            var signup_form = document.signup_form;
            var id = signup_form.id.value;
            if(id.length==0 || id==""){
                alert("아이디를 입력해주세요.");
                signup_form.id.focus();
            }else {
            window.open("${contextPath}/member/dbCheckId.do?user_id="+id,"","width=500, height=300");
    		}
        }  */
        
     	// SweetAlert
        function showMessage(msg) {
        	Swal.fire({            		
         		title: '다시 한 번 확인해주세요.',
         		text: msg,
         		icon: 'error',
       		});
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
        	const userBirth =  document.querySelector("#userBirth");
        	//const userGender = document.querySelector("#userGender");
        	const aloneLiving =  document.querySelector("#aloneLiving");
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
        	const userBirthExp = /^[0-9]$/g;
        	//const userGenderExp = /^[0-9]{6,15}$/;
        	const aloneLivingExp = /^[0-9]$/g;
        	
            if(!userIdExp.test(userId.value.trim())){
            	/* alert("아이디는 소문자로 시작하고, 영어 소문자와 숫자로 4~12자리여야합니다."); */
           		//msgTag.innerText = "아이디는 소문자로 시작하고, 영어 소문자와 숫자로 4~12자리여야합니다."
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
    			//msgTag.innerText = "비밀번호는 영어소문자,대문자,숫자만 입력 가능해야 하고 8~20자리여야 합니다"
    			event.preventDefault();
    			const msg = "비밀번호는 영어소문자,대문자,숫자만 입력 가능해야 하고 8~20자리여야 합니다."
           		showMessage(msg);
               	return false;
    		}
            
            if(userPwCheck.value.trim() !== userPw.value.trim()){ //.value는 input 태그에 붙이는 것이다. userPwCheck는 값만 가져옴. Expression 사용X
    			//msgTag.innerText = "같은 값을 입력해주세요."
    			event.preventDefault();
    			const msg = "같은 값을 입력해주세요."
           		showMessage(msg);
               	return false;
    		}
            
            if(!userNameExp.test(userName.value.trim())){
    			//msgTag.innerText = "이름은 한글만 가능합니다."
    			event.preventDefault();
    			const msg = "이름은 한글만 가능합니다."
           		showMessage(msg);
               	return false;
    		}
            
            if(!userPhoneExp.test(userPhone.value.trim())){
    			//msgTag.innerText = "010으로 시작하고 11자리여야 합니다."
    			event.preventDefault();
    			const msg = "010으로 시작하고 11자리여야 합니다."
           		showMessage(msg);
               	return false;
    		}
            
            if(!userPostcodeExp.test(userPostcode.value.trim())){
    			//msgTag.innerText = "우편번호를 입력해주세요."
    			event.preventDefault();
    			const msg = "우편번호를 입력해주세요."
            	showMessage(msg);
                return false;
    		}
            
            if(!userAddressExp.test(userAddress.value.trim())){
    			//msgTag.innerText = "도로명/지번주소를 입력해주세요."
    			event.preventDefault();
    			const msg = "도로명/지번주소를 입력해주세요."
               	showMessage(msg);
                return false;
    		}
            
            if(!userDetailAddressExp.test(userDetailAddress.value.trim())){
    			//msgTag.innerText = "상세주소를 입력해주세요."
    			event.preventDefault();
    			const msg = "상세주소를 입력해주세요."
             	showMessage(msg);
                return false;
    		}
            
            if(!userBirthExp.test(userBirth.value.trim())){
    			msgTag.innerText = "생년월일을 입력해주세요."
    			event.preventDefault();
    			return false;
    		}
            
            /* if(!realtorNoExp.test(realtorNo.value.trim())){
    			msgTag.innerText = "공인중개사 등록번호는 숫자만 입력해주세요."
    			event.preventDefault();
    		} */
    		
            if(!aloneLivingExp.test(aloneLiving.value.trim())){
    			msgTag.innerText = "선택사항입니다. 숫자만 입력해주세요."
    			event.preventDefault();
    			return false;
    		}
        	
        })
/*         // SweetAlert2  (해당 디자인으로 가져옴.)
        document.querySelector("#success").addEventListener("click", function() {
        	new swal(
     	       'Success',
     	       'You clicked the <b style="color:green;">Success</b> button!',
     	       'error'
    	    ) */
        	/* Swal.fire({
       		  'Alert가 실행되었습니다.',         // Alert 제목
       		  '이곳은 내용이 나타나는 곳입니다.',  // Alert 내용
       		  'success',                         // Alert 타입
       		}); 
        	
        });*/
        
    	 // 아이디 중복 확인
        const overlappedIDBtn = document.querySelector("#overlappedID");
        overlappedIDBtn.addEventListener("click", function (event) {
//         const signupInput = document.querySelector("#signupRealtor");
//         signupInput.setAttribute("type", "button");
            
            const id = document.querySelector("#userId").value;
            const userIdExp = /^[a-z][a-z0-9]{3,11}$/;
            
            if (!userIdExp.test(id)) {
                showMessage("아이디는 소문자로 시작하고, 영어 소문자와 숫자로 4~12자리여야합니다.");
                return;
            }
        
	        fetch(`/member/idCheck?userId=`+id)
	        .then(response => {
	            if (!response.ok) throw new Error("오류 발생");
	            return response.text();
	        })
	        .then(data => {
	            const olmessage = document.querySelector("#idOlMessage");
	            if (data == 1) {
	                olmessage.textContent = "이미 사용중인 ID 입니다.";
	                olmessage.style.color = "red";
	                isIdChecked = false;
	            } else {
	                olmessage.textContent = "사용 가능한 ID 입니다.";
	                olmessage.style.color = "green";
	                isIdChecked = true;
	            }
	        })
	        .catch(error => {
	            showMessage("아이디 중복확인 중 오류가 발생했습니다.");
	            isIdChecked = false;
	        });
		});
        
     // 이메일 중복 확인
        const overlappedEmailBtn = document.querySelector("#overlappedEmail");
        overlappedEmailBtn.addEventListener("click", function (event) {
            const email = document.querySelector("#userEmail").value;
            const userEmailExp = /^[a-zA-Z0-9._%+-]{4,12}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

            if (!userEmailExp.test(email)) {
                showMessage("이메일 형식이 올바르지 않습니다.");
                return;
            }

            fetch(`/member/emailCheck?userEmail=`+email)
                .then(response => {
                    if (!response.ok) throw new Error("오류 발생");
                    return response.text();
                })
                .then(data => {
                    const emailOlMessage = document.querySelector("#emailOlMessage");
                    if (data == 1) {
                        emailOlMessage.textContent = "이미 사용중인 이메일입니다.";
                        emailOlMessage.style.color = "red";
                        isEmailChecked = false;
                    } else {
                        emailOlMessage.textContent = "사용 가능한 이메일입니다.";
                        emailOlMessage.style.color = "green";
                        isEmailChecked = true;
                    }
                })
                .catch(error => {
                    showMessage("이메일 중복확인 중 오류가 발생했습니다.");
                    isEmailChecked = false;
                });
        });
    </script>
</body>
</html>