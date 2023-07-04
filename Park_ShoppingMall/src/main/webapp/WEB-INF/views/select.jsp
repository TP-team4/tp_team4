<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room and Bloom</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <style>
    aside, section, footer {
      margin: 3px;
      text-align: center;
      /* border: 1px solid black; */
      
    }
    footer{
      position: absolute;
      left:260px;
      font-size: small;
    }
    .container {
      display: flex;
      margin: 0 auto;
      margin-top: 80px;
      max-width:100%;
      font-family: notosans;
      
    }
    #aisdeLeft {
      position: sticky;
      top: 0px;
      height: 500px;
    }
    #aisdeRight {
      position: sticky;
      top: 0px;
      height: 500px;
    }
    #article {
      height: 800px;
      flex-grow: 1;
      padding: auto;
    }
    #aisdeLeft {
    flex-grow: 0;
    width:200px;
    padding: auto;
  }
  #section {flex-grow:1;}
  #aisdeRight {
    flex-grow: 0;
    width:250px;
    padding: auto;
    }
    #aisdeLeft ul li{
      list-style: none;
      text-align: left;
      font-size: small;
      line-height: 2em;
    }
    #aisdeRight ul li{
      list-style: none;
      text-align: right;
      margin-right: 30px;
      line-height: 2em;
    }
    a{
      text-decoration: none;
      color: gray;
    }
    /* .thumbnail{
      padding: 10px;
      width: 30%;
      display: inline-block;
    } */
    section{margin-top: 40px;}
    #log_ul{font-size: small;}
    a:hover{
      color: black;
    }

    .thumbnail{
      float: left;
    }
    section{
/*       border: 2px solid red; */
    }
    #wrap{
/*       border: 3px dashed pink; */
      height: auto;
      margin: 100px;
      
    }
    #prdInfo{
      border: solid 1px black;
    }
    .prdInfo2{
      padding: 100px 50px;
    }
    .underline{
      border-left-width: 0px;
      border-right-width: 0px;
      border-top-width: 0px;
      border-bottom-width: 1px;
    }
    #tbst{
        text-align: left; 
        margin-left: 30px; 
        height: 400px; 
        font-size: small; float: 
        right; margin-top: 10px;
        width: 100%;
    } 
  </style>
<!-- 	 <link rel="stylesheet" href="resources/js/checkCart.js"> -->
</head>

<body>

    <!-- 
    =================================================================
    메인 화면
    박정훈    |   23-06-17      |        전체 레이아웃 위치 세팅 및 스타일 적용 
    ================================================================= 
    -->

  <main id="main">
    <div class="container">
<!--      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@여기서 부터 상품 본문@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
      <!-- 본문 -->
      <section id="section" style="width: 600px;" >
        <article>
            <div id="article" style="height: auto;"> 
                <div id="wrap">
                    <div id="con">
                        <div id="contents">
                            <div class="detailArea">
                            
                            
