<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>매물 수정</title>
    <link rel="stylesheet" href="/resources/css/estate/modify.css" />
</head>
<body>
<div class="wrapper">
    <h2>매물 수정</h2>
    <form action="/chazabang/modify" method="post" enctype="multipart/form-data">
        <input type="hidden" name="estateNo" value="${estate.estateNo}" />

        <label>거래유형:
            <select name="estateRentType">
                <option value="monthly" ${estate.estateRentType eq 'monthly' ? 'selected' : ''}>월세</option>
                <option value="charter" ${estate.estateRentType eq 'charter' ? 'selected' : ''}>전세</option>
            </select>
        </label><br/>

        <label>보증금: <input type="text" name="estateDeposit" value="${estate.estateDeposit}" /></label><br/>
        <label>월세: <input type="text" id="monthlyRent" name="estateMonthlyRent" value="${estate.estateMonthlyRent}" /></label><br/>

        <label>주소: <input type="text" name="estateAddress" value="${estate.estateAddress}" /></label><br/>

        <label>형태:
            <select name="estateType">
                <option value="onwtwo" ${estate.estateType eq 'onwtwo' ? 'selected' : ''}>원룸/투룸</option>
                <option value="villa" ${estate.estateType eq 'villa' ? 'selected' : ''}>주택/빌라</option>
                <option value="apart" ${estate.estateType eq 'apart' ? 'selected' : ''}>아파트</option>
                <option value="officetel" ${estate.estateType eq 'officetel' ? 'selected' : ''}>오피스텔</option>
            </select>
        </label><br/>

        <label>면적(㎡): <input type="text" name="estateWidth" value="${estate.estateWidth}" /></label><br/>
        <label>층수: <input type="text" name="estateFloor" value="${estate.estateFloor}" /></label><br/>

        <label>
            즉시입주: <input type="checkbox" name="moveinNowYN" value="Y" ${estate.moveinNowYN eq 'Y' ? 'checked' : ''} />
        </label><br/>
        <label>
            입주가능일: <input type="date" id="moveinDate" name="estateMoveinDate" value="${estate.estateMoveinDate}" />
        </label><br/>

        <fieldset>
            <legend>옵션 선택</legend>
            <div class="option-grid">
                <c:forEach var="opt" items="${optionList}">
                    <label class="option-item">
                        <input type="checkbox" name="optionCodes" value="${opt.optionNo}" ${opt.checked ? 'checked' : ''} hidden />
                        <div class="option-img-box">
                            <img src="${pageContext.request.contextPath}/resources/images/estate/option/${opt.optionImg}" alt="${opt.optionName}" />
                        </div>
                        <span class="option-name">${opt.optionName}</span>
                    </label>
                </c:forEach>
            </div>
        </fieldset>

        <div class="form-section">
            <label>기존 이미지</label>
            <c:forEach items="${estateImageList}" var="img">
                <div class="photo-upload-input has-image">
                    <img src="${img.estateFilePath}" class="photo-preview" />
                    <label>
                        <input type="checkbox" name="deleteImageIds" value="${img.estateFileNo}" />
                        삭제
                    </label>
                </div>
            </c:forEach>

            <br/>
            <label>새 이미지 추가 (최대 20장)</label>
            <div id="photo-upload-container" class="photo-upload-container">
                <div class="photo-upload-input">
                    <input type="file" name="images" accept="image/*" onchange="addNextImageInput(this)" />
                </div>
            </div>
        </div>

        <br/>
        <button type="submit">수정 완료</button>
    </form>
</div>

<script>
    function toggleFields() {
        const rentType = document.querySelector('select[name="estateRentType"]').value;
        const monthlyInput = document.getElementById("monthlyRent");
        monthlyInput.disabled = (rentType === "charter");
        if (rentType === "charter") monthlyInput.value = "";

        const nowMoveIn = document.querySelector('input[name="moveinNowYN"]').checked;
        const moveInDate = document.getElementById("moveinDate");
        moveInDate.disabled = nowMoveIn;
        if (nowMoveIn) moveInDate.value = "";
    }

    window.addEventListener('DOMContentLoaded', () => {
        document.querySelector('select[name="estateRentType"]').addEventListener('change', toggleFields);
        document.querySelector('input[name="moveinNowYN"]').addEventListener('change', toggleFields);
        toggleFields();
    });

    let maxPhotos = 20;
    function addNextImageInput(currentInput) {
        const container = document.getElementById('photo-upload-container');
        const inputs = container.querySelectorAll('input[type="file"]');
        if (inputs.length >= maxPhotos) return;

        if (currentInput.files && currentInput.files[0]) {
            const reader = new FileReader();
            reader.onload = function (e) {
                const wrapper = currentInput.closest('.photo-upload-input');
                wrapper.classList.add('has-image');
                const previewImg = document.createElement('img');
                previewImg.src = e.target.result;
                previewImg.classList.add('photo-preview');
                const removeBtn = document.createElement('button');
                removeBtn.type = 'button';
                removeBtn.textContent = 'X';
                removeBtn.classList.add('remove-btn');
                removeBtn.onclick = function () {
                    wrapper.remove();
                };
                wrapper.appendChild(previewImg);
                wrapper.appendChild(removeBtn);
            };
            reader.readAsDataURL(currentInput.files[0]);
        }

        const newWrapper = document.createElement('div');
        newWrapper.classList.add('photo-upload-input');
        const newInput = document.createElement('input');
        newInput.type = 'file';
        newInput.name = 'images';
        newInput.accept = 'image/*';
        newInput.onchange = function () {
            addNextImageInput(this);
        };
        newWrapper.appendChild(newInput);
        container.appendChild(newWrapper);
    }
</script>
</body>
</html>
