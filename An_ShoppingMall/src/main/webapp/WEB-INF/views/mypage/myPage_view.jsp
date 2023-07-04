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

	//다음 우편검색 서비스
	 function execDaumPostcode() {
        new daum.Postcode( {
          oncomplete: function( data ) {
            document.getElementById( 'zip-code' ).value = data.zonecode;
            document.getElementById( 'address-1' ).value = data.address;
          }
        } ).open();
      }
	
	//새비밀번호, 새비밀번호 확인 일치
	function myPageModify(){
		let pwd = document.getElementById("pwd").value;
		let pwd2 = document.getElementById("pwd2").value;
		
		if (pwd == pwd2) {
		modifyForm.submit();			
		}else {
			alert("비밀번호가 일치하지 않습니다.")
		}
	}
	
	//전화번호 자동 하이픈
	  const hypenTel = (target) => {
		  target.value = target.value
		    .replace(/[^0-9]/g, '')
		    .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
		 }

	   function fnRadioName(){
	        var radioId = $('input[name="sms"]:checked').val();
	        var rasioNm = $("label[for='"+radioId+"']").text(); // 라벨값을 불러온다.
	        alert(rasioNm);
	    }
</script>
</head>
<body>
<h2 align="center">회원정보수정</h3>
		<form action=myPageModify method="post" name="modifyForm">
			<table border="1" align="center">
				<tr>
					<td>아이디</td>
					<td><input type="text" id="id" name="id" value="${myPage_view.id}" readonly></td>
				</tr>
				<tr>
					<td>새 비밀번호</td>
					<td><input type="password" id ="pwd" name="pwd" placeholder="비밀번호 입력"></td>
				</tr>
				<tr>
					<td>새 비밀번호 확인</td>
					<td><input type="password" id ="pwd2" placeholder="비밀번호 재입력"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="${myPage_view.name}" readonly></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						 <input type="text" name="pcode" id="zip-code" placeholder="우편번호" value="${myPage_view.pcode}" readonly>
     					 <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name="loadaddr" id="address-1" value="${myPage_view.loadaddr}" placeholder="도로명주소" style="width: 300px">&nbsp;도로명주소<br>
						<input type="text" name="etcaddr" id="address-2" value="${myPage_view.etcaddr}" placeholder="상세주소" style="width: 300px">&nbsp;상세수조 (선택입력가능)
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
					<input type="text" name="hp" oninput="hypenTel(this)" placeholder="전화번호 입력" maxlength="13" value="${myPage_view.hp}"/>
					</td>
				</tr>
				<tr>
					<td>SMS 수신여부</td>
					<td>						
						<input type="radio" name="sms" id="sms" value="Y" onclick="fnRadioName();"/><label for="Y">수신함</label>
						<input type="radio" name="sms" id="sms" value="N" onclick="fnRadioName();"/><label for="N">수신안함</label>
<!-- 						<input type="radio" name="sms" value="${myPage_view.sms}">수신안함<br> -->
						<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" value="${myPage_view.email}"></td>
				</tr>
				<tr>
					<td>이메일 수신여부</td>
					<td>						
						<input type="radio" name="emails" value="Y">수신함
						<input type="radio" name="emails" value="N">수신안함<br>
						<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p>
					</td>
				</tr>
				<tr>
				<td colspan="2" align="center">
					<input type="button" onclick="myPageModify()" value="회원정보수정">
					<input type="reset" value="취소">
<!-- 					<button type="button" onclick="removeMember();" align="right"> 회원탈퇴 </button> -->
						<a href="memberDeleteView?id=${myPage_view.id}"><input type="button" value="회원탈퇴"></a>
				</td>
				</tr>
			</table>
			
		</form>
		
</body>
</html>