<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<!-- ======================================================== 
rev_writeView.jsp

  개발자   |   수정자   |    개발 및 수정 일자    |    수정 내용
  구나현       박동명           23-06-21           작성자의 input 태그 name 속성 revauth -> id
===========================================================-->
<body>
	<table width="500" border="1">
		<form method="post" action="rev_write">
			<tr>
				<td>상품번호</td>
				<td><input type="text" name="procode" size="50"></td>
			</tr>
			<tr>
				<td>리뷰제목</td>
				<td><input type="text" name="revtitle" size="50"></td>
			</tr>
			<tr>
				<td>리뷰내용</td>
				<td><textarea rows="10" name="revcont" size="500"></textarea></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="id" size="50"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="입력">
					&nbsp;&nbsp;&nbsp;
					<a href="rev_list">목록보기</a>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>