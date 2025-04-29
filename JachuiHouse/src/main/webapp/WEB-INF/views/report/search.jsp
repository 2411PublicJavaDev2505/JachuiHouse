<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Report - list</title>
		<link rel="stylesheet" href="../resources/css/include/header.css">
		<link rel="stylesheet" href="../resources/css/notice/list.css">
		<link rel="stylesheet" href="../resources/css/include/footer.css">
	</head>   
<body>
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
<!-- 이 JSP는 report 컨트롤러 작업이랑 상세사항 작업 연결해야 함 -->
	<main class="main">
    	<div id="notice-div">

	        	<form class="report-form" action="/report/search" method="get">
<!-- 	        	'신고종류' 옵션추가 -->
	        		 <div class="search">
		        		 <input class="searchplace" name="searchKeyword" type="text" 
		        		 placeholder="   검색어를 입력하세요." value="${searchKeyword}">
		        		 <button class="btn" type="submit">검색</button>
	        		 </div>	        
		        </form> 
	        		 
        	<table class="boardbl">
        		<tr>
<!--         			<th>신고 종류</th> -->
        			<th>신고 사유</th>
<!--         			<th>신고글 제목</th> -->
        			<th>작성자</th>
        			<th>작성일</th>
        		</tr>	
        		<c:forEach var="reportVO" items="${searchList}" varStatus="i">
<!-- 	        					자바스크립트로 창열리게 하기:회원관리처럼 -->
        			<tr
        			class="member-row"
        				onclick="showReportInfo(event)"
        				data-reportno="${reportVO.reportNo }"
        				data-reportreason="${reportVO.reportReason }"
        				data-userid="${reportVO.userId }"
        				data-reportdate="${reportVO.reportDate }"
        				data-reportcontent="${reportVO.reportContent }"
        				data-postno="${reportVO.postNo }"
        				data-posttitle="${reportVO.postTitle }"
        				data-commentcontent="${reportVO.commentContent}"
        			>

        				<td>${reportVO.reportReason }</td>
        				<td>${reportVO.userId}</td>
        				<td><fmt:formatDate pattern = "yyyy/MM/dd" value="${reportVO.reportDate }"/></td>
        			</tr>
        		</c:forEach>		 
        	</table>
        	
        	<div class="pagination-container">
				<div class="pagination">
					<c:if test="${startNavi ne 1 }">
						<a href="/report/search?page=${startNavi - 1 }&searchKeyword=${searchKeyword}" class="prev">&lt;</a>
					</c:if>
					<c:forEach begin="${startNavi}" end="${endNavi}" var="p">
					    <a href="/report/search?page=${p}&searchKeyword=${searchKeyword}">${p}</a>
					</c:forEach>
					<c:if test="${endNavi ne maxPage }">
						<a href="/report/search?page=${endNavi + 1 }&searchKeyword=${searchKeyword}" class="next">&gt;</a>
					</c:if>
				</div>
			</div>
        
	    <div class="board">
       		<!-- admin확인절차 넣어줘야 함 -->
       		<c:if test="${sessionScope.userId == 'admin'}">
       		 	<button class="btn"><a href="/member/list">회원 관리</a></button>
       		</c:if>  
       	</div>		
        </div>
	</main> 
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	
<script>
	function showReportInfo(event){
		const row = event.currentTarget;
		const reportVO = {
			userId: row.getAttribute("data-userid"),
			reportNo: row.getAttribute("data-reportno"),
			reportDate: row.getAttribute("data-reportdate"),
			reportReason: row.getAttribute("data-reportreason"),
			reportContent: row.getAttribute("data-reportcontent"),
			postNo: row.getAttribute("data-postno"),
			postTitle: row.getAttribute("data-posttitle"),
			commentContent: row.getAttribute("data-commentcontent"),
		};
		Swal.fire({
			title: '신고 관리',
			html: `
			  <div style="text-align: left;">
			  	<p><strong>아이디:</strong>`+reportVO.userId+`</p>
			  	<p><strong>신고날짜:</strong>`+reportVO.reportDate+`</p>
			  	<p><strong>신고사유:</strong>`+reportVO.reportReason+`</p>
			  	<p><strong>신고내용:</strong>`+reportVO.reportContent+`</p>
			  	<p><strong>원본번호:</strong>`+reportVO.postNo+`</p>
			  	<p><strong>[게시글]:</strong>`+reportVO.postTitle+`</p>
			  	<p><strong>[댓글]:</strong>`+reportVO.commentContent||'이 글은 게시글 신고'+`</p>
			  </div>
			  `,
			  showCloseButton: true,
			  showCancelButton: true,
			  confirmButtonText: '게시글 조회',
			  cancelButtonText: '신고 반려'
		}).then((result) => {
			if(result.isConfirmed){
				// 🔽 게시글 조회
				window.location.href = '/post/detail?postNo=' + reportVO.postNo;
				}
			else if (result.dismiss === Swal.DismissReason.cancel) {
		    	
		        // 🔽 신고 반려 로직
		        Swal.fire({
		          title: "정말로 신고 반려하시겠습니까?",
		          icon: "warning",
		          showCancelButton: true,
		          confirmButtonText: "신고 반려",
		          cancelButtonText: "취소"
		        }).then((res) => {
		          if (res.isConfirmed) {
		              console.log("신고 반려 No: ", reportVO.reportNo);
		        	fetch('/report/delete', {
		              method: 'POST',
		              headers: {
		                'Content-Type': 'application/x-www-form-urlencoded'
		              },
		              body: `reportNo=`+reportVO.reportNo 
		            })
		            .then(response => response.text())
		            .then(data => {
	                	if (data === "success") {
			              Swal.fire("신고 반려", "신고 반려되었습니다.", "success").then(() => {
			                location.reload(); 
			              });
		                } else {
		                    Swal.fire("오류", "실패했습니다.", "error");
		                }
		            })
		            .catch(error => {
		              console.error("삭제 중 오류 발생:", error);
		              Swal.fire("오류", "실패했습니다.", "error");
		            });
		          }
		        });
		      }	    
		    });
	}
</script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	</body>
</html>