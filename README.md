

![자취 Script (3)](https://github.com/user-attachments/assets/c525680d-acbc-4f3e-8987-863fe4631902)

# 자취하우스

## 팀 소개

![3](https://github.com/user-attachments/assets/850e7379-d790-4417-a5ce-320cf845ddde)


## 팀원 소개

![14](https://github.com/user-attachments/assets/ce63e8b8-6bbe-4853-a367-c2727fbd15cd)

## 기획의도

![6](https://github.com/user-attachments/assets/51257e2b-2d35-4408-9954-967c6df39597)


## 차별성

![13](https://github.com/user-attachments/assets/44a69ddf-f0e9-4464-b7e5-ff3cc2fe9643)


## 개발일정

[53.pdf](https://github.com/user-attachments/files/19997240/53.pdf)


## 프로젝트 개발환경

- DB는 오라클 11g XE 버전을 이용하였습니다.
- 프론트엔드 & 백엔드 개발은 Spring Boot sts4, Visual Studio를 사용했습니다.

## 프로젝트 실행 방법

1. 오라클 11g를 설치한 후에 application.yml 에 있는

```
spring.datasource.username
```
```
spring.datasource.password
```

를 참고해서 계정을 만듭니다. <br><br>
이때
```
spring.datasource.url
```
을 확인해서 spring.datasource.url 을 변경한 후에 거기에 계정을 만드는 걸로 합니다.<br><br>
2. 그 계정에 RESOURCE, CONNECT 권한을 부여합니다. <br>
3. [CREATE SQL](./GNTOUR_CREATE.sql) 를 참고해서 테이블을 구성합니다.
4. [INSERT SQL](./INSERT_TRAVEL_INFO.sql) 를 참고해서 데이터를 구성합니다.
5. 환경변수를 다음과 같이 설정합니다.
```
GANGNEUNG_UPLOAD_FOLDER_PATH: [업로드할 폴더 경로] +"/"
EMAIL_APP_ID: [GMAIL 계정]
EMAIL_APP_PW: [GMAIL APP PASSWORD]
```

6. 그런 다음 Intellij 에서 실행을 합니다.

## 기술 스택

![HTML](https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS](https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
<br>
![Tomcat](https://img.shields.io/badge/apache%20tomcat-F8DC75?style=for-the-badge&logo=apache%20tomcat&logoColor=black)
![GitHub](https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white)
<br>
![Spring Boot](https://img.shields.io/badge/spring%20boot-6DB33F?style=for-the-badge&logo=spring%20boot&logoColor=white)
![Oracle](https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![Java](https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white)


## 주요기능
### 자취생  마이페이지

|기능명|상세|
|--|--|
|회원 정보 조회/수정/탈퇴|사용자는 마이페이지에서 본인의 정보를 조회 가능하고,회정 정보 수정을 눌러 아이디, 이름, 생년월일을 제외한 나머지를 수정할 수 있고, 본인인의 비밀번호를 입력하고 동의 버튼을 눌러 비밀번호가 일치하면 회원탈퇴가 가능하다.  |
|예산계산기|주거비, 식비, 교통비, 통신비, 생활용품, 의료비, 교육비, 문화생활에 숫자를 입력하면 자동으로 계산해준다. |
|내채팅 조회|현재 채팅중인 채팅목록이 나오고 상대방의 이름, 아이디, 마지막 메시지, 채팅방 타입이 나온다 채팅방 타입은 중고거래인지 부동산 거래인지 구분해서 표현된다.|
|내가 쓴 글 조회|자취록에 내가 작성한 글을 조회 가능하며 페이지에는 3개만 출력되고 더보기를 누르면 내가 쓴 글이 전부 조회되며,클릭하여 상세보기로 가서 댓글도 조회 할 수 있다.|
|내가 올린 물건|사방팔방에 내가 올린 물건을 조회 가능하며 페이지에는 6개만 표현되고 더보기를 누르면 내가 올린 물건 모든 글이 조회되며, 클릭하여 상세보기로 가서 정보를 볼 수 있다.|

### 공인중개사  마이페이지

|기능명|상세|
|--|--|
|즐겨찾기 조회/삭제|사용자는 즐겨찾기 한 여행지에 대한 정보를 조회 및 삭제를 할 수 있습니다.|
|즐겨찾기 정렬|기준에 따라 내림차순이나 오름차순 정렬을 할 수 있습니다. 기준은 즐겨찾기 등록을 한 시점입니다.|
|여행 일기|사용자가 여행지에 대한 일기를 작성 할 수 있고, 수정, 삭제를 할 수 있습니다. 일기에서 아이템 클릭시 여행지 정보 조회 및 리뷰 페이지로 이동할 수 있습니다. 일기 작성을 할 때는 제목, 내용, 날짜, 첨부파일(선택)을 업로드 할 수 있습니다.|
|내가 작성한 리뷰|사용자가 작성했던 리뷰의 목록을 볼 수 있고,수정,삭제를 하기위해서 여행지 상세조회 리뷰탭으로 이동합니다.|

### 회원간 중고거래 기능

|기능명|상세|
|--|--|
|중고거래 물품 목록페이지(회원)|중고물품을 볼 수 있는 목록페이지로서 중고물품에 대한 이미지와 함께 그에 대한 가격 , 조회수, 물품에 거래 상태에 대한 정보를 확인할 수 있으며 최신 등록순으로 보여집니다.  회원인 경우 중고물품판매글을 작성을 할 수 있습니다.|
 |중고거래 물품 목록페이지(비회원)|중고물품을 볼 수 있는 목록페이지로서 중고물품에 대한 이미지와 함께 그에 대한 가격 , 조회수, 물품에 거래 상태에 대한 정보를 확인할 수 있으며 최신 등록순으로 보여집니다. |
 |중고거래 물품 상세페이지(회원)|중고물품에 대한 자세한 정보를 볼 수 있는 상세페이지로서 중고물품에 대한 가격, 상품 이미지, 상세내용, 작성일, 거래상태 등에 대한 정보를 얻을수 있으며 글을 쓴 작성자는 거래상태, 수정, 삭제 등을 할 수 있으며 다른 사람과의 1대1 채팅도 가능하다. |
 |중고거래 물품 상세페이지(비회원)|중고물품에 대한 자세한 정보를 볼 수 있는 상세페이지로서 중고물품에 대한 가격, 상품 이미지, 상세내용, 작성일, 거래상태 등에 대한 정보를 얻을 수 있습니다.|
 |중고거래 물품 등록|로그인을 한 자취생만이 중고거래 물품을 등록하는 페이지이다. 물품을 등록시에는 물품에 대한 사진과 그에 해당하는 물품 정보를 작성해주어야 한다.|
 |중고거래 물품 수정|자신이 작성한 글을 수정할 수 있습니다. 물품명, 가격,  상세내용,  첨부파일을 수정 가능하다.|
 |중고거래 물품 삭제|자신이 작성한 글을 삭제할 수 있습니다. 삭제시에 작성한 글은 작성자와 다른 사람에게 보이지 않습니다.|
 |중고거래 물품 조회(검색)|중고물품은 물품명, 작성자로 검색할 수 있고, 검색결과에 해당하는 물품이 없을시에 검색 결과가 없다고 표시되며 검색시엔 중고물품들이 조회순으로 보여지며 작성자로 검색 시 작성자의 중고물품이 조회순으로 보여진다.|
 |중고거래 물품 판매여부|중고물품을 올렸을시 작성자만이 거래상태(판매중, 거래완료)를 버튼을 클릭함으로써 변경시킬 수 있다|


### 공인중개사들이 올린 부동산 매물 리스트 조회

|기능명|상세|
|--|--|
|부동산 목록 조회|여러 공인중개사들이 올린 |
|여행지 검색 기능|리스트의 오른쪽 상단에 있는 검색창을 통해 사용자는 여행지 이름을 입력하는 방식으로 원하는 여행지를 찾을 수 있습니다.|
|여행지 필터 기능|검색창의 우측에는 필터 아이콘이 있고 클릭 시 강릉시의 세부지도와 카테고리를 선택할 수 있는 팝업창이 뜹니다. 사용자는 권역별(주문진권, 시내권, 경포권, 대관령권, 정동진 옥계권) 또는 카테고리(산·트래킹, 바다·해안, 호수·공원, 전시, 역사·유적, 레저·체험)를 선택(복수 선택 가능)하여 원하는 정보를 찾을 수 있습니다.|
|여행지 즐겨찾기 기능|썸네일 오른쪽 상단에 있는 별표 이모티콘을 통해 즐겨찾기로 설정하거나 해제할 수 있습니다. 여행지 세부 정보 조회 페이지에서도 즐겨찾기를 설정하거나 해제할 수 있습니다.|

### 중고거래와 부동산 매물 페이지를 이용한 1:1 채팅

|기능명|상세|
|--|--|
|중고거래 1대1 실시간 채팅 기능(구매자 - 판매자)|로그인을 한 상태에서만 이용 가능하고, 중고물품을 거래하는 구매자와 판매자가 채팅 기능을 이용하여 실시간으로 서로 소통을 할 수 있다.|
|여행지 리뷰|기존에 작성되어 있는 리뷰를 최신순으로 조회할 수 있고, 각각의 리뷰에 댓글을 남길 수 있습니다. 여행지에 대한 별점과 리뷰(추가, 수정, 삭제)를 남길 수 있습니다. 리뷰 작성 시 첨부파일을 최대 5장 추가할 수 있습니다. 작성된 리뷰에 댓글을 남겨 댓글창을 열고 닫을 수 있습니다. 리뷰랑 댓글 신고 버튼이 있어 신고 사유를 선택하면 신고된 내용을 관리자가 보고 판단하에 삭제하거나 사용자를 제재할 수 있습니다.|

### 공지사항

|기능명|상세|
|--|--|
|중고거래 1대1 실시간 채팅 기능(구매자 - 판매자)|로그인을 한 상태에서만 이용 가능하고, 중고물품을 거래하는 구매자와 판매자가 채팅 기능을 이용하여 실시간으로 서로 소통을 할 수 있다.|
|공지사항 리스트 조회 및 검색 기능|유저(회원+비회원)는 공지사항을 확인할 수 있으며, 공지사항의 개수가 많거나 찾고자 하는 내용이 있을 경우 검색창을 통해서 ‘제목’, ‘내용’ 항목을 선택하여 공지사항을 검색할 수 있습니다.|

### 게시판

|기능명|상세|
|--|--|
|게시글 조회|전체 리스트, 자유게시판, 질문게시판, 팁 게시판 중 하나를 선택하여 볼 수 있다. |
|게시글 상세 조회|로그인 한 회원은 다른 회원들의 게시글에 들어가 상세 내용을 확인하고 다른 회원들의 댓글을 확인할 수 있다.|
|게시글 검색|전체 리스트, 자유게시판, 질문게시판, 팁 게시판 중 하나를 선택하고 원하는 글의 제목을 검색해서 볼 수 있다. |
|게시글 등록|로그인 한 회원은 자유게시판, 질문게시판, 팁 게시판 중 하나를 선택한 후 제목과 내용을 입력하여 게시글을 작성할 수 있다.|
|게시글 수정|로그인 한 회원은 자신이 작성한 게시글의 제목과 내용, 게시할 게시판을 수정할 수 있다.|
|게시글 삭제|로그인 한 회원은 자신이 작성한 게시글을 삭제할 수 있다.|
|게시글 신고|로그인 한 회원은 부적합한 게시글을 신고할 수 있다.|
|댓글 작성|로그인 한 회원은 게시글에 들어가 댓글을 작성할 수 있다.|
|댓글 삭제|로그인 한 회원은 자신이 작성한 댓글을 삭제할 수 있다.|
|댓글 신고|로그인 한 회원은 부적합한 댓글을 신고할 수 있다.|
=======
>>>>>>> 3623e8c7d099bb058bae025c27851614e2a102d4

## 화면 구현

### 1. 메인
![image](https://github.com/user-attachments/assets/2b118f2b-780f-4b92-8c8b-394d26f184dd)
- 메인페이지

### 2. 마이페이지
![image](https://github.com/user-attachments/assets/a28bd36b-8650-482d-8d45-da6bbfb883bc)
- 내정보, 내채팅, 내가 쓴 글, 내가 올린 물건을 조회할 수 있고, 클릭하여 상세보기를 할 수 있다.

### 3. 회원 정보 수정
![image](https://github.com/user-attachments/assets/3ca6d3fe-86d3-4a10-96e9-47cec2fa5a8a)
- 아이디, 이름, 생년월일을 제외한 나머지를 수정할 수 있다.

### 4. 회원 탈퇴
![image](https://github.com/user-attachments/assets/0e99f882-0221-4f8d-9521-2c135bdcd12e)
- 비밀번호를 입력하고 동의 버튼을 클릭해야 회원 탈퇴가 진행된다. 틀리면 오류를 발생


### 5. 예산계산기
![image](https://github.com/user-attachments/assets/7a18dcb5-2225-4aa4-9782-0d571d568410)
- 주거비, 식비, 교통비, 통신비, 생활용품, 의료비, 교육비, 문화생활에 숫자를 입력하면 자동으로 계산해준다.

### 게시글 조회
![스크린샷(10)](https://github.com/user-attachments/assets/202b712e-8c91-4fc4-9855-13d78a43204f)

### 게시글 상세조회
![스크린샷(3)](https://github.com/user-attachments/assets/f25df5b8-2861-4028-ad07-1ab9121a3821)

### 게시글 검색
![스크린샷(15)](https://github.com/user-attachments/assets/da3c66b9-7e0e-475c-8e4f-adc96acb059f)

### 게시글 등록
![스크린샷(2)](https://github.com/user-attachments/assets/5639711b-1ef6-4c17-bbc6-be9b19212f92)

### 게시글 수정
![스크린샷(8)](https://github.com/user-attachments/assets/362ffa7c-d041-44f9-a867-0e03456cdc9a)

### 게시글 삭제
![스크린샷(9)](https://github.com/user-attachments/assets/e4fb182a-aa38-4d35-b591-e35899bf89ea)

### 게시글 신고
![스크린샷(6)](https://github.com/user-attachments/assets/828eb915-8be3-4b7c-95bd-fbd6663b93e1)

### 댓글 등록
![스크린샷(12)](https://github.com/user-attachments/assets/b8785a05-7da6-40ae-b68d-e52124269a9c)

### 댓글 삭제
![스크린샷(9)](https://github.com/user-attachments/assets/2812af3b-480f-47f4-b3ab-f67f478efa08)

### 댓글 신고
![스크린샷(7)](https://github.com/user-attachments/assets/38c97611-8184-4d8c-b73b-fe88f44f5f75)

### 중고거래게시판

### 중고거래게시판 목록(회원)
![중고거래게시판 목록(회원)](https://github.com/user-attachments/assets/a8e6cebe-0ea1-43bb-a449-a075d3305bbc)
- 중고물품을 볼 수 있는 목록페이지로서 중고물품에 대한 이미지와 함께 그에 대한 가격 , 조회수, 물품에 거래 상태에 대한 정보를 확인할 수 있으며 최신 등록순으로 보여지며 회원인 경우 중고물품판매글을 작성을 할 수 있다.
  
### 중고거래게시판 목록(비회원)
![중고거래게시판 목록페이지(비회원)](https://github.com/user-attachments/assets/1b0bdc83-e107-4991-bcb8-01cd1b27c157)
- 중고물품을 볼 수 있는 목록페이지로서 중고물품에 대한 이미지와 함께 그에 대한 가격 , 조회수, 물품에 거래 상태에 대한 정보를 확인할 수 있으며 최신 등록순으로 보여진다. 

### 중고거래게시판 상세(회원)
![중고거래게시판 상세(회원)](https://github.com/user-attachments/assets/1b49ae6f-970b-4f93-993d-a1100dafb987)
- 중고물품에 대한 자세한 정보를 볼 수 있는 상세페이지로서 중고물품에 대한 가격, 상품 이미지, 상세내용, 작성일, 거래상태 등에 대한 정보를 얻을수 있으며 글을 쓴 작성자는 거래상태, 수정, 삭제 등을 할 수 있으며 다른 사람과의 1대1 채팅도 가능하다. 

### 중고거래게시판 상세(비회원)
![중고거래게시판 상세(비회원)](https://github.com/user-attachments/assets/d34f888e-ad0b-437c-bd39-a60f9dc39e18)
- 중고물품에 대한 자세한 정보를 볼 수 있는 상세페이지로서 중고물품에 대한 가격, 상품 이미지, 상세내용, 작성일, 거래상태 등에 대한 정보를 얻을 수 있다.

### 중고거래게시판 등록
![중고거래게시판 등록](https://github.com/user-attachments/assets/a37dfcc0-47a5-435b-9097-882d5445b37a)
- 로그인을 한 자취생만이 중고거래 물품을 등록하는 페이지이다. 물품을 등록시에는 물품에 대한 사진과 그에 해당하는 물품 정보를 작성해주어야 한다.

### 중고거래게시판 수정
![중고거래게시판 수정](https://github.com/user-attachments/assets/a0541e9e-9e22-4ec0-a1be-3e564a9eb44e)
- 자신이 작성한 글을 수정할 수 있다. 물품명, 가격,  상세내용,  첨부파일을 수정 가능하다.

### 중고거래게시판 삭제
![중고거래게시판 삭제1](https://github.com/user-attachments/assets/b4df9ef1-7633-4d93-b8ec-36273bc08f0f)
![중고거래게시판 삭제2](https://github.com/user-attachments/assets/3d0d9f71-41fd-4dfe-861c-049b1af1e268)
![중고거래게시판 삭제3](https://github.com/user-attachments/assets/8bb1e490-ee32-4207-997c-962f76878fdc)
- 자신이 작성한 글을 삭제할 수 있다. 삭제시에 작성한 글은 작성자와 다른 사람에게 보이지 않는다.

### 중고거래게시판 검색(조회)
![중고거래게시판 검색(조회)](https://github.com/user-attachments/assets/fed1d944-1e1d-468d-90e3-4ec416f4a1fc)
![중고거래게시판 검색(조회)2](https://github.com/user-attachments/assets/687525bb-be4b-43b1-b348-f388ad0f79e1)
- 중고물품은 물품명, 작성자로 검색할 수 있고, 검색결과에 해당하는 물품이 없을시에 검색 결과가 없다고 표시되며 검색시엔 중고물품들이 조회순으로 보여지며 작성자로 검색 시 작성자의 중고물품이 조회순으로 보여진다.

### 중고거래게시판 판매여부
![중고거래게시판 검색(조회)](https://github.com/user-attachments/assets/def42a16-9e76-4c86-b3f9-0152324e571f)
![중고거래게시판 판매여부2](https://github.com/user-attachments/assets/15b3892c-0fd9-4ddb-a40e-adf2fa0743af)
![중고거래게시판 판매여부3](https://github.com/user-attachments/assets/80b46bf8-920c-4575-9a45-999987f67933)
- 중고물품을 올렸을시 글을 쓴 작성자만이 거래상태(판매중, 거래완료)를 버튼을 클릭함으로써 변경시킬 수 있다.

### 중고거래와 부동산 매물 페이지를 이용한 1:1 채팅

### 중고거래 1:1 채팅
![중고거래게시판 채팅페이지](https://github.com/user-attachments/assets/3ce4950e-4da6-490f-aae0-597cededdf73)
- 로그인을 한 상태인 자취생인 회원들만 이용 가능하고, 중고물품을 거래하는 구매자와 판매자가 채팅 기능을 이용하여 실시간으로 서로 소통을 할 수 있다.

## 프로젝트 후기

### 강우혁

### 이하나

### 채소형

### 황수만
- 처음 프로젝트를 시작할 때, 우리 팀은 서로에게 피해를 주지 않으면서 각자의 역할과 분야에 책임감을 가지고 임하자는 약속을 했습니다. 그 다짐이 프로젝트가 끝날 때까지 잘 지켜졌다는 점이 정말 다행이었고, 팀원들 모두가 책임감 있게 임해준 덕분에 원활하게 협업할 수 있었습니다.
세미 프로젝트에서는 아직 미숙한 부분이 많아, 기존에 구현되어 있던 기능들을 이해하고 따라가기에 급급했다면, 이번 파이널 프로젝트에서는 새로운 기능을 직접 기획하고 구현하기 위해 많은 구글링을 하며 공부를 병행했습니다. 그 과정에서 자연스럽게 기술적인 지식도 많이 늘었고, 문제 해결 능력도 향상되었다고 느꼈습니다.
특히 처음 접하는 기능이나 기술을 적용해보는 것이 쉽지는 않았지만, 시행착오를 겪으면서 배우는 즐거움이 있었고, 그만큼 프로젝트가 완성되어 갈수록 큰 보람을 느꼈습니다. 이번 파이널 프로젝트는 저에게 있어 단순한 과제 그 이상의 의미였고, 개발자로서 한 걸음 더 성장할 수 있는 소중한 경험이었습니다.
### 김지용
- 이번 프로젝트에서는 요구사항 분석 및 역할 분담 단계에서의 커뮤니케이션, 그리고 프론트엔드와 백엔드 기능 간의 유기적인 연동 작업을 통해 협업의 중요성과 실무적인 개발 프로세스를 몸소 체득할 수 있었습니다. 또한, 구현 과정에서 예외 처리나 사용자 경험(UX)을 고려한 화면 설계 등 그동안 간과했던 세부적인 요소의 중요성을 깨닫고 이를 보완해가며 프로젝트 완성도를 높일 수 있었습니다.
물론 아직도 코드의 구조적인 설계나 작업 일정 관리와 같은 부분에서는 부족함을 느꼈고, 특히 예상치 못한 오류나 병합 이슈에 대응하는 능력은 더 보완해야겠다는 생각이 들었습니다.
또한, 이번 프로젝트를 통해 개발자로서 한 단계 더 성장할 수 있었으며, 유사한 프로젝트를 다시 수행하게 된다면 이번보다 훨씬 더 나은 결과를 낼 수 있다는 자신감도 얻게 되었습니다. 
### 박재준
- 이번 파이널 프로젝트를 하면서 느낀점은 저번 세미 프로젝트를 하며 어려움을 느꼈던 테이블과 VO 구조에 대해 생각을 하며 진행하여 훨씬 효율적으로 프로젝트를 진행했고 이번에 맡게 되었던 리스트 조회, 등록, 수정, 삭제 기능을 구현함으로써 한번 더 기본적인 웹 개발 능력을 다질 수 있었습니다.
또한 이를 바탕으로 더 세밀하게 코드를 작성할 수 있었습니다. 그리고 이번 프로젝트에서 자바스크립트를 많이 활용했는데 훨씬 더 다양한 기능과 세밀한 코드를 작성하며 자바스크립트에 대한 이해도를 높이고 앞으로 더 수준 높은 코드를 자신있게 구현할 수 있을 것 같습니다.  
### 박현서

## 프로젝트 아키텍처
### 사용자 흐름도

### 서버 흐름도




## 프로젝트 산출 문서

- [기획보고서](https://drive.google.com/file/d/16_4R5AM1VDHC9rvQ0wilB0FZz4RwVaSl/view?usp=sharing)
- [요구사항기술서](https://docs.google.com/document/d/1FUEcoi6dF-K0HsaCJfMYB03EmBvbZR0znCKo40GD8V8/edit?usp=sharing)
- [유스케이스](https://drive.google.com/file/d/1FIg9RZA9UyFE6pXlrPjvkD0YGan3fDu1/view?usp=drive_link)
- [플로우차트](https://drive.google.com/file/d/1kIxKAKyRxlNSAdrZALMKvhf1jENDsZaE/view?usp=sharing)
- [와이어프레임](https://www.figma.com/deck/iGB0mgi4iS44uoXOMqQJN6/%EC%9E%90%EC%B7%A8%ED%95%98%EC%9A%B0%EC%8A%A4?node-id=5-125&t=14bQTmMF17yZ8hBT-1)
- [DB설계](https://drive.google.com/file/d/1oTJyCaArGMo1ZILLOEU6UfIagveIRwmE/view?usp=sharing)
- [테이블정의서](https://drive.google.com/file/d/1oTJyCaArGMo1ZILLOEU6UfIagveIRwmE/view?usp=sharing)
- [클래스다이어그램](https://drive.google.com/file/d/1TM9ciPQ9pR1s3qRJn5023LDABb8SMrsW/view?usp=sharing)
- [시퀀스다이어그램](https://drive.google.com/file/d/1G6MZ_YERyN8FTbFmLypHusMGx74oFHLf/view?usp=sharing)
- [최종보고서](https://drive.google.com/file/d/1oOsWMHeT8A_SoYgZ_P-Rc4wgL3Cx02Qp/view?usp=sharing)
- [프로젝트 소스 DB](https://drive.google.com/file/d/1nxIlrn83LEpuOki1A6bZZBAY6IWZKpUR/view?usp=sharing)
- [시연영상](https://drive.google.com/file/d/1PIB3kV6DRV-8nHfGpEjWH0T9sBEq19Jo/view?usp=sharing)
