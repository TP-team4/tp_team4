<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   table {
	   margin: 5px auto;
	   border: 1px solid rgb(207, 207, 207);
	   width: auto;
	   border-collapse: collapse;
	   margin-top: 30px;
}

	.div_page ul{
		display: flex;
		justify-content: center;
		list-style: none;
		}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body align="center">
	<h1 align="center">NOTICE 관리</h1>
		<a href="write_view"><input type="button" value="공지사항 작성"></a>
		
	<table width="500" border="1" align="center">
		<tr>
			<td width="50" align="center">No</td>
			<td width="530" align="center">Subject</td>
			<td width="70" align="center">Writer</td>
			<td width="110" align="center">Date</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td align="center">${dto.noticode}</td>
				<td>
<!-- 				content_view : 컨트롤러단 호출 -->
					<a href="content_view?noticode=${dto.noticode}">${dto.notititle}</a>
				</td>
<%-- 				<td>${dto.notiauth}</td> --%>
				<td align="center">admin</td>
				<td align="center">${dto.notidate}</td>
			</tr>
		</c:forEach>
<!-- 		<tr> -->
<!-- 			<td colspan="5"> -->
<!-- 				<a href="write_view">글작성</a> -->
<!-- 			</td> -->
<!-- 		</tr> -->
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
		actionForm.attr("action", "list");
		actionForm.submit();
	});
    </script>
	
</body>
</html>