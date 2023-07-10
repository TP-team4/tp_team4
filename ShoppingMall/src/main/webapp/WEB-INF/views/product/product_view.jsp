<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 	.box{ */
/*             border: hidden; */
/*             border-collapse: collapse; */
/*         } */
</style>
</head>
<body>
	<h2 align="center">제품등록</h2>
	<table class="box" width="500" border="1" align="center">
		<form method="post" action="productModify">
			<input type="hidden" name=proCode value="${product_view.proCode}">
			<tr> 
				<td>제품명</td>
			</tr>
			<tr>
				<td>
					<input type="text" name=proName value="${product_view.proName}" size="90">
				</td>
			</tr>
			<tr> 
				<td>색상</td>
			</tr>
			<tr>
				<td>
					<input type="text" name=color1 value="${product_view.color1}">
					<input type="text" name=color2 value="${product_view.color2}">
					<input type="text" name=color3 value="${product_view.color3}">
				</td>
			</tr>
			<tr> 
				<td>사이즈</td>
			</tr>
			<tr>
				<td>
					<input type="text" name=size1 value="${product_view.size1}">
					<input type="text" name=size2 value="${product_view.size2}">
					<input type="text" name=size3 value="${product_view.size3}">
				</td>
			</tr>
			<tr> 
				<td>가격</td>
			</tr>
			<tr>
				<td>
					<input type="text" name=proPrice value="${product_view.proPrice}">\
				</td>
			</tr>
			<tr> 
				<td>세일가</td>
			</tr>
			<tr>
				<td>
					<input type="text" name=proSale value="${product_view.proSale}">\
				</td>
			</tr>
			<tr> 
				<td>수량</td>
			</tr>
			<tr>
				<td>
					<input type="text" name=proQty value="${product_view.proQty}">
				</td>
			</tr>
			<tr> 
				<td>썸네일</td>
			</tr>
			<tr>
				<td>
					<input type="text" name=proThumb value="${product_view.proThumb}" size="90">
				</td>
			</tr>
			<tr> 
				<td>카테고리</td>
			</tr>
			<tr>
				<td>
					<input type="text" name=cateCode value="${product_view.cateCode}">
				</td>
			</tr>
			<tr> 
				<td>상세이미지</td>
			</tr>
			<tr>
				<td>
					<input type="text" name=proImg value="${product_view.proImg}" size="90">
				</td>
			</tr>
			<tr>
				<td>
					<textarea  cols="100" rows="20" name="proInfo">${product_view.proInfo}</textarea>
				</td>
			</tr>
			<tr> 
				<td colspan="2" align="center"> 
					<input type="submit" value="수정">
					<a href=productList><input type="button" value="목록보기"></a>
					<a href="productDelete?proCode=${product_view.proCode}"><input type="button" value="삭제"></a>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>