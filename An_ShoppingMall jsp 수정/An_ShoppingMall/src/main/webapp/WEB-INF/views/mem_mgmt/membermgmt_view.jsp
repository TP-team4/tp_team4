<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

aside, footer {
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
	flex-grow: 1;
	padding: auto;
	margin-bottom:150px;
}

#aisdeLeft {
	flex-grow: 0;
	width: 230px;
	padding: auto;
}

#section {
	flex-grow: 1;
}

#aisdeRight {
	flex-grow: 0;
	width: 200px;
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

section {
	margin-top: 40px;
}

#log_ul {
	font-size: small;
}

a:hover {
	color: black;
}

#search {
	border-top: none;
	border-left: none;
	border-right: none;
}
table{
  border-collapse : collapse;
  border-radius : 2px;
  border-style : hidden;
  box-shadow : 0 0 0 1px #ced4da;
  width: 900px;
}

td{
	padding: 10px;
}
.btn{
	background-color: #508FED;
	color: white;
	border: 1px solid #ced4da;
	border-radius: 3px;
	width: 100px;
	height: 30px;
	margin-top: 30px;
	line-height: 10px;
}
.btn:hover{
	background-color: #467DCF;
	color: white;
}
.mgmt{
	width: 900px; 
	margin: 0 auto; 
	color:#508FED; 
	font-size: x-large; 
	margin-bottom: 20px;
}
th, td {
 	border: 1px solid #ced4da; 
	border-collapse: collapse;
}
</style>

</head>

<body>

	<main id="main">
		<div class="container">

			<aside id="aisdeLeft">
				<div id="title">
					<a href="mainPage"> 
					<span style="font-size: x-large; position: absolute; left: 0px; color: black; width: 200px;">Room & Bloom</span>
					</a>
				</div>
				<div class="category" style="position: absolute; top: 70px;">
					<ul style="width: 200px;">
						<li><a href="#">BEST</a></li>
						<li><a href="#">의자</a></li>
						<li><a href="#">침대</a></li>
						<li><a href="#">테이블/식탁/책상</a></li>
						<li><a href="#">소파</a></li>
						<li><a href="#">서랍/수납장</a></li>
						<li><a href="#">거실장/TV장</a></li>
						<li><a href="#">선반</a></li>
						<li><a href="#">진열장/책장</a></li>
						<li><a href="#">행거/옷장</a></li>
						<li><a href="#">화장대</a></li>
					</ul>
				</div>
				<div class="notice" style="position: absolute; top: 400px;">
					<ul>
						<li><a href="noticePage">Notice</a></li>
						<li><a href="QnAPage">QnA</a></li>
						<!-- <li><a href="tp_main_review.html">Review</a></li> -->
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
    membermgmt_view
    조은유    |     23-07-06     |              프론트	화면 배열 , css 적용
    =================================================================
    -->

			<!-- 본문 -->
			<section id="section">
				<article>
					<div id="article">
						<div class="mgmt">
							회원정보관리
						</div>
						<form action=membermgmtModify method="post">
							<table align="center">
								<tr height="30">
									<td><strong>아이디</strong></td>
									<td><input type="text" id="id" name="id" value="${membermgmt_view.id}" readonly></td>
								</tr>
								<tr height="30">
									<td><strong>이름</strong></td>
									<td><input type="text" name="name" value="${membermgmt_view.name}"></td>
								</tr>
								<tr>
									<td><strong>주소</strong></td>
									<td>
										<input type="text" name="pcode" id="zip-code" placeholder="우편번호" value="${membermgmt_view.pcode}" readonly>
				     					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" name="loadaddr" id="address-1" value="${membermgmt_view.loadaddr}" placeholder="도로명주소" style="width: 300px">&nbsp;<small>도로명주소</small><br>
										<input type="text" name="etcaddr" id="address-2" value="${membermgmt_view.etcaddr}" placeholder="상세주소" style="width: 300px">&nbsp;<small>상세수조</small><br>
										<input type="text" name="lotaddr" value="${membermgmt_view.lotaddr}" placeholder="지번주소" style="width: 300px">&nbsp;<small>지번주소</small><br>
										<input type="text" name="extraaddr" value="${membermgmt_view.extraaddr}" placeholder="추가주소" style="width: 300px">&nbsp;<small>추가주소</small><br>
									</td>
								</tr>
								<tr height="30">
									<td><strong>전화번호</strong></td>
									<td>
									<input type="text" name="hp" oninput="hypenTel(this)" placeholder="전화번호 입력" maxlength="13" value="${membermgmt_view.hp}"/>
									</td>
								</tr>
								<tr height="30">
									<td><strong>이메일</strong></td>
									<td><input type="text" name="email" value="${membermgmt_view.email}"></td>
								</tr>
							</table>
							
							<div style="text-align: center; margin: 0 auto;">
									<input type="submit" value="회원정보수정" class="btn" style="width: 130px;"> 
									<input type="reset" value="초기화" class="btn">
									<button type="button" onclick="goBack();" class="btn">취소</button>
									<a href="membermgmtDelete?id=${membermgmt_view.id}">
									<input type="button" value="회원삭제" class="btn">
							</div>
						</form>

					</div>
				</article>
			</section>


			<!-- 우측 사이드바 -->
			<aside id="aisdeRight">
				<div class="rightbar">
					<div class="cart"
						style="position: absolute; top: 80px; right: 0px;">
						<ul>
							<li><a href="#" style="color: black; width: 200px;">Cart - 0</a></li>
						</ul>
					</div>
					<div class="login"
						style="position: absolute; top: 160px; right: 0px;">
						<ul id="log_ul" style="width: 200px;">
<!-- 						관리자 로그인 한 상태 -->
							<li>${admindto.id}님</li>
							<li><a href="logout">Log out</a></li>
							<li><a href="http://localhost:8181/An_ShoppingMall/product/productList">상품관리</a></li>
							<li><a href="http://localhost:8181/An_ShoppingMall/order/orderListPaging">주문관리</a></li>
							<li><a href="http://localhost:8181/An_ShoppingMall/mem_mgmt/memberList">회원관리</a></li>
						</ul>
					</div>
					<!-- 검색기능 -->
					<div class="search"
						style="position: absolute; top: 600px; right: 10px;">
						<form method="post" action="#">
							<fieldset>
								<input type="text" id="search" style="width: 120px;"> 
								<a href="#"> 
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                          		<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                      			</svg>
								</a>
							</fieldset>
						</form>
					</div>
			</aside>
		</div>
	</main>
	<footer id="footer" style="font-family: notosans; text-align: left;">
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
</body>
</html>
<script type="text/javascript">

	//뒤로가기
	function goBack() {
	    window.history.back();
	}

	//다음 우편검색 서비스
	 function execDaumPostcode() {
        new daum.Postcode( {
          oncomplete: function( data ) {
            document.getElementById( 'zip-code' ).value = data.zonecode;
            document.getElementById( 'address-1' ).value = data.address;
          }
        } ).open();
      }
	
	//전화번호 자동 하이픈
	  const hypenTel = (target) => {
		  target.value = target.value
		    .replace(/[^0-9]/g, '')
		    .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
		 }

</script>

