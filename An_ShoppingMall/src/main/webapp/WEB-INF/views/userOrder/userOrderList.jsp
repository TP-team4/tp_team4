<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <style>
			ul{
			   list-style:none;
			   }
            section#content ul li::after {
                content: "";
                display: block;
                clear: both;
            }

            section#content div.thumb {
                float: left;
                width: auto;
            }

            section#content div.orderInfo {
                float: right;
                width: calc(100% - 270px);
            }

            section#content div.orderInfo {
                font-size: 20px;
                line-height: 2;
            }


            section#content div.orderInfo .userOrderDelete {
                text-align: right;
            }

            section#content div.orderInfo .userOrderDelete button {
                font-size: 22px;
                padding: 5px 10px;
                border: 1px solid #eee;
                background: #eee;
            }

            .delBtn {
                float: right;
                width: 300px;
                text-align: right;
            }

            .delBtn button {
                font-size: 18px;
                padding: 5px 10px;
                border: 1px solid #eee;
                background: #eee;
            }

			 section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
   section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
        </style>
    </head>

    <body>
<section id="content">
    <ul class="orderList">
        <c:set var="totalprice" value="0" />
        <c:forEach items="${userOrderList}" var="dto">
            <li>
                <div class="PaymentItem_article__2cJ56">
                    <div class="thumb">
                        <img src="${dto.proThumb}" />
                    </div>

                    <div class="orderInfo">
                        <div class="userOrderDelete">
                            <button type="button" class="userOrderDelete_${dto.ordercode}_btn"
                                    data-cartNum="${dto.ordercode}">&#10006;</button>

                            <script>
                                $(".userOrderDelete_${dto.ordercode}_btn").click(function () {
                                    var confirm_val = confirm("정말 삭제하시겠습니까?");

                                    if (confirm_val) {
                                        var checkArr = new Array();

                                        checkArr.push($(this).attr("data-ordercode"));

                                        $.ajax({
                                            url: "userOrderDelete",
                                            type: "post",
                                            data: { chbox: checkArr },
                                            success: function (result) {
                                                if (result == 1) {
                                                    location.href = "/userOrder/userOrderList";
                                                } else {
                                                    alert("삭제 실패");
                                                }
                                            }
                                        });
                                    }
                                });
                            </script>
                        </div>

                        <p>
                            <span>상품명</span>${dto.proName}<br />
                            <span>개당 가격</span>
                            <fmt:formatNumber pattern="###,###,###" value="${dto.proPrice}" /> 원<br />
                            <span>구입 수량</span>${dto.amount} 개<br />
                            <span>최종 가격</span>
                            <fmt:formatNumber pattern="###,###,###" value="${dto.totalprice}" />
                            원
                        </p>
                    </div>
                </div>
                <c:set var="totalprice" value="${dto.totalprice}" />
            </li>
        </c:forEach>
    </ul>
</section>
    </body>

    </html>