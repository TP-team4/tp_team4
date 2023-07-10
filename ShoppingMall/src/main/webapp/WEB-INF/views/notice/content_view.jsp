<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.box{
            border: hidden;
            border-collapse: collapse;
        }
</style>
</head>
<body>
	<table class="box" width="500" border="1" align="center">
		<form method="post" action="noticeModify">
			<input type="hidden" name=noticode value="${content_view.noticode}">
			<tr> 
				<td>번호</td>
			</tr>
			<tr>
				<td>${content_view.noticode}</td>
			</tr>
<!-- 			<tr>  -->
<!-- 				<td>이름</td> -->
<%-- 				<td>${content_view.bname}</td> --%>
<!-- 				<td>  -->
<%-- 					<input type="text" name="notiauth" value="${content_view.notiauth}"> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr align="left"> 
				<td>제목</td>
			</tr>
			<tr>
<!-- 				<td> -->
<%-- 					<input type="text" name="notititle" value="${content_view.notititle}">	 --%>
<!-- 				</td> -->
				<td>
					<input type="text" name="notititle" value="${content_view.notititle}" size="95">	
				</td>
			</tr>
			<tr> 
				<td align="left">내용</td>
<%-- 				<td>${content_view.bcontent}</td> --%>
<!-- 				<td> -->
<%-- 					<input type="text" name="noticont" value="${content_view.noticont}"> --%>
<!-- 				</td> -->
			</tr>
			<tr>
				<td>
					<textarea  cols="100" rows="20" name="noticont">${content_view.noticont}</textarea>
				</td>
			</tr>
			<tr> 
				<td colspan="2"> 
					<input type="submit" value="수정">
<!-- 					&nbsp;&nbsp;<a href="list">목록보기</a> -->
					<a href="list"><input type="button" value="목록보기"></a>
<%-- 					&nbsp;&nbsp;<a href="noticeDelete?noticode=${content_view.noticode}">삭제</a> --%>
					<a href="noticeDelete?noticode=${content_view.noticode}"><input type="button" value="삭제"></a>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>