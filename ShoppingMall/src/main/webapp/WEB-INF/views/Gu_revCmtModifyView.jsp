<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>댓글작성</h4>
	<table>
		<form method="post" action="Gu_revCmtModify">
			<input type="hidden" name="revcode" value="${revCmtModifyView.revcode}">
			<input type="hidden" name="cmtcode" value="${revCmtModifyView.cmtcode}">
			<tr>
				<td>댓글내용</td>
				<td><textarea rows="5" cols="50" name="cmtcont" size="500">${revCmtModifyView.cmtcont}</textarea></td>				
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="댓글수정">&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
		</form>
	</table>
</body>
</html>