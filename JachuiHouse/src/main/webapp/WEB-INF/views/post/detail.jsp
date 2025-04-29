<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자취록 상세조회</title>
	    <link rel="stylesheet" href="../resources/css/include/header.css">
	    <link rel="stylesheet" href="../resources/css/include/footer.css">
	    <link rel="stylesheet" href="../resources/css/post/detail.css">
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
		<div class="report">
			<div class= "report-body">
				<div class="head">
					<h1>댓글 신고하기</h1>						
				</div>
				<div class="report-menu">
				<form id="commentReportForm" action="/report/cinsert" method="post">
					<c:forEach items="${cList }" var="comment">
						<input type="hidden" name="commentNo" value="${comment.commentNo}">
					</c:forEach>
					<input type="hidden" name="postNo" value="${result.postNo}">
					<input type="hidden" name="userId" value="${sessionScope.id }">
					<div class="report-content">
						<input type="text" placeholder="사유를 입력해주세요" name='reportReason'> 
					</div>
					<div class="report-area">
						<textarea rows="20" cols="30" placeholder="상세한 내용을 적어주세요." name="reportContent"></textarea>
					</div>
					<div class="reportBtn">
					    <button type="button" onclick="reportPost('comment')">신고하기</button>
					    <button type="button" onclick="reportBackToPage();">뒤로가기</button>
					</div>
				</form>
				</div>
			</div>
		</div>	
		<div class="report2">
			<div class= "report-body">
				<div class="head">
					<h1>게시글 신고하기</h1>						
				</div>
				<div class="report-menu">
					<form id="postReportForm" action="/report/pinsert" method="post">
						<input type="hidden" name="postNo" value="${result.postNo}">
						<input type="hidden" name="userId" value="${sessionScope.id }">
						<div class="report-content">
							<input type="text" placeholder="사유를 입력해주세요" name='reportReason'> 
						</div>
						<div class="report-area">
							<textarea rows="20" cols="30" placeholder="상세한 내용을 적어주세요." name="reportContent"></textarea>
						</div>
						<div class="reportBtn">
						    <button type="button" onclick="reportPost('post')">신고하기</button>
						    <button type="button" onclick="reportBackToPage2();">뒤로가기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
       	<div id="main-container">
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
           <div class="main">
                <div class="post">
                    <div class="postinf">
                        <div class="p1"><div class="posttxt">게시판 종류 :</div> ${result.postType }</div> <br>
                        <div class="p1"><div class="posttxt">공고글 제목 :</div> ${result.postTitle }</div> <br> 
                    </div>
                    <div class="postcontent"> ${result.postContent }</div>
                    <c:set var="hasComments" value="false" />
						<c:forEach items="${cList}" var="comment">
						    <c:if test="${comment.postNo == result.postNo}">
						        <c:set var="hasComments" value="true" />
						    </c:if>
						</c:forEach>					
						<c:if test="${hasComments}">
							<div class="comment">
							    <table class="commenttbl">
							        <thead>
							            <tr>
							                <th>작성자</th>
							                <th>내용</th>
							                <th>작성일</th>
							                <th>관리</th>
							                <c:if test="${sessionScope.userId eq 'admin'}">
							                   <th>관리자 삭제 권한</th>
							               </c:if>
							           </tr>
							       </thead>
							
							       <!-- 여기! tbody로 감싸고 id 부여 -->
							       <tbody id="commentListContainer">
							           <c:forEach items="${cList}" var="comment">
							               <c:if test="${comment.postNo == result.postNo}">
							                   <tr>
							                       <td>${comment.userId}</td>
							                       <td>${comment.commentContent}</td>
							                       <td>${comment.writeDate}</td>
							                       <c:if test="${sessionScope.userId ne comment.userId}">
							                           <td><button class="reportbtn" onclick="showReport();">신고하기</button></td>
							                       </c:if>
							                       <c:if test="${sessionScope.userId eq comment.userId or sessionScope.userId eq 'admin'}">
							                           <td>
							                               <div class="deletebtn">
							                                   <a href="/post/cdelete?commentNo=${comment.commentNo}&postNo=${result.postNo}">삭제하기</a>
							                               </div>
							                           </td>
							                       </c:if>	
							                   </tr> 
							               </c:if>
							           </c:forEach>
							        </tbody>
							    </table>
							</div>         
                    	</c:if>
                    	<div class="footer-container">
					    <c:if test="${sessionScope.userId ne result.userId }">
						   <button class="reportbtn2" onClick="showReport2();">신고하기</button>
					    </c:if>
                       <form action="/post/cinsert" method="post">
						   <input type="hidden" name="postNo" value="${result.postNo}">
						   <input type="hidden" name="userId" value="${sessionScope.userId }">
						   <div class="underbar">
							   <c:if test="${sessionScope.userId eq result.userId}">
								    <button class="updatebtn2" type="button" onclick="confirmUpdate(${result.postNo})">수정하기</button>
								    <button class="deletebtn2" type="button" onclick="confirmDelete(${result.postNo})">삭제하기</button>
								</c:if>
								
								<!-- 관리자에게 게시글 삭제 권한 부여 -->
								<c:if test="${sessionScope.userId eq 'admin'}">
								    <button class="deletebtn2" type="button" onclick="confirmDelete(${result.postNo})">삭제하기</button>
								</c:if>
								<div class="comment-write">
							    <input id="commentInput" name="commentContent" type="text" placeholder="댓글을 입력하세요.">
							    <button type="button" class="commentbtn" onclick="submitComment()">댓글달기</button>
							</div>
							
							<button class="backbtn" type="button" onclick="location.href='/post/list'">목록으로</button>
							</div>
                    	</div>
                       </form>
                   </div>
            </div>
   			<jsp:include page="/WEB-INF/views/include/footer.jsp"/>		
	     </div>
		<script>
		    // 댓글 신고 모달 열기
		    const showReport = () => {
		        console.log("댓글 신고 모달 열기");
		        document.querySelector(".report").style.display = "flex";
		    }
		
		    // 댓글 신고 모달 닫기
		    const reportBackToPage = () => {
		        document.querySelector(".report").style.display = "none";
		    }
		
		    // 게시글 신고 모달 열기
		    const showReport2 = () => {
		        console.log("게시글 신고 모달 열기");
		        document.querySelector(".report2").style.display = "flex";
		    }
		
		    // 게시글 신고 모달 닫기
		    const reportBackToPage2 = () => {
		        document.querySelector(".report2").style.display = "none";
		    }
		
		    // 신고하기 처리
		    function reportPost(type) {
		        const reason = (type === 'comment')
		            ? document.querySelector("#commentReportForm input[name='reportReason']").value.trim()
		            : document.querySelector("#postReportForm input[name='reportReason']").value.trim();
		
		        const content = (type === 'comment')
		            ? document.querySelector("#commentReportForm textarea[name='reportContent']").value.trim()
		            : document.querySelector("#postReportForm textarea[name='reportContent']").value.trim();
		
		        // 빈칸 체크
		        if (reason === "" || content === "") {
		            alert("신고 내용을 입력하세요.");
		            return; // 더 진행하지 않고 종료
		        }
		
		        const confirmReport = confirm("신고하시겠습니까?");
		        if (confirmReport) {
		            alert("신고가 완료되었습니다.");
		            if (type === 'comment') {
		                document.getElementById("commentReportForm").submit();
		            } else if (type === 'post') {
		                document.getElementById("postReportForm").submit();
		            }
		        }
		    }		
		    
		 	// 댓글 등록
		    function submitComment() {
		        const commentInput = document.getElementById('commentInput');
		        const commentContent = commentInput.value.trim();
		        const postNo = '${result.postNo}';
		        const userId = "${sessionScope.userId}";

		        if (commentContent === "") {
		            alert("댓글을 입력하세요.");
		            return;
		        }

		        if (commentContent.length > 300) {
		            alert("댓글은 300자 이내로 입력해주세요.");
		            return;
		        }

		        console.log("commentContent:", commentContent);
		        console.log("postNo:", postNo);
		        console.log("userId:", userId);

		        $.ajax({
		            url: "/post/cinsert",
		            method: "POST",
		            data: {
		                "commentContent": commentContent,
		                "userId": userId,
		                "postNo": postNo
		            },
		            success: function(data) {
		                alert("댓글이 등록되었습니다.");
		                commentInput.value = ""; // 입력창 비우기
		                loadCommentList(); // 댓글 목록 새로 불러오기
		                location.href = `/post/detail?postNo=${result.postNo}`;
		            },
		            error: function(xhr, status, error) {
		                console.error("Error details:", status, error);
		                alert("댓글 등록 중 오류가 발생했습니다. 다시 시도해주세요.");
		            }
		        });
		    }

		    // 댓글 목록 불러오기
		    function loadCommentList() {
		        const postNo = '${result.postNo}'; // 현재 게시글 번호

		        $.ajax({
		            url: "/cList",
		            method: "GET",
		            success: function(commentList) {
		                const commentListContainer = document.getElementById('commentListContainer');
		                commentListContainer.innerHTML = ""; // 초기화

		                // 현재 게시글에 해당하는 댓글만 표시
		                const filteredComments = commentList.filter(comment => comment.postNo == postNo);

		                if (filteredComments.length === 0) {
		                    commentListContainer.innerHTML = "<p>등록된 댓글이 없습니다.</p>";
		                    return;
		                }

		                filteredComments.forEach(function(comment) {
		                    const commentItem = document.createElement('div');
		                    commentItem.className = "comment-item";
		                    commentItem.innerHTML = `
		                        <p><strong>${comment.userId}</strong>: ${comment.commentContent}</p>
		                    `;
		                    commentListContainer.appendChild(commentItem);
		                });
		            },
		            error: function(xhr, status, error) {
		                console.error("댓글 목록 불러오기 실패:", status, error);
		            }
		        });
		    }

		    // 엔터 키로 댓글 등록
		    document.getElementById('commentInput').addEventListener('keypress', function(event) {
		        if (event.key === 'Enter') {
		            event.preventDefault(); // 폼 제출 방지
		            submitComment(); // 댓글 등록
		        }
		    });

		    // 페이지 진입 시 댓글 목록 바로 로딩
		    document.addEventListener('DOMContentLoaded', function() {
		        loadCommentList();
		    });
			
		 	
		 	
		    // 엔터 키를 눌렀을 때 폼 제출을 막고, 댓글 등록 함수 호출
		    document.getElementById('commentInput').addEventListener('keypress', function(event) {
		        if (event.key === 'Enter') {
		            event.preventDefault(); // 폼 제출 방지
		            submitComment(); // 댓글 등록 함수 호출
		        }
		    });
	
		    function confirmUpdate(postNo) {
		        if (confirm("수정하시겠습니까?")) {
		            location.href = '/post/update?postNo=' + postNo;
		        }
		    }

		    function confirmDelete(postNo) {
		        if (confirm("삭제하시겠습니까?")) {
		            location.href = '/post/delete?postNo=' + postNo;
		        }
		    }
		</script>
	</body>
</html>