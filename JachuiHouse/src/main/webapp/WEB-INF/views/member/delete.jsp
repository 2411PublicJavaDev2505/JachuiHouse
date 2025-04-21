<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자취스크립트</title>
<link rel="stylesheet" href="../resources/css/include/header.css">
<link rel="stylesheet" href="../resources/css/member/delete.css">
<link rel="stylesheet" href="../resources/css/include/footer.css">
</head>
<body>
		<div class="container">
			<jsp:include page="/WEB-INF/views/include/header.jsp" />
				<main>
			            <div class="main-container">
			            <form action="/member/delete" method="post">
			                <div class="delete-head">
			                    <h2>회원탈퇴 신청</h2>
			                </div>
			                 <input type="hidden" name="userId" value="${sessionScope.userId}" />
			                <div class="password">
			                <label>비밀번호 입력 :</label>
			                    <input type="password" id="pw" name="userPw" placeholder="비밀번호를 입력해주세요." >
			                </div>
			                <div class="opinion">
			                    <label class="opinion-label">고객님의 의견</label>
			                    <textarea placeholder="자취하우스에 대한 불만사항이나 의견이 있으면 기재 부탁드립니다." name="textarea_name" id="textarea_id" rows="15" cols="100%"></textarea>
			                </div>
			                <div class="control-container">
			                    <input type="checkbox" id="a" class="screen-reader">
			                    <div class="label-box">
			                        <span class="check-icon" aria-hidden="true"></span>
			                        <label for="a">회원탈퇴에 동의합니다.</label>
			                    </div>
			                </div>
			                <div class="button-area">
			                    <button class="cancelBtn" type="button" onClick="backToMyPage();">취소</button>
			                    <button class="deleteBtn" type="button" onClick="confirmDelete(event)">탈퇴</button>
			                </div>
			            </form>
			            </div> 
			        </main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</div>
		<script type="text/javascript">
		function confirmDelete(event) {
			event.preventDefault(); 
			const checkbox = document.getElementById("a");

			if (!checkbox.checked) {
				alert("회원탈퇴에 동의해주세요.");
				return;
			}
			const confirmed = confirm("정말로 탈퇴하시겠습니까?");
			if (confirmed) {
				document.querySelector("form").submit();
			}
		}
		backToMyPage = () => {
			location.href = "myPage";
		}
		
		</script>
</body>
</html>