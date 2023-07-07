<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<table width="500" border="1" align="center">
		<c:forEach items="${userOrder_view}" var="userOrder">
			<form method="post" action="userOrderView">
				<tr>
					<td colspan="5">
						<strong>주문번호</strong>${userOrder.ordercode}<br>
						<strong>출고날짜</strong>${userOrder.orderdate}
					</td>
				</tr>
				<tr>
					<td>
						<img src="${userOrder.proThumb}" alt="상품 이미지" width="100" height="100" />
					</td>
					<td>${userOrder.proName}</td>
					<td><fmt:formatNumber value="${userOrder.proPrice}" pattern="##,###,###" />원</td>
					<td>${userOrder.amount} 개</td>
					<td><fmt:formatNumber value="${userOrder.totalprice}" pattern="##,###,###" />원</td>
				</tr>
			</form>
		</c:forEach>
	</table>
	
	<c:set var="prevPocode" value="" />
	<table width="500" border="1" align="center">
<!-- 	pocode가 같을때 주소 이중으로 안나오게 처리 -->
		<c:forEach items="${userOrder_view}" var="userOrder"> 
			<c:if test="${userOrder.pocode != prevPocode}">
				<c:set var="prevPocode" value="${userOrder.pocode}" />
				<th>배송지정보</th>
				<tr>
					<td><strong>수령인</strong>&nbsp;&nbsp;&nbsp;${userOrder.name}</td>
				</tr>
				<tr>
					<td><strong>연락처</strong>&nbsp;&nbsp;&nbsp;${userOrder.hp}</td>
				</tr>
				<tr>
					<td><strong>배송지</strong>&nbsp;&nbsp;&nbsp;${userOrder.postcode}<br>
						${userOrder.addr}<br>
						${userOrder.etcaddr}
					</td>
				</tr>
				<tr>
					<td><strong>배송메모</strong>&nbsp;&nbsp;&nbsp;${userOrder.memo}</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	
	<c:set var="totalPrice" value="0" />
	<c:forEach items="${userOrder_view}" var="userOrder">
		<c:set var="totalPrice" value="${totalPrice + userOrder.totalprice}" />
	</c:forEach>
	<p align="center"><strong>총 주문금액:</strong> <fmt:formatNumber value="${totalPrice}" pattern="##,###,###" />원</p>
</body>
</html>