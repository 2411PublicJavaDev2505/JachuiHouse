<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>매물 수정</title>
    <link rel="stylesheet" href="/resources/css/estate/insert.css"/>
</head>
<body>
    <div class="wrapper">
        <h2>매물 수정</h2>
        <form action="/chazabang/modify" method="post" enctype="multipart/form-data">
            <input type="hidden" name="estateNo" value="${estate.estateNo}"/>

            <label>거래유형:
                <select name="estateRentType">
                    <option value="monthly" ${estate.estateRentType == 'monthly' ? 'selected' : ''}>월세</option>
                    <option value="charter" ${estate.estateRentType == 'charter' ? 'selected' : ''}>전세</option>
                </select>
            </label><br/>

            <label>보증금: <input type="text" name="estateDeposit" value="${estate.estateDeposit}"/></label><br/>
            <label>월세: <input type="text" id="monthlyRent" name="estateMonthlyRent" value="${estate.estateMonthlyRent}"/></label><br/>

            <label>주소: <input type="text" name="estateAddress" value="${estate.estateAddress}"/></label><br/>

            <label>형태:
                <select name="estateType">
                    <option value="onetwo" ${estate.estateType == 'onetwo' ? 'selected' : ''}>원룸/투룸</option>
                    <option value="villa" ${estate.estateType == 'villa' ? 'selected' : ''}>주택/빌라</option>
                    <option value="apart" ${estate.estateType == 'apart' ? 'selected' : ''}>아파트</option>
                    <option value="officetel" ${estate.estateType == 'officetel' ? 'selected' : ''}>오피스텔</option>
                </select>
            </label><br/>

            <label>면적(㎡): <input type="text" name="estateWidth" value="${estate.estateWidth}"/></label><br/>
            <label>층수: <input type="text" name="estateFloor" value="${estate.estateFloor}"/></label><br/>

            <label>
                즉시입주: <input type="checkbox" name="moveinNowYN" value="Y" ${estate.moveinNowYN == 'Y' ? 'checked' : ''}/>
            </label><br/>
            <label>
                입주가능일: <input type="date" name="estateMoveinDate" value="${estate.estateMoveinDate}" ${estate.moveinNowYN == 'Y' ? 'disabled' : ''}/>
            </label><br/>

            <label>기존 이미지</label><br/>
            <c:forEach items="${estateImageList}" var="img">
                <div>
                    <img src="${img.estateFilePath}" width="150"/>
                    <label><input type="checkbox" name="deleteImageIds" value="${img.estateFileNo}"/> 삭제</label>
                </div>
            </c:forEach><br/>

            <label>새 이미지 추가</label>
            <input type="file" name="images" multiple/><br/>

            <fieldset>
                <legend>옵션 선택</legend>
                <div class="option-grid">
                    <c:forEach items="${estate.estateOptionList}" var="option">
					    <label class="option-item">
					        <input type="checkbox" name="optionCodes" value="${option.optionNo}"
					            ${fn:contains(estateOptionListAsString, ',' + option.optionNo + ',') ? 'checked' : ''} />
					        <div class="option-img-box">
					            <img src="/resources/images/estate/option/${option.optionName}.png" alt="${option.optionName}"/>
					        </div>
					        <span class="option-name">${option.optionName}</span>
					    </label>
					</c:forEach>
                </div>
            </fieldset>

            <br/>
            <button type="submit">수정 완료</button>
        </form>
    </div>
    <script>
		document.addEventListener("DOMContentLoaded", function () {
		    const checkbox = document.querySelector("input[name='moveinNowYN']");
		    const dateInput = document.querySelector("input[name='estateMoveinDate']");
		
		    function toggleMoveinDate() {
		        if (checkbox.checked) {
		            dateInput.disabled = true;
		            dateInput.value = ""; // 서버로 빈 값 전송
		        } else {
		            dateInput.disabled = false;
		        }
		    }
		
		    checkbox.addEventListener("change", toggleMoveinDate);
		    toggleMoveinDate(); // 페이지 로드 시 초기 적용
		});
	</script>
</body>
</html>
