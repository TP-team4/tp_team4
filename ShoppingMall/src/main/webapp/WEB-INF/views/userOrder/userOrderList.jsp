<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<div class="container" align="center">
    <section id="content">
        <table class="orderList" >
<%--         <input type="hidden" name=userid value="${dto.userid}"> --%>
            <thead>
                <tr>
                    <th>주문 날짜</th>
                    <th>주문 상태</th>
                    <th>상품 이미지</th>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>주문상세</th>
                    <th>수량</th>
<!--                     <th>배송조회</th> -->
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${userOrderList}" var="dto">
                    <tr>
                	<td>${dto.orderdate}</td>
                        <td>
                            <c:choose>
                                <c:when test="${dto.status == 1}">
                                    결제대기
                                </c:when>
                                <c:when test="${dto.status == 2}">
                                    출고대기
                                </c:when>
                                <c:when test="${dto.status == 3}">
                                    출고
                                </c:when>
                                <c:when test="${dto.status == 4}">
                                    취소
                                </c:when>
                            </c:choose>
                        </td>
                        <td>
                            <img src="${dto.proimg}" alt="상품 이미지" width="100" height="100" />
                        </td>
                        <td>${dto.proName}</td>
                        <td><fmt:formatNumber value="${dto.proPrice}" pattern="##,###,###" />원</td>
                        <td>
                            <a href="userOrder_view?pocode=${dto.pocode}">주문상세</a>
                        </td>
                        <td>${dto.amount}개</td>
<!--                         <td> -->
<!--                             <input type="button" value="배송조회"> -->
<!--                         </td> -->
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>
</div>
<body>


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
					<a href="${num}">&nbsp;
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

// 페이징
    var actionForm = $("#actionForm");

	$(".paginate_button a").on("click", function(e){
// 		기본 동작 막음: 페이지 링크를 통해서 이동
		e.preventDefault();
		console.log("click~!!!");
		console.log("@# href ===>"+$(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.attr("action", "userOrderList");
		actionForm.submit();
	});
    </script>