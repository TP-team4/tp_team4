<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 	    table{background-color: rgb(213, 203, 190);}
         table, td, th {
             border : 1px solid black;
             border-collapse : collapse;
             height: 30px
         };
</style>
</head>
<body>
	<form action="">
        <div>
            <table>
                <tr>
                    <td width="200">상품코드</td>
                    <td colspan="2">${Gu_ProductView.procode}</td>
                </tr>
                <tr>
                    <td>카테고리코드</td>
                    <td colspan="2">${Gu_ProductView.catecode}</td>
                </tr>
                <tr>
                    <td>상품이름</td>
                    <td id="productName" colspan="2">${Gu_ProductView.proname}</td>
                </tr>
                <tr>
                    <td>상품가격</td>
                    <td id="proprice" colspan="2"><del>${Gu_ProductView.proprice}</del> 원</td>
                </tr>
                <tr>
                    <td>할인가격</td>
                    <td id="prosale" colspan="2">${Gu_ProductView.prosale} 원</td>
                </tr>
                <tr>
<!--                 	나중에 값받아서 데이터 추가 -->
                	<td>상품색상 선택</td>
                    <td colspan="2">
<!--                         <select id="option_color" onchange="updateProductInfo()"> -->
                        <select id="optionColor" >
                        	<option value="[필수] option" class="x"><b>[필수] option</b></option>
                        	<option value="" class="x"><b>------------</b></option>
                            <optgroup label="상품옵션" selected="selected">
                            	<c:forEach var="color" items="${Gu_ProductView.colorOptions}" varStatus="status">
								    <c:if test="${not empty color}">
								        <option id="color${status.index + 1}" value="${color}">${color}</option>
								    </c:if>
								</c:forEach>
<%--                                 <option id="color1" value="${proColor.color1}">${Gu_ProductView.color1}</option> --%>
<%--                                 <option id="color2" value="${Gu_ProductView.color2}">${Gu_ProductView.color2}</option> --%>
                            </optgroup>
                        </select>
					</td>
				</tr>
				<tr id="insertRow">
					<td>상품사이즈 선택</td>
					<td colspan="2">
                        <select id="optionSize">
                        	<option value="[필수] option" class="x">[필수] option</option>
                        	<option value="" class="x">------------</option>
                            <optgroup label="상품옵션" selected="selected">
                            	<c:forEach var="size" items="${Gu_ProductView.sizeOptions}" varStatus="status">
							        <c:if test="${not empty size}">
							            <option id="size${status.index + 1}" value="${size}">${size}</option>
							        </c:if>
							    </c:forEach>
<%--                                 <option id="size1" value="${Gu_ProductView.size1}">${Gu_ProductView.size1}</option> --%>
<%--                                 <option id="size2" value="${Gu_ProductView.size2}">${Gu_ProductView.size2}</option> --%>
<%--                                 <option id="size3" value="${Gu_ProductView.size3}">${Gu_ProductView.size3}</option> --%>
                            </optgroup>
                        </select>
                    </td>
                </tr>
                <tr id="addRow">
                	<td colspan="3">
                		Total(총 상품 금액) : <spen id="totalPrice"></spen> 원 (<spen id="totalQuantity"></spen>개)
                	</td>
                </tr>
                <tr>
                    <td colspan="3" align="right">
                        <input id="order" type="button" value="주문">&nbsp;&nbsp;
                        <input id="cart_btn" type="button" value="장바구니" onclick="addCart">&nbsp;&nbsp;
                        <input id="wish" type="button" value="위시리스트">&nbsp;&nbsp;
                        
                        <input id="" type="hidden" name="procode" value="${Gu_ProductView.procode}">
                        <input id="" type="hidden" name="" value="${Gu_ProductView.catecode}">
                        <input id="" type="hidden" name="" value="">
                        <input id="" type="hidden" name="" value="">
                        <input id="" type="hidden" name="" value="">
                    </td>
                </tr>
                <tr>
                    <td>상품설명</td>
                    <td colspan="2">${Gu_ProductView.proinfo}</td>
                </tr>
            </table>
        </div>
    </form>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
var cnt = 0;

$("#optionColor").change(function () {
    $("#optionSize").change(function () {
    });
});

