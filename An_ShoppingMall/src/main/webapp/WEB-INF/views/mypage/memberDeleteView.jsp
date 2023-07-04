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
        })
    </script>

</html>