<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자취스크립트</title>
<link rel="stylesheet" href="../resources/css/include/header.css">
<link rel="stylesheet" href="../resources/css/member/accountbook.css">
<link rel="stylesheet" href="../resources/css/include/footer.css">
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<main>
	        <div class="main-container">
	            <div class="account-head">
	            <button onClick="location.href='myPage'" style="font-size:1rem">마이페이지로</button>	                <h1>예산 계산기</h1>
	            </div>
	            <div class="account-contents">
	                <p>주거비</p>
	                <input type="number" min="0" placeholder="숫자로만 입력해주세요." class="cost">
	                <p>식비</p>
	                <input type="number" min="0" placeholder="ex.15000" class="cost">
	                <p>교통비</p>
	                <input type="number" min="0" placeholder="교통비를 입력해주세요." class="cost">
	                <p>통신비</p>
	                <input type="number" min="0" placeholder="통신비를 입력해주세요." class="cost">
	                <p>생활용품</p>
	                <input type="number" min="0" placeholder="생활용품비를 입력해주세요." class="cost">
	                <p>의료비</p>
	                <input type="number" min="0" placeholder="의료비를 입력해주세요." class="cost">
	                <p>교육비</p>
	                <input type="number" min="0" placeholder="교육비를 입력해주세요." class="cost">
	                <p>문화생활</p>
	                <input type="number" min="0" placeholder="문화생활비를 입력해주세요." class="cost">
	            </div>
	            <div class="total">
	                <h2>총 지출</h2>
	                <div class="total-eq">
	                    <input type="text" min="0" readonly class="total-number">
	                    <span>원</span>
	                </div>
	            </div>
	        </div>
	    </main>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
     <script>
        const cost = document.querySelectorAll('.cost');
        const total = document.querySelector('.total-number');

        function calculateTotal()  {
            let totalNum = 0;
            cost.forEach(input => {
                const value = parseFloat(input.value);
                if(!isNaN(value)){
                    totalNum += value;
                }
            });
            // 총합에 100,000으로 표현되게 해줌
            total.value = totalNum.toLocaleString();
        }

        cost.forEach(input => {
            input.addEventListener('input', calculateTotal);
        })
    </script>
</body>
</html>