<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1{
		 margin-top: 20px;
	}
   table {
   margin: 5px auto;
   border: 1px solid rgb(207, 207, 207);
   width: auto;
   border-collapse: collapse;
   margin-top: 20px;
}
.menu {
	text-align: center;
	border-bottom: 0.5px solid rgb(207, 207, 207);
	max-width: 200px;
	margin: 0 auto;
}
.button {
	margin-top: 20px;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body align="center">
	<div class="menu">
	<a href="productList"><h1 align="center">제품관리</h1></a>
	</div>
<!-- 		<a href="register_view"><input type="button" value="추가"></a> -->
	<div class="button">
		<a href="${pageContext.request.contextPath}/product/register_view"><input type="button" value="추가"></a>
	</div>
	
	<table border="1" align="center">
		<tr align="center" height="50px">
			<td width="50" >번호</td>
			<td width="80">카테고리</td>
			<td width="220">제품명</td>
			<td width="90">이미지</td>
			<td width="90">색상</td>
			<td width="90">사이즈</td>
			<td width="80">가격</td>
			<td width="80">세일가격</td>
			<td width="60">수량</td>
			<td width=80>판매여부</td>
<!-- 			<td width="40">삭제</td> -->
		</tr>
		<c:forEach items="${productList}" var="dto">
			<tr>
				<td align="center">${dto.proCode}</td>
				<td align="center">${dto.cateCode}</td>
				<td>
					<a href="product_view?proCode=${dto.proCode}">${dto.proName}</a>
				</td>
				<td align="center"><img src="${dto.proImg}" width="80" height="70""></td>
				<td align="center" style="vertical-align:middle;">${dto.color1}<br>${dto.color2}<br>${dto.color3}</td> <!-- 색상 -->
				<td align="center" style="vertical-align:middle;">${dto.size1}<br>${dto.size2}<br>${dto.size3}</td> <!-- 사이즈 -->
				<td align="center">${dto.proPrice}</td>
				<td align="center">${dto.proSale}</td>
				<td align="center">${dto.proQty}</td>
				<td align="center">${dto.proYN}</td>
			</tr>
		</c:forEach>
	</table>
	
	<div class="div_page">
		<ul  class="pagination">
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button" >
<!-- 					시작페이지 - 1 하면 이전의 10개 페이지 표시 -->
<!-- 				ex>11->10(1~10), 21->20(11~20) -->
					<a href="${pageMaker.startPage - 1}">
						[이전]
					</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}" >
				<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='background-color:white'":""} >
<!-- 					클릭한 현재페이지 번호를 링크로 연결 -->
					<a href="${num}">
						${num}
					</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="paginate_button">
<!-- 					끝페이지 + 1 하면 이후의 10개 페이지 표시 -->
<!-- 				ex>10->11(11~20), 20->21(21~30) -->
					<a href="${pageMaker.endPage + 1}">
						[다음]
					</a>
				</li>
			</c:if>
		</ul>
	</div>
	
	<form method="get" id="actionForm" action="#">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>
	
</body>
</html>
<script>
    //페이징
    var actionForm = $("#actionForm");

	$(".paginate_button a").on("click", function(e){
// 		기본 동작 막음: 페이지 링크를 통해서 이동
		e.preventDefault();
		console.log("click~!!!");
		console.log("@# href ===>"+$(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.attr("action", "productList");
		actionForm.submit();
	});
    </script>