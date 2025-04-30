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
					      data-approveyn="${member.approveYn}"
					      data-realtorno="${member.realtorNo}"
					      data-filepath="${member.filePath}"
						  data-filerename="${member.fileRename}"
						  data-filename="${member.fileName}"
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
       		 	<button class="btn"><a href="/report/list">신고 관리</a></button>
       		 	<button class="btn"><a href="/notice/list">공지사항</a></button>
       		</c:if>  
       	</div>		
        </div>
	</main>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	
<script>
	function showMemberInfo(event) {// 📌 사용자가 어떤 줄(tr)을 클릭했는지 알아내는 코드
		  const row = event.currentTarget;// 클릭한 줄(tr)을 가져와
		// 📌 역할(role)이 뭔지 가져오고, 글자로 바꿔줘
		  const role = row.getAttribute("data-userrole");// 예: "A", "M", "R"
		  const roleLabel = role === "A" ? "관리자" : (role === "M" ? "자취생" : "공인중개사");
		// 역할을 사람이 보기 좋은 말로 바꿔주는 거야
		
		 // 📌 줄(tr)에서 회원 정보를 꺼내서 member라는 상자에 담는 거야
		  const member = {
		    userRole: roleLabel,
		    userName: row.getAttribute("data-username"),
		    userAddress: row.getAttribute("data-useraddress"),
		    userId: row.getAttribute("data-userid"),
		    userEmail: row.getAttribute("data-useremail"),
		    userBirth: row.getAttribute("data-userbirth"),
		    approveYn: row.getAttribute("data-approveyn"),
		    realtorNo: row.getAttribute("data-realtorno"),
		    filePath: row.getAttribute("data-filepath"),
		    fileRename: row.getAttribute("data-filerename"),
		    fileName: row.getAttribute("data-filename")
		  };

		  // 📌 Swal로 회원 정보 보여주는 알림창을 띄워줘
		  Swal.fire({
		    title: '회원 정보',
		    html: `
		      <div style="text-align: left;"><!-- 왼쪽 정렬 -->
		        <p><strong>회원타입:</strong>`+member.userRole+`</p>
		        <p><strong>아이디:</strong>`+member.userId+`</p>
		        <p><strong>이름:</strong>`+member.userName+`</p>
		        <p><strong>주소:</strong>`+member.userAddress+`</p>
		        <p><strong>이메일:</strong>`+member.userEmail+`</p>
		        <p><strong>생년월일:</strong>`+member.userBirth+`</p>
		        <p><strong>자격증 번호:</strong>`+member.realtorNo+`</p>
				<p><strong>첨부파일:</strong> 
				  <a href="` + member.filePath + `/` + member.fileRename + `" download="` + member.fileName + `">` + member.fileName + `</a>
				</p>
		      </div>
		    `,
		    showCloseButton: true,// 오른쪽 위에 'X' 닫기 버튼
		    showCancelButton: true,
		    confirmButtonText: '중개사 승인',
		    cancelButtonText: '회원 삭제'
		  }).then((result) => {
		    if (result.isConfirmed) {
		    	  // 🔽 승인 처리 요청
		    	fetch('/member/approve', {
		    	    method: 'POST',
		    	    headers: {
		    	      'Content-Type': 'application/x-www-form-urlencoded'
		    	    },
		    	    body: `userId=`+member.userId
		    	  })
		    	  .then(response => response.text())
		    	  .then(data => {
		    		if(data == "success") {
			    	    Swal.fire("승인 완료", "중개사 승인이 완료되었습니다.", "success").then(() => {
			    	      location.reload(); // 새로고침해서 갱신
			    	    });
		    		}else{
		    			Swal.fire("오류", "승인이 완료되지 않았습니다.", "error");
		    		}
		    	  })
		    	  .catch(error => {
		    	    console.error("승인 중 오류 발생:", error);
		    	    Swal.fire("오류", "승인에 실패했습니다.", "error");
		    	  });
		    } else if (result.dismiss === Swal.DismissReason.cancel) {
		    	
		        // 🔽 회원 삭제 로직
		        Swal.fire({
		          title: "정말로 삭제하시겠습니까?",
		          icon: "warning",
		          showCancelButton: true,// 🟡 '취소' 버튼
		          confirmButtonText: "삭제",
		          cancelButtonText: "취소"
		        }).then((res) => {// 🟢 알림창에서 사용자가 뭘 눌렀는지 결과(res)를 받아와
		          if (res.isConfirmed) {// 🟢 사용자가 '삭제'를 눌렀다면
		        	// 🧹 진짜로 회원을 삭제하는 요청을 서버에 보내는 부분
		              console.log("삭제할 회원 ID: ", member.userId);
		        	
		        	fetch('/member/delete-by-admin', {// 🔵 서버의 이 주소에 요청을 보낼 거야
		              method: 'POST',// 🔵 'POST'는 서버에 뭔가를 보내는 방식(삭제할 ID 같은 정보)
		              headers: {
		                'Content-Type': 'application/x-www-form-urlencoded'// 🔵 보내는 데이터 형식을 알려주는 거야
		              },
		              body: `userId=`+member.userId // 🔵 삭제할 회원의 ID를 서버에 보내는 거야
		            })
		            .then(response => response.text())// 🔵 서버가 보낸 응답을 글자로 바꿔
		            .then(data => {// 🟢 삭제가 성공하면 다시 알림창을 띄워
	                	if (data === "success") {
			              Swal.fire("삭제 완료", "회원이 삭제되었습니다.", "success").then(() => {
			                location.reload(); // 🟢 알림창 닫히면 화면을 새로고침해서 바뀐 걸 보여줘
			              });
		                } else {
		                    Swal.fire("오류", "삭제에 실패했습니다.", "error");
		                }
		            })
		            .catch(error => {
		            	 // 🔴 만약 삭제하는 도중에 문제가 생기면
		              console.error("삭제 중 오류 발생:", error);// 🔴 오류를 콘솔에 보여줘 (개발자용)
		              Swal.fire("오류", "삭제에 실패했습니다.", "error");// 🔴 사용자에게 실패했다고 알려줘
		            });
		          }
		        });
		      }	    
		    });
		    	
// 		      console.log("삭제 처리"); // 여기에 삭제 AJAX 처리
// 		    }
// 		  });
		}
</script> 
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	</body>
</html>