<!--                             @@@@@@@@@@@@@@@@@여기가 진짜@@@@@@@@@@@@@ -->
                                <c:forEach items="${list}" var="ProductView"> 
                                    <form id="frm" method="post" action="orderPage">
                                    
                                    
                                         <table style="width: 100%;">
                                            <tr>
                                                <td style="width: 60%;">
                                                    <div class="thumbnail" style="height: 400px; float: left; ">
                                                        <!-- 상품 이미지 사진 -->
                                                        <img src="img/test.jpeg" alt="이미지">이미지
                                                    </div>
                                                </td>
                                                <td style="width: 40%;">
                                                    <div class="infoArea">
                                                        <table id="tbst">
                                                            <tr style="border: 1px solid black;">
                                                                <td style="margin-left: 10px;">
                                                                    ${ProductView.procode} <br><br>
                                                                    ${ProductView.catecode} <br><br>
                                                                    <div id="proname">
                                                                        ${ProductView.proname}
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr height="40px">
                                                                <td id="proprice">
                                                                    <!-- 판매가 -->
                                                                    <del>${ProductView.proprice}</del> 원
                                                                </td>
                                                            </tr>
                                                            <tr height="40px">
                                                                <td id="prosale">
                                                                    <!-- 할인가 -->
                                                                    ${ProductView.prosale} 원
                                                                </td>
                                                            </tr>
                                                            <tr height="40px">
                                                                <td>
                                                                    <!-- 배송비 -->
                                                                    ex: \2500 (\20,000 원 이상 구매시 무료배송)
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>상품색상 선택 <br>
                                            <!--                         <select id="option_color" onchange="updateProductInfo()"> -->
                                                                    <select id="optionColor">
                                                                        <option value="" class="x"><b>[필수] option</b></option>
                                                                        <option value="" class="x"><b>------------</b></option>
                                                                        <optgroup label="상품옵션" selected="selected">                                         
                                                                             <!-- <option id="color1" value="${proColor.color1}">${Gu_ProductView.color1}</option>  -->
                                                                             <!-- <option id="color2" value="${Gu_ProductView.color2}">${Gu_ProductView.color2}</option> -->
                                                                        </optgroup>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr id="insertRow">
                                                                <td>상품사이즈 선택 <br>
                                                                    <select id="optionSize" onchange="updateProductInfo()">
                                                                        <option value="" class="x"><b>[필수] option</b></option>
                                                                        <option value="" class="x"><b>------------</b></option>
                                                                        <optgroup label="상품옵션" selected="selected">
                                                                            <c:forEach var="size" items="${Gu_ProductView.sizeOptions}" varStatus="status">
                                                                                <c:if test="${not empty size}">
                                                                                    <option id="size${status.index + 1}" value="${size}">${size}</option>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                             <!-- <option id="size1" value="${Gu_ProductView.size1}">${Gu_ProductView.size1}</option>  -->
                                                                             <!-- <option id="size2" value="${Gu_ProductView.size2}">${Gu_ProductView.size2}</option> -->
                                                                             <!-- <option id="size3" value="${Gu_ProductView.size3}">${Gu_ProductView.size3}</option>  -->
                                                                        </optgroup>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <!-- 추가구성상품 토글창 미완.. -->

                                                                    <!-- /토글 구역 -->

                                                                    <!-- 총금액 위로 상품옵션 선택하면 행 추가됨 -->
                                                                </td>
                                                            </tr>

                                                            <!-- 상품옵션 행 추가 -->
                                                            <tr id="addRow">
                                                                <td>
                                                                    
                                                                    <div id="total" style="margin-top:  30px;">
                                                                        Total(총 상품 금액) : <spen id="total_Price"></spen> 원 (<spen id="total_Quantity"></spen>개)
                                                                    </div>
                                                                    <div style="margin-top: -1px;">
                                                                        <p>
                                                                            <hr style="width: 370px;">
                                                                        </p>
                                                                    </div>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td>
                                                                    <div class="product action">
                                                                        <p>
                                                                            <!-- onClick="location.href='tp_main_login'" 로그인 안했을시 로그인 창으로 -->
                                                                            <!-- <input style="width: 120px; height: 40px;" type="button" id="buy" name="buy" value="Buy Now"  onClick="location.href='로그인창'"> -->
                                                                            <input  type="button" id="buy" name="buy" value="Buy Now" onclick="checkCart()">
                                                                            <!-- 클릭시 바로 order Form으로 간다 -->
                                                                            <input  type="button" id="cartBtn" name="cart" value="Add to Cart">
                                                                            <!-- 클릭시 팝업창 띄워야함 -->
                                                                            <!-- 계속 쇼핑, 장바구니 확인, 바로구매하기 -->
                                                                            <input  type="button" id="wishBtn" name="wish" value="Add to Wish" onclick="btn();">
                                                                            <!-- 위시리스트에 값 넘겨야함 -->
                                                                        </p>
                                                                        <p>
                                                                        <!-- 네이버 간편구매 창 -->
                                                                        </p>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>   
                                                        <div>

                                                            <!-- 상품 옵션 선택시 -->
                                                            <!-- 상품명 / 갯수 / total가격 떠야함 -->
                                                        </div>
                                                    </div>                            
                                                </td>
                                            </tr>
                                        </table>

                                        <input type="hidden" name="proprice" value="${ProductView.proprice}">
                                        <input type="hidden" name="proname" value="${ProductView.proname}">
                                        <input type="hidden" name="procode" value="${ProductView.procode}">


                                        </form>
                                </c:forEach>
            

                            </div>
                        </div>

                        <div style="height: 200px;">
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </section>

    </div>
  </main>
  <div style="position: fixed; bottom: 5px; left: 50%; right: 50%;">
    <a href="#" style="font-size: xx-large;">^</a>
  </div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script type="text/javascript">
	  let procode = document.getElementById("procode").value;
	  let proprice = document.getElementById("proprice").value;
	  let proname = document.getElementById("proname").value;
	
	  function checkCart() {
	    var form = $('#frm').serialize();
	
	    $.ajax({
	      type: 'POST',
	      url: 'checkCart',
	      data: form,
	      success: function(response) {
	        alert(response);
	        if (response === '') {
	          alert('주문페이지로 이동합니다.');
	
	          
	
	          // procode 입력 필드 추가
	          var procodeInput = document.createElement('input');
	          procodeInput.setAttribute('type', 'hidden');
	          procodeInput.setAttribute('name', 'procode');
	          procodeInput.setAttribute('value', procode);
	          form2.appendChild(procodeInput);
	
	          // proprice 입력 필드 추가
	          var propriceInput = document.createElement('input');
	          propriceInput.setAttribute('type', 'hidden');
	          propriceInput.setAttribute('name', 'proprice');
	          propriceInput.setAttribute('value', proprice);
	          form2.appendChild(propriceInput);
	
	          // proname 입력 필드 추가
	          var pronameInput = document.createElement('input');
	          pronameInput.setAttribute('type', 'hidden');
	          pronameInput.setAttribute('name', 'proname');
	          pronameInput.setAttribute('value', proname);
	          form2.appendChild(pronameInput);
	
	          // form을 body에 추가하고 제출
	          document.body.appendChild(form2);
	          form2.submit();
	        } else if (response === 'notnull') {
	          alert("장바구니에 같은 상품이 존재합니다. 장바구니로 이동합니다.");
	          window.location.href = 'ShoppingCart';
	        }
	      },
	      error: function(xhr, status, error) {
	        console.log("Error:", error);
	      }
	    });
	  }
	</script>
	
</body>
</html>







