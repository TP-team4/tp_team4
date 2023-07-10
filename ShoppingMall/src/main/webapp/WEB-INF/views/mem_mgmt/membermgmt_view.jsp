<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	//뒤로가기
	function goBack() {
	    window.history.back();
	}

	//다음 우편검색 서비스
	 function execDaumPostcode() {
        new daum.Postcode( {
          oncomplete: function( data ) {
            document.getElementById( 'zip-code' ).value = data.zonecode;
            document.getElementById( 'address-1' ).value = data.address;
          }
        } ).open();
      }
	
	//전화번호 자동 하이픈
	  const hypenTel = (target) => {
		  target.value = target.value
		    .replace(/[^0-9]/g, '')
		    .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
		 }

</script>
</head>
<body>
<h2 align="center">회원정보관리</h3>
		<form action=membermgmtModify method="post" >
			<table border="1" align="center" width="500">
				<tr>
					<td>아이디</td>
					<td><input type="text" id="id" name="id" value="${membermgmt_view.id}" readonly></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="${membermgmt_view.name}" ></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" name="pcode" id="zip-code" placeholder="우편번호" value="${membermgmt_view.pcode}" readonly>
     					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name="loadaddr" id="address-1" value="${membermgmt_view.loadaddr}" placeholder="도로명주소" style="width: 300px">&nbsp;<small>도로명주소</small><br>
						<input type="text" name="etcaddr" id="address-2" value="${membermgmt_view.etcaddr}" placeholder="상세주소" style="width: 300px">&nbsp;<small>상세수조</small><br>
						<input type="text" name="lotaddr" value="${membermgmt_view.lotaddr}" placeholder="지번주소" style="width: 300px">&nbsp;<small>지번주소</small><br>
						<input type="text" name="extraaddr" value="${membermgmt_view.extraaddr}" placeholder="추가주소" style="width: 300px">&nbsp;<small>추가주소</small><br>
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
					<input type="text" name="hp" oninput="hypenTel(this)" placeholder="전화번호 입력" maxlength="13" value="${membermgmt_view.hp}"/>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" value="${membermgmt_view.email}"></td>
				</tr>
				<tr>
				<td colspan="2" align="center">
					<input type="submit" value="회원정보수정">
					<input type="reset"  value="초기화">
					<button type="button" onclick="goBack();">취소</button>
						<a href="membermgmtDelete?id=${membermgmt_view.id}"><input type="button" value="회원삭제"></a>
				</td>
				</tr>
			</table>
			
		</form>
		
</body>
</html>