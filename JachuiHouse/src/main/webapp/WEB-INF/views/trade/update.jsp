<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사방팔아방 상세페이지</title>
    <link rel="stylesheet" href="/resources/css/include/header.css">
    <link rel="stylesheet" href="/resources/css/trade/update.css">
    <link rel="stylesheet" href="/resources/css/include/footer.css">
</head>
<body>
    <div id="container">
        <form class="report-form" action="/trade/update" method="post" enctype="multipart/form-data">
            <jsp:include page="/WEB-INF/views/include/header.jsp" />

            <main class="detail-container">
               
                <input type="hidden" name="tradeNo" value="${trade.tradeNo}" />

                <div class="detail-box">
                    <!-- 작성자 -->
                    <div class="info-row">
                        <div class="label">작성자</div>
                        <div class="value">${trade.userId}</div>
                    </div>

                    <!-- 물품명 -->
                    <div class="info-row">
                        <div class="label">물품명</div>
                        <div class="value">
                            <input type="text" name="tradeTitle" value="${trade.tradeTitle}" required />
                        </div>
                    </div>

                    <!-- 가격 -->
                    <div class="info-row">
                        <div class="label">가격</div>
                        <div class="value">
                            <input type="number" name="tradePrice" value="${trade.tradePrice}" required />
                        </div>
                    </div>

                    <!-- 기존 이미지 -->
                    <c:if test="${not empty trade.tradeFileRename}">
                        <div class="info-row">
                            <div class="label">기존 이미지</div>
                            <div class="value image-wrapper">
                                <img src="${pageContext.request.contextPath}/resources/bUploadFiles/${trade.tradeFileRename}" >
                            </div>
                        </div>
                    </c:if>

                    <!-- 상세내용 -->
                    <div class="info-row">
                        <div class="label">상세내용</div>
                        <div class="value">
                            <textarea name="tradeContent" rows="6" cols="50" required>${trade.tradeContent}</textarea>
                        </div>
                    </div>

                    <!-- 첨부파일 관련 hidden input -->
                    <input type="hidden" name="tradeFilename" value="${trade.tradeFilename}" />
                    <input type="hidden" name="tradeFileRename" value="${trade.tradeFileRename}" />
                    <input type="hidden" name="tradeFilepath" value="${trade.tradeFilepath}" />

                    <!-- 이미지 변경 -->
                    <div class="info-row file-row">
                        <div class="label">이미지 변경</div>
                        <div class="value file-upload">
                            <div class="file-top-row">
                                <label for="fileInput" class="file-label">파일 선택</label>
                                <a href="${pageContext.request.contextPath}/resources/bUploadFiles/${trade.tradeFileRename}" download>
                                    ${trade.tradeFilename}
                                </a>
                            </div>
                            <small>기존 파일: ${trade.tradeFilename}</small>
                            <input type="file" name="reloadFile" id="fileInput" class="file-hidden" />
                        </div>
                    </div>
                </div>

                <div class="button-container">
                    <button type="submit" class="custom-button">수정하기</button>
                </div>
            </main>

        </form>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>

    <script>
        const fileInput = document.getElementById('fileInput');
        const fileLabel = document.querySelector('.file-top-row a');

        fileInput.addEventListener('change', function () {
            if (fileInput.files.length > 0) {
                const fileName = fileInput.files[0].name;
                fileLabel.textContent = fileName;
                fileLabel.removeAttribute('href'); // 선택한 파일은 다운로드 링크가 아니므로 제거
                fileLabel.removeAttribute('download');
            }
        });
    </script>
</body>
</html>