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
		        		 <input class="searchplace" name="searchKeyword" type="text" placeholder="   검색어를 입력하세요.">
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
        		<c:forEach var="reportVO" items="${rList}" varStatus="i">
<!-- 	        					자바스크립트로 창열리게 하기:회원관리처럼 -->
        			<tr
        			class="member-row"
        				onclick="showReportInfo(event)"
        				data-reportreason="${reportVO.reportReason }"
        				data-userid="${reportVO.userId }"
        				data-reportdate="${reportVO.reportDate }"
<%--         				data-reportcontent="${reportVO.reportContent }" --%>
<%--         				data-posttitle="${postVO.postTitle }" --%>
<%--         				data-postcontent="${postVO.postContent }" --%>
        			>
<!--         				<td> -->
<%-- 						    <c:choose> --%>
<%-- 						        <c:when test="${reportVO.noticeType == '댓글'}"> --%>
<%-- 						            <span class="notice-type-common">${noticeVO.noticeType}</span> --%>
<%-- 						        </c:when> --%>
<%-- 						        <c:when test="${reportVO.noticeType == '게시판'}"> --%>
<%-- 						            <span class="notice-type-student">${noticeVO.noticeType}</span> --%>
<%-- 						        </c:when> --%>
<%-- 						        <c:otherwise> --%>
<%-- 						            ${noticeVO.noticeType} --%>
<%-- 						        </c:otherwise> --%>
<%-- 						    </c:choose> --%>
<!-- 						</td> -->
        				<td>${reportVO.reportReason }</td>
<%-- 	        				<c:if test="${sessionScope.postNo == postVO.postNo}"> --%>
<%-- 	        					<td>${postVO.postTitle }</td> --%>
<%-- 	        				</c:if> --%>
        				<td>${reportVO.userId}</td>
        				<td><fmt:formatDate pattern = "yyyy/MM/dd" value="${reportVO.reportDate }"/></td>
        			</tr>
        			</a>
        		</c:forEach>		 
        	</table>
        	
        	<div class="pagination-container">
				<div class="pagination">
					<c:if test="${startNavi ne 1 }">
						<a href="/report/list?page=${startNavi - 1 }" class="prev">&lt;</a>
					</c:if>
					<c:forEach begin="${startNavi }" end="${endNavi }" var="p">
						<a href="/report/list?page=${p }">${p }</a>
					</c:forEach>
					<c:if test="${endNavi ne maxPage }">
						<a href="/report/list?page=${endNavi + 1 }" class="next">&gt;</a>
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
		const user = {
			reportreason: row.getAttribute("data-reportreason"),
			userId: row.getAttribute("data-userid"),
			reportdate: row.getAttribute("data-reportdate"),
// 			reportcontent: row.getAttribute("data-reportcontent"),
// 			posttitle: row.getAttribute("data-posttitle"),
// 			postcontent: row.getAttribute("data-postcontent")
		};
		Swal.fire({
			title: '신고 관리',
			html: `
			  <div style="text-align: left;">
			  	<p><strong>아이디:</strong>`+reportVO.userId+`</p>
			  	<p><strong>신고날짜:</strong>`+reportVO.reportDate+`</p>
			  	<p><strong>신고내용:</strong>`+reportVO.reportContent+`</p>
			  	<p><strong>신고사유:</strong>`+reportVO.reportReason+`</p>
			  	<p><strong>신고제목:</strong>`+postVO.postTitle+`</p>
			  	<p><strong>신고게시글:</strong>`+postVO.postContent+`</p>
			  </div>
			  `,
			  showCloseButton: true,
			  showCancelButton: true,
			  confirmButtonText: '신고게시글 검색',
			  cancelButtonText: '신고 반려'
		}).then((result) => {
			if(result.isConfirmed){
				// 🔽 신고 게시글 검색
				fetch('post/search?category=none&searchKeyword=${postVO.postTitle}',{//이거 주소 맞는지 모르겠어
				}
					method: 'POST',
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded'//보내는 데이터 형식
		    	    },
		    	    body: `postNo=`+postVO.postNo
		    	  })
		    	  .then(response => response.text())
		    	  .then(data => {
		    		if(data == "success") {
			    	    Swal.fire("승인 완료", "중개사 승인이 완료되었습니다.", "success").then(() => {
			    	      location.reload();
			    	    });
		    		}else{
		    			Swal.fire("오류", "신고 게시글이 검색되지 않았습니다.", "error");
		    		}
		    	  })
		    	  .catch(error => {
		    	    console.error("검색 중 오류 발생:", error);
		    	    Swal.fire("오류", "신고 게시글 조회에 실패했습니다.", "error");
		    	  });
		    } else if (result.dismiss === Swal.DismissReason.cancel) {
		    	
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
</script>
	
	</body>
</html>