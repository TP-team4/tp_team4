<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Room and Bloom</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<style>
aside, section, footer {
	margin: 3px;
	text-align: center;
}

footer {
	position: absolute;
	left: 260px;
	font-size: small;
}

.container {
	display: flex;
	margin: 0 auto;
	margin-top: 80px;
	max-width: 100%;
	font-family: notosans;
}

#aisdeLeft {
	position: sticky;
	top: 0px;
	height: 500px;
}

#aisdeRight {
	position: sticky;
	top: 0px;
	height: 500px;
}

#article {
	height: 800px;
	flex-grow: 1;
	padding: auto;
}

#aisdeLeft {
	flex-grow: 0;
	width: 200px;
	padding: auto;
}

#section {
	flex-grow: 1;
}

#aisdeRight {
	flex-grow: 0;
	width: 250px;
	padding: auto;
}

#aisdeLeft ul li {
	list-style: none;
	text-align: left;
	font-size: small;
	line-height: 2em;
}

#aisdeRight ul li {
	list-style: none;
	text-align: right;
	margin-right: 30px;
	line-height: 2em;
}

a {
	text-decoration: none;
	color: gray;
}

.thumbnail {
	padding: 10px;
	width: 30%;
	display: inline-block;
}

section {
	margin-top: 40px;
}

#log_ul {
	font-size: small;
}

a:hover {
	color: black;
}

.thumbnail {
	float: left;
}
#search{
  border-top: none;
  border-left: none;
  border-right: none;
}
td{
	border: 1px solid gray;
	color: gray;
	font-family: notosans;
	font-size: small;
}
table {
	margin-left:auto;
	margin-right:auto;
}
</style>
</head>

<body>

	<!-- 
    =================================================================
    메인 화면
    박정훈    |   23-06-17      |        전체 레이아웃 위치 세팅 및 스타일 적용 
    ================================================================= 
    -->

	<main id="main">
		<div class="container">
			<!-- 
    =================================================================
    좌측 사이드바 레이아웃 세팅
    작성자   |   수정자   |    작성 or 수정일    |     작업 내용
    조은유   |   박동명   |     23-06-16      |    사이드바 레이아웃 조정
    										 	카테고리 페이지 연결 
    ================================================================= 
    -->
			<!-- 좌측 사이드바 -->

			<aside id="aisdeLeft">
				<div id="title">
					<a href="mainPage"> <span
						style="font-size: x-large; position: absolute; left: 0px; color: black; width: 200px;">Room
							& Bloom</span>
					</a>
				</div>
				<div class="category" style="position: absolute; top: 70px;">
					<ul style="width: 200px;">
<!-- 						<li><a href="#">BEST</a></li> -->
						<li><a href="ProductList?catecode=1">의자</a></li>
						<li><a href="ProductList?catecode=2">침대</a></li>
						<li><a href="ProductList?catecode=3">테이블/식탁/책상</a></li>
						<li><a href="ProductList?catecode=4">소파</a></li>
						<li><a href="ProductList?catecode=5">서랍/수납장</a></li>
						<li><a href="ProductList?catecode=6">거실장/TV장</a></li>
						<li><a href="ProductList?catecode=7">선반</a></li>
						<li><a href="ProductList?catecode=8">진열장/책장</a></li>
						<li><a href="ProductList?catecode=9">행거/옷장</a></li>
						<li><a href="ProductList?catecode=0">화장대</a></li>
					</ul>
				</div>
				<div class="notice" style="position: absolute; top: 400px;">
					<ul>
