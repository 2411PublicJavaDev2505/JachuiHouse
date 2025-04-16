<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자취스크립트</title>
<link rel="stylesheet" href="../resources/css/include/header.css">
<link rel="stylesheet" href="../resources/css/member/update.css">
<link rel="stylesheet" href="../resources/css/include/footer.css">
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<main>
            <div class="main-container">
                <div class="main-header">
                    <h1>회원 정보 수정</h1>
                </div>
                <form action="/update" method="post">
                <div class="main-contents">
                
                    <label>
                        ID
                    </label> <br>
                        <input type="text" readonly /> <br>
                        <label >
                            비밀번호
                        </label> <br>
                        <input type="password"> <br>
                        <label for="">
                            이름
                        </label> <br>
                        <input type="text" readonly> <br>
                        <label for="">
                            전화번호
                        </label> <br>
                        <input type="text"> <br>
                        <label for="">
                            주소
                        </label> <br>
                        <input type="text"> <br>
                        <label for="">
                            상호명
                        </label> <br>
                        <input type="text"> <br>
                   </div>
                </form>
                   <div class="button">
                       <div class="cancelBtn">
                           <button onClick="backToPage();">취소</button>
                        </div>
                        <div class="updateBtn">
                            <button type="submit">수정</button>
                        </div>
                   </div>
            </div>
        </main>	
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
	<script type="text/javascript">
		backToPage = () => {
			location.href = "/member/myPage"
		}
	</script>
</body>
</html>