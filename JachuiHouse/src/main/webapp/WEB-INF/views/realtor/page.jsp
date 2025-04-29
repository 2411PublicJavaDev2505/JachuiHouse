<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사 페이지</title>
<link rel="stylesheet" href="../resources/css/include/header.css">
<link rel="stylesheet" href="../resources/css/include/footer.css">
<link rel="stylesheet" href="../resources/css/realtor/mypage.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
    <main>
        <div id="mainAll">
            <div id="mainLeft">
                <div id="profile">
                    <div id="photo">
                        <img src="/Image20250120123326.png">
                    </div>
                </div>
                <div id="name">
                    <b>${realtor.userId }</b>
                </div>
                <div id="intro">
                    공인중개사 ${realtor.userName }입니다.
                </div>
                <div id="company">
                    ${realtor.realtorName}
                </div>
                <div id="phone">
                    ${realtor.userPhone }
                </div>
                <div id="email">
                    ${realtor.userEmail }
                </div>
                <div id="modi">
                	<a href="/realtor/update">
                    	<button type="submit" id="modify">신고하기</button>
                   	</a>
                </div>
                <!-- <div id="del">
                	<a href="/member/delete">
                    	<button type="submit" id="delete">회원 탈퇴</button>
                    </a>
                </div> -->         
            </div>
            <div id="mainRight">
                <div id="content-intro">
                	<div id="text-box">
                    	<b>${realtor.userName}님의 게시글</b>
                    </div>
                    <a href="/chat/list">
                    	<button type="submit" id="chatList">채팅 문의</button>
                    </a>
                </div>
                <c:if test="${empty cList}">
                	<div id="none">
						<b><p>게시글이 존재하지 않습니다.</p></b>
					</div>
				</c:if>
                <c:forEach items="${eList }" var="estate">
                <div id="content">
                    <div id="roomImg">
						<a href="/chazabang/detail/${estate.estateNo }" class="estate" data-type="${est.estateType}">
							<img src="${estate.estateFileList[0].estateFilePath}" alt="이미지 준비중">
						</a>  
                    </div>
                    <div id="roomIntro">
                        <div id="top">
                            <div id="top-in">
                                <div id="jongro">
                                	<a href="/chazabang/detail/${estate.estateNo }" class="estate" data-type="${est.estateType}">
                                    	<b>${estate.estateAddress}</b>                                     	
                                  	</a>
                                </div>
                                <div id="button-box">
                                	<c:if test="${userId eq estate.userId}">
                                		<a href="/chazabang/modify/${estate.estateNo }">
                                    		<button type="button" id="update">수정</button>
                                		</a>
                               		 	<a href="/chazabang/delete/${estate.estateNo }">
                                    		<button type="button" id="x">삭제</button>
                                		</a>
                                	</c:if>
                                </div>
                            </div>
                        </div>
                        <div id="mid">
                            <div id="top-in">
                            	<a href="/chazabang/detail/${estate.estateNo }" class="estate" data-type="${est.estateType}">
                                	<c:if test="${estate.estateRentType eq 'charter' }">
                                    	<b>전세 ${estate.estateDeposit }</b>                                    	
                                    	</c:if>
                                   	<c:if test="${estate.estateRentType eq 'monthly' }">
                                   		<b>월세 ${estate.estateDeposit }/${estate.estateMonthlyRent }</b>
                                   	</c:if>
                        		</a>
                            </div>
                        </div>
                        <div id="bot">
                            <div id="top-in">
                                <text><a href="/chazabang/detail/${estate.estateNo }" class="estate" data-type="${est.estateType}">
                                	<c:if test="${estate.estateType eq 'onetwo'}">
                                		<b>원룸/투룸</b>
                        			</c:if>
                        			<c:if test="${estate.estateType eq 'villa'}">
                        				<b>주택/빌라</b>
                        			</c:if>
                                	<c:if test="${estate.estateType eq 'apart'}">
                        				<b>아파트</b>
                        			</c:if>
                        			<c:if test="${estate.estateType eq 'officetel'}">
                        				<b>오피스텔</b>
                        			</c:if>
                        		</a> ${estate.estateFloor }층, ${estate.estateWidth }㎡</text>
                            </div>
                        </div>
                	</div>           
                </div>            	            	
            </c:forEach>
            <div class="pagination">
				<c:if test="${startNavi ne 1 }">
					<a href="/realtor/myPage?page=${startNavi - 1 }" class="prev">&lt;</a>
				</c:if>
				<c:forEach begin="${startNavi }" end="${endNavi }" var="p">
					<a href="/realtor/myPage?page=${p }">${p }</a>
				</c:forEach>
				<c:if test="${endNavi ne maxPage }">
					<a href="/realtor/myPage?page=${endNavi + 1 }" class="next">&gt;</a>
				</c:if>
			</div>
        </div>
    </main>
    <footer>
        이용약관 | 광고문의 | 개인정보처리방침 | 찾아오시는길 | 회사명: 자취스크립트(주) | 대표자 : 강우혁 | 문의 전화: 010-2222-3333
    </footer>
</body>
</html>