<!-- 			<!--               <li><a href="noticePage">Notice</a></li> -->
              			<li><a href="notice/list">Notice</a></li>
              			<li><a href="Qna_list">QnA</a></li>
						<li><a href="rev_list">Review</a></li>
					</ul>
				</div>
				<div class="info" style="position: absolute; top: 550px;">
					<ul>
						<li>02-336-4363</li>
						<li>Mon-Fri 10:00-19:00 <br> Weekend,Holiday off
						</li>
					</ul>
				</div>

			</aside>

			<!-- 
    =================================================================
    본문   / 상품 화면 출력부 / 상품 가격및 이미지 출력 부분
    박정훈    |   23-06-16       |       a태그를 사용하여 클릭시 상세페이지 이동 
    구나현	상품 구매 후 리뷰작성 할 수 있는 목록 보여주는 페이지 구현
    		로그인한 고객이 상품 구매하고 상품상태가 출고중이거나 배송완료인데 리뷰작성 이력이 없어야 뜸
    		있으면 안뜸
    =================================================================
    -->
			<!-- 본문 -->
			<section id="section" style="width: 600px;">
				<article style="margin-left: 40px">
					<div id="article" style="height: auto;">
<!-- 				@@@여기서부터 -->
					
					<div>
					 	<p>후기작성</p>
					</div>
					<table>
						<tr>
					    	<th scope="col" style="padding-bottom: 10px;">Item</th>
					    	<th scope="col" style="padding-bottom: 10px;">상품이름, 옵션</th>
					    	<th scope="col" style="padding-bottom: 10px;">주문상태</th>
					    	<th scope="col" style="padding-bottom: 10px;">Review</th><!-- 작성날짜 -->
						</tr>
					  	<c:forEach items="${userRevWriteList}" var="dto" varStatus="status">
<!-- 							출고중이거나 배송완료이여야 되고 리뷰코드가 없어야 됨 -->
							<c:if test="${dto.status == 3 || dto.status == 5 && dto.revcode == 0}">
<%-- 					      	<c:if test="${dto.status == 3}"> --%>
						    	<tr class="revRow">
						      		<td>
							        	<a href="#">
							          	<img src="${dto.proimg}" alt="오류" style="width: 100px; margin: 10px;">
							        	</a>
						      		</td>
							        <td style="padding: 10px;">
						        		<div style="margin-left: 10px;">
	<!-- 					                <form action="revWrite" method="post" class="review-form"> -->
	<!-- 					          			<form method="post" class="review-form"> -->
						          				<div id="proname${status.index + 1}"><b>${dto.proname}</b></div>
						          				<div style="padding-top: 10px;">
						          					[옵션 : <span id="op1_${status.index + 1}"></span> 
						          					/ <span id="op2_${status.index + 1}"></span>]
						          				</div>
						        		</div>
						      		</td>
<!-- 									배송완료 추가 -->
							        	<c:choose>
			                            	<c:when test="${dto.status == 3}">
			                                	<td>출고중</td>
			                                </c:when>
			                                <c:when test="${dto.status == 5}">
			                                	<td>배송완료</td>
			                                </c:when>
			                            </c:choose>
							        	<td>
							        		<form method="post" class="reviewForm">
								        		<input type="hidden" name="procode" id="procode" value="${dto.procode}">
								        		<input type="hidden" name="proname" id="proname" value="${dto.proname}">
							          			<input type="hidden" name="cartcode" id="cartcode" value="${dto.cartcode}">
							          			<input type="hidden" name="id" id="id" value="${dto.id}">
											</form>
<%-- 							          		<c:if test="${dto.revcode == 0}"> --%>
								            <input type="button" class="reviewBtn" value="Write review"
								            	style="margin: 10px; border: none; background-color: black; color: white;">
<%-- 			 				            	</c:if> --%>
							        	</td>
<%-- 							      	</c:if> --%>
						    	</tr>
				      		</c:if>
						</c:forEach>
					</table>
