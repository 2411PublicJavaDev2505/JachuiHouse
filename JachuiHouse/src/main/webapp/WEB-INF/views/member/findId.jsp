<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
      <link rel="stylesheet" href="../resources/css/footer.css">
      <link rel="stylesheet" href="../resources/css/member/findId.css">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    </head>
    <body>
      <div class="container">
      	<div class="logo-container">
			<div class="login-image">
				<a href="http://localhost:7777">
					<img src="../resources/image/loginEnter.png" alt="로그인 이미지">
				</a>
			</div>
			<div>
        		<h2>아이디 찾기</h2>
        	<div id="msgTag" style="color: red;"></div>
			</div>
		</div>
        
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
          
<!--           <label>인증방식</label> -->
<!--           <div class="confirm-group"> -->
<!--             <label><input type="radio" name="confirmType" value="email" required>이메일 인증</label> -->
<!--             <label><input type="radio" name="confirmType" value="phone" required>휴대폰 인증</label> -->
            
            <button type="submit" class="btn">아이디 찾기</button>
          </div>
        </form>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
      <script>
	      const errorMsg = "${errorMsg }";
			if(errorMsg) {
				showMessage(errorMsg)
			}
			
      		//에러 메시지 처리
//       		<c:if test="${not empty errorMsg}">
// 	      		Swal.fire({
// 	  				icon: 'error',
// 	  				title: '아이디 찾기 실패',
// 	  				text: errorMsg,
// 	  				confirmButtonText: '확인',
// 	  				confirmButtonColor: '#4f46e5'
// 	  			});
//       		</c:if>
      		
//       		// 성공 메시지 처리
//       		<c:if test="${not empty errorMsg}">
// 	      		Swal.fire({
// 	  				icon: 'success',
// 	  				title: '아이디 찾기 실패',
// 	  				text: '${errorMsg}',
// 	  				confirmButtonText: '홈으로 이동',
// 	  				confirmButtonColor: '#4f46e5'
//   			}).then(() => {
//   				window.location.href='/';
//   			});
//       		</c:if>


				// SweetAlert2 이게 띄우는 거. 
		        function showMessage(msg) {
		        	Swal.fire({            		
		         		title: '다시 한 번 확인해주세요.',
		         		text: msg,
		         		icon: 'error',
		       		});
		        }

		
		
      </script>
    </body>
    </html>