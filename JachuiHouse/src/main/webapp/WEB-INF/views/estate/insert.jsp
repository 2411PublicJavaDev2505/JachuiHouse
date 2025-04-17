<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>매물 등록</title>
    <Link rel="stylesheet" href="/resources/css/estate/insert.css"/>
</head>
<body>
    <div class="wrapper">
        <h2>매물 등록</h2>
        <form action="${pageContext.request.contextPath}/chazabang/insert" method="post">
            <label>거래유형:
                <select name="estateRentType">
                    <option value="월세">월세</option>
                    <option value="전세">전세</option>
                </select>
            </label><br/>

            <label>보증금: <input type="text" name="estateDeposit"/></label><br/>
            <label>월세: <input type="text" id="monthlyRent" name="estateMonthlyRent"/></label><br/>

            <label>주소: <input type="text" name="estateAddress"/></label><br/>

            <label>면적(㎡): <input type="text" name="estateWidth"/></label><br/>

            <label>형태:
                <select name="estateType">
                    <option value="원룸/투룸">원룸/투룸</option>
                    <option value="주택/빌라">주택/빌라</option>
                    <option value="아파트">아파트</option>
                    <option value="오피스텔">오피스텔</option>
                </select>
            </label><br/>

            <label>층수: <input type="text" name="estateFloor"/></label><br/>

            <label>
                즉시입주: <input type="checkbox" name="moveinNowYN" value="Y"/>
            </label><br/>
            <label>
                입주가능일: <input type="date" id="moveinDate" name="estateMoveinDate"/>
            </label><br/>

            <fieldset>
				<legend>옵션 선택</legend>
				<div class="option-grid">
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="세탁기" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/세탁기.png" alt="세탁기"/>
				     	</div>
				      	<span class="option-name">세탁기</span>
				    </label>
				  </div>
				  <div class="option-grid">
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="건조기" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/건조기.png" alt="건조기"/>
				     	</div>
				      	<span class="option-name">건조기</span>
				    </label>
				  </div>
				  <div class="option-grid">
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="냉장고" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/냉장고.png" alt="냉장고"/>
				     	</div>
				      	<span class="option-name">냉장고</span>
				    </label>
				  </div>
				  <div class="option-grid">
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="인덕션" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/인덕션.png" alt="인덕션"/>
				     	</div>
				      	<span class="option-name">인덕션</span>
				    </label>
				  </div>
				  <div class="option-grid">
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="가스레인지" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/가스레인지.png" alt="가스레인지"/>
				     	</div>
				      	<span class="option-name">가스레인지</span>
				    </label>
				  </div>
				  <div class="option-grid">
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="전자레인지" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/전자레인지.png" alt="전자레인지"/>
				     	</div>
				      	<span class="option-name">전자레인지</span>
				    </label>
				  </div>
				  <div class="option-grid">
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="에어컨" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/에어컨.png" alt="에어컨"/>
				     	</div>
				      	<span class="option-name">에어컨</span>
				    </label>
				  </div>
				  <div class="option-grid">
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="TV" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/TV.png" alt="TV"/>
				     	</div>
				      	<span class="option-name">TV</span>
				    </label>
				  </div>
				  <div class="option-grid">
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="침대" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/침대.png" alt="침대"/>
				     	</div>
				      	<span class="option-name">침대</span>
				    </label>
				  </div>
				  <div class="option-grid">
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="도어락" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/도어락.png" alt="도어락"/>
				     	</div>
				      	<span class="option-name">도어락</span>
				    </label>
				  </div>
				  <div class="option-grid">
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="신발장" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/신발장.png" alt="신발장"/>
				     	</div>
				      	<span class="option-name">신발장</span>
				    </label>
				  </div>
				  <div class="option-grid">
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="비데" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/비데.png" alt="비데"/>
				     	</div>
				      	<span class="option-name">비데</span>
				    </label>
				  </div>
			</fieldset>
            <br/>
            <button type="submit">등록하기</button>
        </form>
    </div>
    <script>
        function toggleFields() {
            const rentType = document.querySelector('select[name="estateRentType"]').value;
            const monthlyInput = document.getElementById("monthlyRent");
            monthlyInput.disabled = (rentType === "전세");
            monthlyInput.value = (rentType === "전세") ? "" : monthlyInput.value;

            const nowMoveIn = document.querySelector('input[name="moveinNowYN"]').checked;
            const moveInDate = document.getElementById("moveinDate");
            moveInDate.disabled = nowMoveIn;
            moveInDate.value = nowMoveIn ? "" : moveInDate.value;
        }

        window.addEventListener('DOMContentLoaded', () => {
            document.querySelector('select[name="estateRentType"]').addEventListener('change', toggleFields);
            document.querySelector('input[name="moveinNowYN"]').addEventListener('change', toggleFields);
            toggleFields(); // 초기 상태 적용
        });
    </script>
</body>
</html>