<!-- 				@@@여기까지 작성 -->
					</div>
				</article>
			</section>

			<!-- 
    =================================================================
    우측 사이드바 레이아웃 세팅
    조은유   |   23-06-16      |                      사이드바 레이아웃 조정 
    ================================================================= 
    -->
			<!-- 우측사이드바 -->
			<aside id="aisdeRight">
               <div class="rightbar">
                   <div class="cart" style="position: absolute; top: 80px; right: 0px;">
                       <ul>
                           <c:if test="${ dto == null }">
            		 			<li><a href="login" style="color: black;">Cart</a></li>
              				</c:if>
              				<c:if test="${ dto != null }">
              					<li><a href="Gu_cart" style="width: 200px; color: black;">Cart</a></li>
              				</c:if>
                       </ul>
                   </div>
	<!-- 
    =================================================================
    로그인시 회원 이름 보이게 수정
      조은유    |   23-06-29       |                          
    =================================================================
    -->
					<div class="login"
						style="position: absolute; top: 160px; right: 0px;">
						<ul id="log_ul" style="width: 200px;">
							<!-- 로그인 하지 않은 상태 -->
							<c:if test="${ dto == null }">
								<li><a href="login">Log in</a></li>
								<li><a href="register">Register</a></li>
							</c:if>
							<!-- 로그인한 상태 -->
							<c:if test="${ dto != null }">
								<li>${dto.name} 님</li>
								
								<li><a href="logout">Log out</a></li>
							</c:if>

							<!-- 로그인 하지 않은 상태 -->
							<c:if test="${ dto == null }">
								<li><a href="login">Order</a></li>
							</c:if>
							<!-- 로그인한 상태 -->
							<c:if test="${ dto != null }">
								
								<li><a href="userOrder/userOrderList">Order</a></li>
							</c:if> 
							
							<!-- 로그인 하지 않은 상태 -->
							<c:if test="${ dto == null }">
								<li><a href="login">My Page</a></li>
							</c:if>
							<!-- 로그인한 상태 -->
							<c:if test="${ dto != null }">
								
								<li><a href="myPage">My Page</a></li>
							</c:if> 
						</ul>
					</div>
					 <!-- 검색기능 -->
<!-- 			        <div class="search" style="position: absolute; top: 600px; right: 10px;"> -->
<!-- 			          <form method="post" action="#"> -->
<!-- 			              <fieldset> -->
<!-- 			                  <input type="text" id="search"> -->
<!-- 	                  <a href="#"> -->
<!--                       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16"> -->
<!--                           <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/> -->
<!--                       </svg> -->
<!--                   </a> -->
<!--               </fieldset>     -->
<!--             </form> -->
          </div>
			</aside>

		</div>
	</main>
	<footer id="footer" style="font-family: notosans; text-align: left; margin-top: 30px">
		<a href="mainPage" style="color: black;">Room & Bloom</a> <br>
		<p style="line-height: 2em;">
			<a href="#">About us</a>
		</p>
	</footer>
	<div style="position: fixed; bottom: 5px; left: 50%; right: 50%;">
		<a href="#" style="font-size: xx-large;">^</a>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
<!-- 	본문 -->
	<!-- 
    =================================================================
      구나현    |   구매한 상품 옵션 화면에 보이기 위해서 cartcode 쪼개서 보여줌
      				버튼 누른 행에 대해서 리뷰작성jsp로 값 넘겨주는 기능 구현                         
    =================================================================
    -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		var cartcodeElements = document.querySelectorAll('[id^="cartcode"]');
		var op1Elements = document.querySelectorAll('[id^="op1_"]');
		var op2Elements = document.querySelectorAll('[id^="op2_"]');
		
		for (var i = 0; i < cartcodeElements.length; i++) {
			var cartcode = cartcodeElements[i].value;
			var regex = /\/([^/]+)\/([^/]+)$/;
			var matches = cartcode.match(regex);

			if (matches && matches.length === 3) {
				var color = matches[1];
				var size = matches[2];
// 				console.log("Color: " + color);
// 				console.log("Size: " + size);
// 				옵션1,2 나눠진값 화면에 보임
				op1Elements[i].textContent = color;
				op2Elements[i].textContent = size;
			} else {
    			console.log("오류");
    		}
  		}
		
		var reviewForm = $(".reviewForm");
		$(".reviewBtn").click(function() {
			var reviewForm = $(this).closest(".revRow").find(".reviewForm");
			reviewForm.attr("action", "rev_writeView").submit();
		});	
	</script>
</body>
</html>