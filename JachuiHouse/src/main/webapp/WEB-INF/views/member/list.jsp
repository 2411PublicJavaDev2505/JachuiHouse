<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Member - list</title>
		<link rel="stylesheet" href="../resources/css/include/header.css">
		<link rel="stylesheet" href="../resources/css/notice/list.css">
		<link rel="stylesheet" href="../resources/css/include/footer.css">
	</head>   
<body>
    	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<main class="main">
    	<div id="notice-div">

	        	<form class="report-form" action="/member/search" method="get">
	        		 <div class="search">
		        		 <input class="searchplace" name="searchKeyword" type="text" 
		        		 placeholder="  검색어를 입력하세요." value="${searchKeyword}">
		        		 <button class="btn" type="submit">검색</button>
	        		 </div>	        
		        </form><br>
	        		 
        	<table class="boardbl">
        		<tr>
        			<th>회원 타입</th>
        			<th>이름</th>
        			<th>지역(주소)</th>
        			<th>아이디</th>
        			<th>이메일</th>
        			<th>생년월일</th>
        			<th>공인중개사 승인여부</th>
        		</tr>	
        		<c:forEach var="member" items="${mList}" varStatus="i">
					<tr
					class="member-row"
					    onclick="showMemberInfo(event)"
					      data-userrole="${member.userRole}"
					      data-username="${member.userName}"
					      data-useraddress="${member.userAddress}"
					      data-userid="${member.userId}"
					      data-useremail="${member.userEmail}"
					      data-userbirth="${member.userBirth}"
					      data-approvey="${member.approveYn}"
					      data-realtorno="${member.realtorNo}"
					      >
					      
        				<td>
						    <c:choose>
						        <c:when test="${member.userRole == 'A'}">
						            <span class="notice-type-common">관리자</span>
						        </c:when>
						        <c:when test="${member.userRole == 'M'}">
						            <span class="notice-type-student">자취생</span>
						        </c:when>
						        <c:when test="${member.userRole == 'R'}">
						            <span class="notice-type-agent">공인중개사</span>
						        </c:when>
						        <c:otherwise>
						            ${member.userRole}
						        </c:otherwise>
						    </c:choose>
						</td>
        				<td>${member.userName }</td>
        				<td>${member.userAddress }</td>
        				<td>${member.userId}</td>
        				<td>${member.userEmail}</td>
        				<td>${member.userBirth }</td>
        				<td>${member.approveYn}</td>
        			</tr>
        		</c:forEach>		 
        	</table>
        	<div class="pagination-container">
				<div class="pagination">
					<c:if test="${startNavi ne 1 }">
						<a href="/member/list?page=${startNavi - 1 }" class="prev">&lt;</a>
					</c:if>
					<c:forEach begin="${startNavi }" end="${endNavi }" var="p">
						<a href="/member/list?page=${p }">${p }</a>
					</c:forEach>
					<c:if test="${endNavi ne maxPage }">
						<a href="/member/list?page=${endNavi + 1 }" class="next">&gt;</a>
					</c:if>
				</div>
			</div>
        
	    <div class="board">
       		<!-- admin확인절차 넣어줘야 함 -->
       		<c:if test="${sessionScope.userId == 'admin'}">
       		 	<button class="btn"><a href="member/list">신고 관리</a></button>
       		</c:if>  
       	</div>		
        </div>
	</main>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	
<script>
	function showMemberInfo(event) {
		  const row = event.currentTarget;//tr을 가리킴
		  const role = row.getAttribute("data-userrole");
		  const roleLabel = role === "A" ? "관리자" : (role === "M" ? "자취생" : "공인중개사");
		  const member = {
		    userRole: roleLabel,
		    userName: row.getAttribute("data-username"),
		    userAddress: row.getAttribute("data-useraddress"),
		    userId: row.getAttribute("data-userid"),
		    userEmail: row.getAttribute("data-useremail"),
		    userBirth: row.getAttribute("data-userbirth"),
		    approveYn: row.getAttribute("data-approvey"),
		    realtorNo: row.getAttribute("data-realtorno")
		  };
		  console.log(member);
		  Swal.fire({
		    title: '회원 정보',
		    html: `
		      <div style="text-align: left;">
		        <p><strong>회원타입:</strong>${member.userRole}</p>
		        <p><strong>아이디:</strong> ${member.userId}</p>
		        <p><strong>이름:</strong> ${member.userName}</p>
		        <p><strong>주소:</strong> ${member.userAddress}</p>
		        <p><strong>이메일:</strong> ${member.userEmail}</p>
		        <p><strong>생년월일:</strong> ${member.userBirth}</p>
		        <p><strong>자격증 번호:</strong> ${member.realtorNo}</p>
		      </p>
		      </div>
		    `,
		    showCloseButton: true,
		    showCancelButton: true,
		    confirmButtonText: '중개사 승인',
		    cancelButtonText: '회원 삭제'
		  }).then((result) => {
		    if (result.isConfirmed) {
		      console.log("승인 처리"); // 여기에 승인 AJAX 처리
		    } else if (result.dismiss === Swal.DismissReason.cancel) {
		      console.log("삭제 처리"); // 여기에 삭제 AJAX 처리
		    }
		  });
		}
</script> 
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	</body>
</html>