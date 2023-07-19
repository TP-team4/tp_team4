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
	border: 1px solid gray;	color: gray;
	font-family: notosans; font-size: small;
}
table {
	margin-left:auto; margin-right:auto;
}
.list {
	float: left; width: 100px; border: 1px solid #ccc; font-size: small; width: 80px; height: 30px; border-radius: 5px;
	margin-left: 10px; margin-bottom: 15px;
}
.submit {
	float: right; width: 100px; color: white; background-color: black; 
	border: none; font-size: small; width: 80px; height: 30px; border-radius: 5px;
	margin-right: 10px;
}
.list:hover {
	background: white; 
}
.submit:hover {
	background: white; color: black; border: 1px solid #ccc;
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
    구나현      							문의 작성 페이지
    =================================================================
    -->
			<!-- 본문 -->
			<section id="section" style="width: 600px;">
				<article style="margin-left: 40px">
					<div id="article" style="height: auto;">

<!-- 				@@@여기서부터 -->
						<table width="500" border="1">
					<!-- 			추가 -->
							<form method="post" action="PQnaWrite" id="writeForm">
								<tr style="height: 50px;">
									<td style="width: 100px;">Subject</td>
									<td>
<!-- 									<input type="text" name="qnatitle" size="50" id="revtitle"> -->
										<select name="qnatitle" style="float: left; margin-left: 10px">
											<option value="상품문의">상품문의</option>
											<option value="교환 및 반품문의">교환 및 반품문의</option>
											<option value="배송문의">배송문의</option>
											<option value="취소문의">취소문의</option>
											<option value="기타문의">기타문의</option>
										</select>
									</td>
								</tr>
								<tr style="height: 50px;">
									<td style="width: 100px;">Write</td>
									<td><input type="text" name="id" size="50" id="id" value="${param.id}" style="float: left; margin-left: 10px;" readonly></td>
								</tr>
								<tr>
									<td colspan="2" style="padding: 20px;">
										<textarea rows="10" cols="100" name="qnacont" size="500" id="qnacont">
■ 교환 및 반품문의, 취소문의는 주문번호를 꼭 기입해주셔야 빠른 처리가 가능합니다.
&#10;주문번호 : &#10;상품이름 : &#10;고객명 / 연락처 : &#10;문의 내용 : 
										</textarea>
									</td>
								</tr>
							</form>
								<tr style="height: 250px;">
									<td style="margin: 10px; text-align: center;">
										개인정보<br>
                            			수집 및<br>
                            			이용 동의
									</td>
									<td>
										<div style="border: 1px solid #ccc; padding: 20px; margin: 20px; text-align: left;">
	                                        <b>■ 개인정보의 수집·이용 목적</b><br>
    	                                    서비스 제공 및 계약의 이행, 구매 및 대금결제, 물품배송 또는 청구지 발송, <br>
    	                                    회원관리 등을 위한 목적
        	                                <br><br>
            	                            <b>■ 수집하려는 개인정보의 항목</b><br>
                	                        이름, 주소, 연락처, 이메일 등
                    	                    <br><br>                                        
                        	                <b>■ 개인정보의 보유 및 이용 기간</b><br>
                            	            회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외없이<br>해당정보를 파기합니다.
										</div>
										<div style="margin: 20px; text-align: left;">
											개인정보 수집 및 이용에 동의하십니까?&nbsp;&nbsp;
											<label>
	                                            <input type="radio" name="okok" checked="checked" id="ok">동의함&nbsp;
	                                            <input type="radio" name="okok" id="no">동의안함
                                        	</label>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div style="margin-top: 15px;">
											<input type="button" value="Write List" class="list" onclick="location.href='Qna_list'">
										</div>
										<div>
											<input type="button" value="Submit" class="submit" id="submitBtn">
										</div>
									</td>								
								</tr>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	
		$("#submitBtn").on("click", function() {
			if ($("#qnacont").val().length == 60) {
		  	    alert("내용을 입력해주세요");
		  	    $("#qnacont").focus();
		  	    return;
	  	    }
			if ($("#qnacont").val().length > 300) {
	      	    alert("내용은 300자 미만으로 입력하셔야 됩니다.");
	      	    $("#qnacont").focus();
	      	    return;
      	    }
			if ($("#no").is(":checked")) {
	      	    alert("개인정보 동의를 하셔야 작성이 가능합니다.");
	      	    return;
      	    }
			if ($("#ok").is(":checked")) {
	      	    alert("정상적으로 문의가 등록되었습니다.");
				document.getElementById("writeForm").submit();
      	    }
		});
	</script>
</body>
</html>