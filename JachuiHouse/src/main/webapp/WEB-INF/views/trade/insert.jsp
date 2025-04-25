<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사방팔아방 등록페이지</title>
    <link rel="stylesheet" href="/resources/css/include/header.css">
    <link rel="stylesheet" href="/resources/css/trade/insert.css">
    <link rel="stylesheet" href="/resources/css/include/footer.css">
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/include/header.jsp" />

        <main class="detail-container">
            <h2>사방팔아방 등록페이지</h2>

            <form action="/trade/insert" method="post" enctype="multipart/form-data">
                <div class="detail-box">

                    <!-- 작성자 (출력만) -->
                    <div class="info-row">
                        <div class="label">작성자</div>
                        <div class="value">${userId}</div>
                        <input type="hidden" name="userId" value="${userId}" />
                    </div>

                    <!-- 물품명 입력 -->
                    <div class="info-row">
                        <div class="label">물품명</div>
                        <div class="value">
                            <input type="text" name="tradeTitle" placeholder="물품명을 입력하세요" required />
                        </div>
                    </div>

                    <!-- 가격 입력 -->
                    <div class="info-row">
                        <div class="label">가격</div>
                        <div class="value">
                            <input type="number" name="tradePrice" placeholder="가격을 입력하세요" required />
                        </div>
                    </div>

                    <!-- 이미지 업로드 및 미리보기 -->
                    <div class="info-row">
                        <div class="label">이미지</div>
                        <div class="value image-wrapper">
                            <input type="file" name="uploadFile" accept="image/*" onchange="previewImage(event)" required />
                            <div class="image-preview">
                                <img id="productPreview" src="/resources/bUploadFiles/default-image.png" alt="미리보기 이미지" class="product-image" />
                            </div>
                        </div>
                    </div>

                    <!-- 상세내용 입력 -->
                    <div class="info-row">
                        <div class="label">상세내용</div>
                        <div class="value">
                            <textarea name="tradeContent" placeholder="상품에 대한 상세 설명을 작성해주세요" rows="6" required></textarea>
                        </div>
                    </div>

                    <!-- (주석 처리된 첨부파일 입력 영역) -->
                    <!--
                    <div class="info-row">
                        <div class="label">첨부파일</div>
                        <div class="value">
                            <input type="file" name="uploadFile" />
                        </div>
                    </div>
                    -->

                </div>

                <div class="register-button-wrapper">
                    <button type="submit" class="register-button">등록</button>
                </div>
            </form>

            <!-- 이미지 미리보기 스크립트 -->
            <script>
                function previewImage(event) {
                    const file = event.target.files[0];
                    const preview = document.getElementById('productPreview');
                    if (file && file.type.startsWith('image/')) {
                        const reader = new FileReader();
                        reader.onload = function(e) {
                            preview.src = e.target.result;
                        };
                        reader.readAsDataURL(file);
                    } else {
                        preview.src = "/resources/img/default-image.png";
                    }
                }
            </script>
        </main>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
</body>
</html>