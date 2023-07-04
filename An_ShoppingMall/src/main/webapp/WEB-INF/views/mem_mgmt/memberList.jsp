<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		.div_page ul{
			display: flex;
			justify-content: center;
			list-style: none;
		}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <a href="memberList"><h2>회원관리</h2></a>
        <form method="post" class="form-inline" action="searchList">
            <div class="form-group">
                <button type="button" class="btn btn-default">
                    Count <span class="badge">${memberList[0].count}</span>
                </button>
            </div>

            <div class="form-group">
                <select class="form-control" name="key" id="skey">
                    <option value="all">전체</option>
                    <option value="id">아이디</option>
                    <option value="name">이름</option>
                    <option value="hp">전화번호</option>
                    <option value="email">이메일</option>
                </select>
            </div>

            <div class="form-group">
                <input type="text" class="form-control" id="value" name="value">
            </div>

            <button type="submit" class="btn btn-default">Search</button>
        </form>
        
		<div class="panel panel-default" style="margin-top: 7px">
			<div class="panel-heading">회원 명단 출력</div>
			<div class="panel-body">
				<!-- <%--테이블 태그 --%> -->
				<table class="table table-striped">
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>이메일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${memberList}">
						<tr>
							<td><a href="membermgmt_view?id=${dto.id}">${dto.id}</a></td>
							<td>${dto.name}</td>
							<td>${dto.hp}</td>
							<td>${dto.email}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	
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

	$(document).ready(function() {
	    $("#skey").find("option[value='${skey}']").attr("selected", "selected");
	    
	    $("#svalue").val("${svalue}");
	    
	    $("#skey").on("change",function(){
	        $("#svalue").val("");		
	    });
	    
	});

    //페이징
    var actionForm = $("#actionForm");

	$(".paginate_button a").on("click", function(e){
// 		기본 동작 막음: 페이지 링크를 통해서 이동
		e.preventDefault();
		console.log("click~!!!");
		console.log("@# href ===>"+$(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.attr("action", "memberList");
		actionForm.submit();
	});
    </script>
	
</body>
</html>