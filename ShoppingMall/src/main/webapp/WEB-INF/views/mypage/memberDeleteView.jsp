<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
</head>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <body>
        <section id="container">
            <form action="memberDelete" method="post" id="delForm">
                <div>
                    <label>아이디</label>
                    <input type="text" name="id" value="${id}" readonly="readonly" />
                </div>
                <div>
                    <label>패스워드</label>
                    <input type="password" name="pwd" id="userPass" />
                </div>
                <div>
                    <button type="button" id="sub">회원탈퇴</button>
                    <button type="button" onclick="goBack();">취소</button>
                </div>
            </form>
        </section>
    </body>
    <script type="text/javascript">
        function goBack() {
            window.history.back();
        }

        $(document).ready(function () {
            $("#sub").on("click", function () {
                if ($("#userPass").val() == "") {
                    alert("비밀번호를 입력해주세요.");
                    $("#userPass").focus();
                    return false;
                } else {
                    if (confirm("회원탈퇴하시겠습니까?")) {
                        $("#delForm").submit();
                    }
                }
            });
        });
        
//         $(document).ready(function () {
//             $("#sub").on("click", function () {
//                 var userPass = $("#userPass").val(); // 입력된 비밀번호 가져오기
//                 var confirmPass = "비밀번호 확인용 값"; // 확인용 비밀번호 설정
                
//                 if (userPass === confirmPass) {
//                     // 비밀번호 일치하는 경우
//                     if (confirm("회원탈퇴하시겠습니까?")) {
//                         $("#delForm").submit();
//                     }
//                 } else {
//                     // 비밀번호 불일치하는 경우
//                     alert("비밀번호가 일치하지 않습니다.");
//                     $("#userPass").val(""); // 비밀번호 필드 초기화
//                     $("#userPass").focus(); // 비밀번호 필드에 포커스 설정
//                 }
//             });
//         });


    </script>

</html>