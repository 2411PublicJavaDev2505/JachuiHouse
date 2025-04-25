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
        <form action="/chazabang/insert" method="post" enctype="multipart/form-data">
            <label>거래유형:
                <select name="estateRentType">
                    <option value="monthly">월세</option>
                    <option value="charter">전세</option>
                </select>
            </label><br/>

            <label>보증금: <input type="text" name="estateDeposit" placeholder="만 단위로 적어주세요(10000=1억)"/></label><br/>
            <label>월세: <input type="text" id="monthlyRent" name="estateMonthlyRent" placeholder="만 단위로 적어주세요"/></label><br/>

            <label>주소: <input type="text" name="estateAddress"/></label><br/>

            <label>형태:
                <select name="estateType">
                    <option value="onwtwo">원룸/투룸</option>
                    <option value="villa">주택/빌라</option>
                    <option value="apart">아파트</option>
                    <option value="officetel">오피스텔</option>
                </select>
            </label><br/>
            
            <label>면적(㎡): <input type="text" name="estateWidth"/></label><br/>

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
				      <input type="checkbox" name="optionCodes" value="1" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/세탁기.png" alt="세탁기"/>
				     	</div>
				      	<span class="option-name">세탁기</span>
				    </label>
				    
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="3" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/건조기.png" alt="건조기"/>
				     	</div>
				      	<span class="option-name">건조기</span>
				    </label>
				  
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="2" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/냉장고.png" alt="냉장고"/>
				     	</div>
				      	<span class="option-name">냉장고</span>
				    </label>
				  
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="10" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/인덕션.png" alt="인덕션"/>
				     	</div>
				      	<span class="option-name">인덕션</span>
				    </label>
				  
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="12" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/가스레인지.png" alt="가스레인지"/>
				     	</div>
				      	<span class="option-name">가스레인지</span>
				    </label>
				  
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="8" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/전자레인지.png" alt="전자레인지"/>
				     	</div>
				      	<span class="option-name">전자레인지</span>
				    </label>
				  
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="4" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/에어컨.png" alt="에어컨"/>
				     	</div>
				      	<span class="option-name">에어컨</span>
				    </label>
				    
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="5" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/TV.png" alt="TV"/>
				     	</div>
				      	<span class="option-name">TV</span>
				    </label>
				  
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="11" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/침대.png" alt="침대"/>
				     	</div>
				      	<span class="option-name">침대</span>
				    </label>
				  
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="6" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/도어락.png" alt="도어락"/>
				     	</div>
				      	<span class="option-name">도어락</span>
				    </label>
				  
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="7" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/신발장.png" alt="신발장"/>
				     	</div>
				      	<span class="option-name">신발장</span>
				    </label>
				  
				    <label class="option-item">
				      <input type="checkbox" name="optionCodes" value="9" hidden/>
				      	<div class="option-img-box">
				        	<img src="${pageContext.request.contextPath}/resources/images/estate/option/비데.png" alt="비데"/>
				     	</div>
				      	<span class="option-name">비데</span>
				    </label>
				  </div>
				  <div class="form-section">
					  <label>매물 사진 (최대 20장)</label>
					  <div id="photo-upload-container" class="photo-upload-container">
					  	<div class="photo-upload-input">
					  		<input type="file" name="images" accept="image/*" onchange="addNextImageInput(this)"/>
					   </div>
					</div>
				</div>
			</fieldset>
            <br/>
            <button type="submit">등록하기</button>
        </form>
    </div>
    <script>
    	// input null처리
        function toggleFields() {
            const rentType = document.querySelector('select[name="estateRentType"]').value;
            const monthlyInput = document.getElementById("monthlyRent");
            monthlyInput.disabled = (rentType === "charter");
            monthlyInput.value = (rentType === "charter") ? "" : monthlyInput.value;

            const nowMoveIn = document.querySelector('input[name="moveinNowYN"]').checked;
            const moveInDate = document.getElementById("moveinDate");
            moveInDate.disabled = nowMoveIn;
            moveInDate.value = nowMoveIn ? "" : moveInDate.value;
        }

        window.addEventListener('DOMContentLoaded', () => {
            document.querySelector('select[name="estateRentType"]').addEventListener('change', toggleFields);
            document.querySelector('input[name="moveinNowYN"]').addEventListener('change', toggleFields);
            toggleFields();
        });
        // 사진 추가 
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
		
		            // 이미지 미리보기
		            const previewImg = document.createElement('img');
		            previewImg.src = e.target.result;
		            previewImg.classList.add('photo-preview');
		
		            // 삭제 버튼
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
		
		    if (currentInput.files.length > 0) {
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
		}
    </script>
</body>
</html>
