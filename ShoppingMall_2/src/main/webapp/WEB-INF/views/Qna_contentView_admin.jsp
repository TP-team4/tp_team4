<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	text-align: left;
}
table {
	margin-left:auto; margin-right:auto;
}
.list {
	float: left; width: 100px; border: 1px solid #ccc; font-size: small; width: 80px; height: 30px; border-radius: 5px;
	margin-left: 10px; margin-bottom: 15px;
}
.delete{
	width: 100px; border: 1px solid #ccc; font-size: small; width: 80px; height: 30px; border-radius: 5px;
}
.edit {
	float: right; width: 100px; color: white; background-color: black; 
	border: none; font-size: small; width: 80px; height: 30px; border-radius: 5px;
	margin-right: 10px;
}
.list:hover {
	background: white; 
}
.delete:hover {
	background: white; 
}
.edit:hover {
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
              <a href="adminMain2"> <span
                  style="font-size: x-large; position: absolute; left: 0px; color: black; width: 200px;">Room
                  & Bloom</span>
              </a>
            </div>
            <div class="category" style="position: absolute; top: 70px;">
              <ul style="width: 200px;">
                <li><a href="notice/list_admin">공지사항</a></li>
                <li><a href="mem_mgmt/memberList">회원 관리</a></li>
                <li><a href="product/productList">상품 관리</a></li>
                <li><a href="order/orderListPaging">주문 현황</a></li>
              </ul>
            </div>
            <div class="notice" style="position: absolute; top: 400px;">
              <ul>
                <li><a href="noticePage">Notice</a></li>
                <li><a href="Qna_list_admin">QnA</a></li>
                <li><a href="rev_list_admin">Review</a></li>
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
    구나현	Qna자세히보기, 
    		관리자가 단 댓글만 볼 수있게 함
    =================================================================
    -->
			<!-- 본문 -->
			<section id="section" style="width: 600px;">
				<article style="margin-left: 40px">
					<div id="article" style="height: auto;">

<!-- 						@@@@본문 구나현 -->
						<div>Qna</div>
						<br>
						<table>
							<tr>
								<td colspan="2">
									<div style="margin: 35px;">
										<div style="margin-bottom: 15px;">${PQnaContentView.qnatitle}</div>
										<div>
											<span>Writer</span>&nbsp;&nbsp;<span style="color: black;">${PQnaContentView.id}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<span>Date</span>&nbsp;&nbsp;<span style="color: black;">${PQnaContentView.qnadate}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div style="margin-left: 35px; margin-right: 35px; margin-top: 40px; margin-bottom: 40px;">
										<div style="color: black;">
											<pre>${PQnaContentView.qnacont}</pre>
<%-- 											<pre><c:out value="${PQnaContentView.qnacont}" /></pre> --%>
<%-- 											${PQnaContentView.qnacont} --%>
										</div>
									</div>	
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div style="margin-top: 15px;">
										<input type="button" value="List" class="list" onclick="location.href='Qna_list'">
									</div>
									<div style="float: right;">
										<input type="button" value="Delete" class="delete" id="deleteBtn">&nbsp;&nbsp;
<!-- 										<input type="button" value="Edit" class="edit" id="editBtn"> -->
									</div>
								</td>
							</tr>
						</table>
						<form method="post" action="PQnaDelete" id="contentDeleteForm">
<%-- 							<input type="hidden" name="pageNum" value="${pageMaker.pageNum}">			 --%>
<%-- 							<input type="hidden" name="amount" value="${pageMaker.amount}">			 --%>
<%-- 							<input type="hidden" name="qnacode" value="${pageMaker.qnacode}"> --%>
							<input type="hidden" name="qnacode" value="${PQnaContentView.qnacode}">
							<input type="hidden" name="id" id="qnaid" value="${PQnaContentView.id}"> 
						</form>
<!-- 						@@@@본문 구나현 -->
<!-- 					댓글목록 구나현 -->
						<table style="margin-top: 20px; width: 550px;">
							<c:forEach varStatus="status" items="${PQnaCmtList}" var="cmt">
								<tr>
									<td colspan="2" style="width: 600px">
										<form action="PQnaCmtDelete" method="post" class="cmtDelete">
											<input type="hidden" name="recode" value="${cmt.recode}">
											<input type="hidden" name="qnacode" value="${PQnaContentView.qnacode}">
										</form>
										<div style="margin: 13px;">
											<span><b>Room and Bloom</b></span>&nbsp;&nbsp;
											<span>${cmt.redate}</span>
											<span style="float: right;">
												<input type="button" class="eBtn" value="수정">&nbsp;
													<input type="button" class="dBtn" value="삭제">
											</span>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div style="margin: 20px; color: black;">${cmt.recont}</div>
									</td>
								</tr>
<!-- 								댓글수정 버튼누르면 나옴 -->
								<tr >
									<form method="post" action="PQnaCmtModify" class="revCmtEdit">
										<td colspan="2" class="editShow" style="display: none;">
											<div style="margin-top: 15px; margin-left: 20px; margin-bottom: 10px;">
												&nbsp;댓글 수정
												<span style="float: right; margin-right: 20px;">
													<input type="button" value="x" class="xxx">&nbsp;
												</span>
											</div>
											<div style="color: black; margin-left: 20px;">
												<textarea rows="3" cols="80" name="cmtcont" size="300">${cmt.recont}</textarea>
												<input type="hidden" name="recont" value="${cmt.recont}">
												<input type="hidden" name="qnacode" value="${rev_contentView.qnacode}">
											</div>
											<div style="margin-left: 20px; margin-bottom: 15px; margin-top: 10px;">
												<input type="button" class="cmtEditBtn" value="수정등록">
											</div>
										</td>
									</form>
								</tr>
							</c:forEach>
						</table>
<!-- 					댓글목록 구나현 -->
<!-- 					댓글 작성(관리자만) -->
						<table style="margin-top: 20px; width: 550px;">
							<form method="post" action="PQnaCmtWrite">
								<input type="hidden" name="qnacode" value="${PQnaContentView.qnacode}">
								<tr>
									<td colspan="2">
										<div style="margin: 15px;">
											<div style="font-size: medium;"><b>Comment</b></div>
											<div><b>Room and Bloom</b></div>
										</div>
									</td>				
								</tr>
								<tr>
									<td colspan="2">
										<div style="margin-left: 15px; margin-right: 15px; margin-top: 15px;">
											<textarea rows="3" cols="80" name="recont" size="300"></textarea>		
										</div>
										<div>
											<input type="submit" class="Cmtsubmit" value="댓글등록" style="font-size: small;">
										</div>
									</td>
								</tr>
							</form>
						</table>
<!-- 						댓글 작성(관리자만) 구나현 -->
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
                <!-- 						<ul> -->
                <!-- 							<li><a href="#" style="width: 200px;">Cart - 0</a></li> -->
                <!-- 						</ul> -->
              </div>
	<!-- 
    =================================================================
    로그인시 회원 이름 보이게 수정
      조은유    |   23-06-29       |                          
    =================================================================
    -->
              <div class="login" style="position: absolute; top: 160px; right: 0px;">
                <ul id="log_ul" style="width: 200px;">
                  	<!--                      로그인한 상태 -->
                     <c:if test="${ admindto != null }">
                        <li>${admindto.id} 님</li>
                        <li><a href="logout">Log out</a></li>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		
	$(".eBtn").on("click", function() {
//			누른곳의 tr값 다음 다음 tr 값
		var editRow = $(this).closest("tr").next("tr").next("tr").find(".editShow");
		editRow.show();
	});
	
	$(".xxx").on("click", function() {
		var editRow = $(this).closest("tr").find(".editShow");
		editRow.hide();
	});
	
	var revCmtEdit = $(".revCmtEdit");
	$(".cmtEditBtn").on("click", function() {
		var revCmtEdit = $(this).closest("tr").find(".revCmtEdit");
		revCmtEdit.attr("action", "PQnaCmtModify").submit();
		alert("댓글이 수정 되었습니다.");
	});
	var cmtDelete = $(".cmtDelete");
	$(".dBtn").on("click", function() {
		var cmtDelete = $(this).closest("tr").find(".cmtDelete");
		cmtDelete.attr("action", "PQnaCmtDelete").submit();
		alert("댓글이 삭제 되었습니다.");
	});
	</script>
</body>
</html>