$("#optionSize").change(function () {
    var optionColor = $("#optionColor option:selected").val();
    var optionSize = $("#optionSize option:selected").val();

    if (optionSize != "" && optionColor == "") {
        alert("색상을 먼저 선택하셔야 합니다.");
    } else {
        var insertHTML = "";
        var opColor = $("#optionColor option:selected").val();
        var opSize = $("#optionSize option:selected").val();

        var propriceText = $("#proprice").text();
        var proprice = parseInt(propriceText);
        console.log(proprice);

        var prosaleText = $("#prosale").text();
        var prosale = parseInt(prosaleText);
        console.log(prosale);

        var totalCnt = ($("#optionColor option:not(.x)").length) * ($("#optionSize option:not(.x)").length);

        for (var i = 1; i < totalCnt + 30; i++) {
            if (opColor == $("#colorN" + i).text() && opSize == $("#sizeN" + i).text()) {
                $("#optionColor option:selected").val("");
                $("#optionSize option:selected").val("");
                alert("이미 선택한 상품입니다.");
                return false;
            }
        }
        cnt++;
        insertHTML = '<tr id="productRow' + cnt + '">'
            + '<td>' + $("#productName").text()
            + '<div id="addInfo' + cnt + '">'
            + '<div id="colorN' + cnt + '"><br> - 색상: ' + opColor + '/</div>'
            + '<div id="sizeN' + cnt + '"><br> - 사이즈: ' + opSize + '</div>'
            + '<div id="product">'
            + '<input id="quantityN' + cnt + '" type="text" value="1" size="2" maxlength="2">'
            + '<a href="#" class="quantityUp" data-row="' + cnt + '"><img src="resources/quantityup.png" alt="up"></a>'
            + '<a href="#" class="quantityDown" data-row="' + cnt + '"><img src="resources/quantitydown.png" alt="down"></a>'
            + '<a href="#" class="proRemove" data-row="' + cnt + '"><img src="resources/remove.png" alt="remove"></a></td>'
            + '<td colspan="2"><div class="proTotal"></div></td>'
            + '</div></div></tr>';

        var addRow = $("#addRow");
        $(insertHTML).insertBefore(addRow);

        $("#optionColor option:selected").val("");
        $("#optionSize option:selected").val("");

        $(".proRemove[data-row=" + cnt + "]").click(function () {
            var rowId = $(this).closest("tr").attr("id");
            $("#" + rowId).remove();
            totalPrice();
        });

        $("#quantityN" + cnt).change(function () {
            updateAmount($(this));
        });

        $(".quantityUp[data-row=" + cnt + "]").click(function () {
            increaseQuantity($(this).data("row"));
        });

        $(".quantityDown[data-row=" + cnt + "]").click(function () {
            decreaseQuantity($(this).data("row"));
        });

        updatePrice();
        totalPrice();
    }
});

function increaseQuantity(row) {
    var quantityElement = $("#quantityN" + row);
    var quantity = parseInt(quantityElement.val());
    if (!isNaN(quantity)) {
        quantity += 1;
        quantityElement.val(quantity);
        updateAmount(quantityElement);
    }
}

function decreaseQuantity(row) {
    var quantityElement = $("#quantityN" + row);
    var quantity = parseInt(quantityElement.val());
    if (quantity > 1 && !isNaN(quantity)) {
        quantity -= 1;
        quantityElement.val(quantity);
        updateAmount(quantityElement);
    }
}

function removeProduct(row) {
    $("#productRow" + row).remove();
    totalPrice();
}
// 여기는 됨 @@@@
function totalPrice() {
    var total = 0;
    var totalQuantity = 0;

    $("div[class^=proTotal]").each(function () {
        var quantity = parseInt($(this).closest("tr").find("input[id^=quantityN]").val());
//         console.log("총갯수 = "+quantity);
        var price = parseInt($("#prosale").text());
//         console.log("총 금액 = "+price);
        var subTotal = quantity * price;
//         console.log("subTotal = "+subTotal);

        total += subTotal;
        totalQuantity += quantity;
        console.log("토탈금액 = "+total);        
        console.log("토탈갯수 = "+totalQuantity);        
    });
//     row.find(".proTotal").text(total);
//     $("#total_Price").html(total.toLocaleString());
//     $("#total_Quantity").html(totalQuantity.toLocaleString());
    	$("#totalPrice").text(total);
    	$("#totalQuantity").text(totalQuantity);
}
// @@@@
function updatePrice() {
    $("input[id^=quantityN]").each(function () {
        var row = $(this).closest("tr");
        console.log("row = "+row);                
        var quantity = parseInt($(this).val());
        console.log("quantity = "+quantity);                
        var price = parseInt($("#prosale").text());
        console.log("price = "+price);                
        if (!isNaN(quantity) && !isNaN(price)) {
            var total = quantity * price;
            row.find(".proTotal").text(total);
        }
    });
    totalPrice();
}

function updateAmount(quantityElement) {
    updatePrice();
}

</script>

</html>