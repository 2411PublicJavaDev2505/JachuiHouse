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
	    <link rel="stylesheet" href="../resources/css/report/creport.css">
	    <link rel="stylesheet" href="../resources/css/report/modal.css">
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
		<div class="report">
			<div class= "report-body">
				<div class="head">
					<h1>댓글 신고하기</h1>						
				</div>
				<div class="report-menu">
				<form action="/report/cinsert" method="post">
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
						<button>신고하기</button>
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
					<form action="/report/pinsert" method="post">
						<input type="hidden" name="postNo" value="${result.postNo}">
						<input type="hidden" name="userId" value="${sessionScope.id }">
						<div class="report-content">
							<input type="text" placeholder="사유를 입력해주세요" name='reportReason'> 
						</div>
						<div class="report-area">
							<textarea rows="20" cols="30" placeholder="상세한 내용을 적어주세요." name="reportContent"></textarea>
						</div>
						<div class="reportBtn">
							<button>신고하기</button>
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
	                            <tr>
	                                <th>작성자</th>
	                                <th>내용</th>
	                                <th>관리</th>
	                                <th>작성일</th>
	                            </tr>
	                               <c:forEach items="${cList }" var="comment">
		                               <c:if test="${comment.postNo == result.postNo}">
		                                <tr>
		                                    <td>${comment.userId}</td>
		                                    <td>${comment.commentContent}</td>
		                                    <c:if test="${sessionScope.userId ne comment.userId }">
		                                    	<td><button class="reportbtn" onclick="showReport();">신고하기</button></td>
		                                    </c:if>
		                                     <c:if test="${sessionScope.userId eq comment.userId }">
		                                     	<td>
			                                     	<div class="deletebtn"><a href="/post/cdelete?commentNo=${comment.commentNo }&postNo=${result.postNo}">삭제하기</a></div>
		                                     	</td>
		                                     </c:if>	
		                                    <td>${comment.writeDate}</td>
		                                </tr> 
		                               </c:if>
	                               </c:forEach>
	                           </table>
	                       </div>                   
                    </c:if>
						   <c:if test="${sessionScope.userId ne result.userId }">
							   <button class="reportbtn2" onClick="showReport2();">신고하기</button>
						   </c:if>
                       <form action="/post/cinsert" method="post">
						   <input type="hidden" name="postNo" value="${result.postNo}">
						   <input type="hidden" name="userId" value="${sessionScope.userId }">
						   <div class="underbar">
						   <c:if test="${sessionScope.userId eq result.userId }">
						   		<button class="updatebtn2" onclick="location.href='/post/update?postNo=${result.postNo }'">수정하기</button>
						   		<button class="deletebtn2" type="submit" onclick="/post/delete?postNo=${result.postNo }'">삭제하기</button>		
						   </c:if>
							   <input id="commentInput" type="text" placeholder="댓글을 입력하세요." class="commentbox" name="commentContent">
							   <button class="commentbtn" type="submit">댓글달기</button>
							   <button class="backbtn" type="button" onclick="location.href='/post/list'">목록으로</button>
							</div>
                       </form>
                   </div>
            </div>
   			<jsp:include page="/WEB-INF/views/include/footer.jsp"/>		
	     </div>
	     <script>
			const showReport = () => {
				console.log("확인")
				document.querySelector(".report").style.display = "flex";
			}
			const reportBackToPage = () => {
				document.querySelector(".report").style.display = "none";
			}
			
			const showReport2 = () => {
				console.log("확인")
				document.querySelector(".report2").style.display = "flex";
			}
			const reportBackToPage2 = () => {
				document.querySelector(".report2").style.display = "none";
			}	
	     
	     
	     
			function submitComment() {
			    const commentContent = document.getElementById('commentInput').value;
			    const postNo = '${result.postNo}';
				const userId = "${sessionScope.userId}"
				$.ajax({
					url: "post/cinsert",
					data: {
						"commentContent" : commentContent,
						"userId" : userId,
						"postNo" : postNo
					},
					
					success : function(data) {
					},
					error : function() {
						alert("통신 오류!!");
					}
				});
			}
		</script>
	</body>
</html>