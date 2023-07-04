<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*
   section#content ul li { display:inline-block; margin:10px; }
   section#content div.goodsThumb img { width:200px; height:200px; }
   section#content div.goodsName { padding:10px 0; text-align:center; }
   section#content div.goodsName a { color:#000; }
*/
   section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
   section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
</style>
</head>
<body>
<section id="content">
   
'
    <c:forEach items="${userOrderView}" var="dto">
    <li>
    <div>
     <p><span>주문번호 <a href="/userOrder/userOrderList?n=${dto.ordercode}">${orderList.orderId}</a></p>
     <p><span>수령인 ${dto.name}</p>
     <p><span>주소 (${dto.addr}) ${dto.etcaddr} </p>
     <p><span>가격 <fmt:formatNumber pattern="###,###,###" value="${dto.proprice}" /> 원</p>
    </div>
    </li>
    </c:forEach>
   </ul>

</section>
</body>
</html>