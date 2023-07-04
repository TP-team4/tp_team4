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
<!--     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"> -->
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
    <!-- 
    =================================================================
    좌측 사이드바 레이아웃 세팅
    조은유   |   23-06-16      |                      사이드바 레이아웃 조정 
    ================================================================= 
    -->
      <!-- 좌측 사이드바 -->
      
      <aside id="aisdeLeft">
        <div id="title">
          <a href="tp_main_1.html">
            <span style="font-size: x-large; position: absolute; left: 0px; color: black;  width: 200px;">Room & Bloom</span>
          </a>
        </div>
        <div class="category" style="position: absolute; top: 70px;">
          <ul style="width: 200px;">
              <li><a href="#">BEST</a></li>
              <li><a href="#">의자</a></li>
              <li><a href="#">침대</a></li>
              <li><a href="#">테이블/식탁/책상</a></li>
              <li><a href="#">소파</a></li>
              <li><a href="#">서랍/수납장</a></li>
              <li><a href="#">거실장/TV장</a></li>
              <li><a href="#">선반</a></li>
              <li><a href="#">진열장/책장</a></li>
              <li><a href="#">행거/옷장</a></li>
              <li><a href="#">화장대</a></li>
          </ul>
      </div>
      <div class="notice" style="position: absolute; top: 400px;">
          <ul>
              <li><a href="tp_main_notice.html">Notice</a></li>
              <li><a href="tp_main_QnA.html">QnA</a></li>
              <li><a href="tp_main_review.html">Review</a></li>
          </ul>
      </div>
      <div class="info" style="position: absolute; top: 550px;">
          <ul>
              <li>02-336-4363</li>
              <li>
                  Mon-Fri 10:00-19:00
                  <br>
                  Weekend,Holiday off
              </li>
          </ul>
      </div>        

      </aside>
    
      <!-- 
    =================================================================
    본문   / 상품 화면 출력부 / 상품 가격및 이미지 출력 부분
    박정훈    |   23-06-16       |       a태그를 사용하여 클릭시 상세페이지 이동 
    =================================================================
    -->
    
    
    
    
    
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
<%--                                 <c:forEach items="${list}" var="ProductView">  --%>
                                    <form method="post" action="orderPage">
                                    
                                    
                                         <table style="width: 100%;">
                                            <tr>
                                                <td style="width: 60%;">
                                                    <div class="thumbnail" style="height: 400px; float: left; ">
                                                        <!-- 상품 이미지 사진 -->
<!--                                                         <img src="img/test.jpeg" alt="이미지">이미지 -->
                                                        <img src="#" alt="이미지">이미지
                                                    </div>
                                                </td>
                                                <td style="width: 40%;">
                                                    <div class="infoArea">
                                                        <table id="tbst">
                                                            <tr style="border: 1px solid black;">
                                                                <td style="margin-left: 10px;">
                                                                    ${Gu_ProductView.procode} <br><br>
                                                                    ${Gu_ProductView.catecode} <br><br>
                                                                    <div id="proname">
                                                                        ${Gu_ProductView.proname}
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr height="40px">
                                                                <td id="proprice">
                                                                    <!-- 판매가 -->
                                                                    <del>${Gu_ProductView.proprice}</del> 원
                                                                </td>
                                                            </tr>
                                                            <tr height="40px">
                                                                <td id="prosale">
                                                                    <!-- 할인가 -->
                                                                    ${Gu_ProductView.prosale} 원
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
                                                                            <c:forEach var="color" items="${Gu_ProductView.colorOptions}" varStatus="status">
                                                                                <c:if test="${not empty color}">
                                                                                    <option id="color${status.index + 1}" value="${color}">${color}</option>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                             <!-- <option id="color1" value="${proColor.color1}">${Gu_ProductView.color1}</option>  -->
                                                                             <!-- <option id="color2" value="${Gu_ProductView.color2}">${Gu_ProductView.color2}</option> -->
                                                                        </optgroup>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>상품사이즈 선택 <br>
                                                                    <select id="optionSize">
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
                                                                            <input  type="submit" id="buy" name="buy" value="Buy Now">
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
                                                                    <div>${Gu_ProductView.proinfo}</div>
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


                                        <!-- 카테고리 -->
<!--                                         <div> -->
<%--                                             <c:if test="${ProductView.catecode eq 1}"> --%>
<!--                                                 의자 -->
<%--                                             </c:if> --%>
<%--                                             <c:if test="${ProductView.catecode eq 2}"> --%>
<!--                                                 침대 -->
<%--                                             </c:if> --%>
<%--                                             <c:if test="${ProductView.catecode eq 3}"> --%>
<!--                                                 테이블/책상 -->
<%--                                             </c:if> --%>
<%--                                             <c:if test="${ProductView.catecode eq 4}"> --%>
<!--                                                 소파 -->
<%--                                             </c:if> --%>
<!--                                         </div> -->


<%--                                         <input type="hidden" name="proprice" value="${ProductView.proprice}"> --%>
<%--                                         <input type="hidden" name="proname" value="${ProductView.proname}"> --%>
<%--                                         <input type="hidden" name="procode" value="${ProductView.procode}"> --%>


                                        </form>
<%--                                 </c:forEach> --%>
            


<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2여기까지@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->



                                <!-- 여기가 주문버튼 끝 -->
                                <div class="product">
                                    <div id="prdDetail" style="height: 1000px;">
                                        <!-- 상품 이미지 들어갈 부분/ 임의로 height 1000으로 잡아놨음 -->
                                        상품 상세이미지 들어가야 함
                                    </div>
                                </div>
                                <div id="prdInfo">
                                    <div class="prdInfo2">
                                        <div class="cont">
                                            <h3>상품결제정보</h3>
                                            고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등
                                            정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다. &nbsp; 
                                            <br>
                                            <br>
                                            무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다. &nbsp;
                                            주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며&nbsp;입금되지
                                            않은 주문은 자동취소 됩니다.  
                                            <div>
                                                <br>
                                                <br>
                                                <br>
                                            </div>
                                        </div>
                                        <div class="cont">
                                            <h3>배송정보</h3>
                                            - 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.
                                            <br>
                                            <br>
                                            - 주문하신 상품은 결제 완료 후 1-3일 내 출고됩니다.
                                            <br>
                                            <br>
                                            - 오후 5시 이전 주문 건은 재고가 있는 상품에 한해 당일 출고됩니다.
                                            <br>
                                            <br>
                                            - 거래처 사정으로 입고 및 제작이 지연되는 상품이 포함되어 있을 시 부득이하게 출고가 지연될 수 있으며 따로 지연 안내 연락을 드립니다.
                                            <br>
                                            <br>
                                            - 2만원 이상 결제 시 무료배송입니다.
                                            <div>
                                                <br>
                                                <br>
                                                <br>
                                            </div>
                                        </div>
                                        <div class="cont">
                                            <h3>교환 및 반품정보</h3>
                                            <br>
                                            <h4>교환 및 반품 주소</h4>
                                            - [04055] 서울특별시 마포구 홍익로2길 35 (서교동) 346-27 1층 (주) 래셔널하이엔드
                                            <br>
                                            <br>
                                            - 제품 수령 후 7일 이내 고객센터[02.336.4363] 전화, 게시판 문의, 교환 및 반품 신청 등으로 접수
                                            <br>
                                            <br>
                                            &nbsp; * 여행, 출장 등 개인적인 사유로 기간이 지날 경우 처리가 불가합니다. 모든 고객님들께 동등하게 적용되는 부분이니 양해 부탁드립니다.
                                            <br>
                                            <br>
                                            - 교환 및 반품 의사를 밝혀주시면 눅윤에서 택배사 측에 방문 수거 요청을 해드립니다.
                                            <br>
                                            <br>
                                            - 수령일로부터 7일 이내 미접수 및 임의로 제품을 보내주실 경우 반송될 수 있으니 주의 바랍니다.
                                            <br>
                                            <br>
                                            <strong>- 상품 확인이 가능한 포장된 투명 폴리 비닐 개봉 시 반품이 어렵습니다.</strong>
                                            <div>
                                                <br>
                                                <br>
                                                <br>
                                            </div>
                                        <br>
                                        </div>
                                        <div class="cont">
                                            <h3>교환 및 반품이 불가능한 경우</h3>
                                            - 포장된 투명 폴리 비닐 개봉하여 상품가치가 상실된 경우
                                            - 화면 해상도로 인한 색상 차이 및 기재된 상세 사이즈의 미세한 오차
                                            - 고객 과실로 인한 상품의 훼손
                                            - 관리법 미숙으로 인한 변색
                                            - 생산시기에 따른 색상 차이
                                        </div>
                                        <div>
                                            <br>
                                            <br>
                                            <br>
                                        </div>
                                        <div class="cont">
                                            <h3>적립금 지급 안내</h3>
                                            <br>
                                            <br>
                                            - 신규 회원 가입 시 적립금 2천원 지급
                                            - 적립금 5천원 이상 소유 시 사용할 수 있습니다.
                                            - 상품 구매 합계액 20,000원 이상일 시 적립금 사용 가능합니다.
                                            - 상품 후기 작성 시 적립금 500원 지급, 사진 후기 작성 시 적립금 1,000원 지급
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div style="height: 200px;">
                        </div>
                        <div id="prdReview">
                            <div class="board">
                                <!-- <div class="button">
                                Review
                                <span>
                                <a href="">
                                Write
                                </a>
                                얜 삭제??
                                <a href="">All View</a>
                                </span>
                                </div> -->
                            </div>
                            <div class="board2">
                                <table border="1">
                                        <tr align="right">
                                            <td width="100%" align="left"><h4>Review</h4></td>
                                        <td>
                                            <input type="button" value="Write" onclick="">
                                        </td>
                                        <td>
                                            <input type="button" value="All View" onclick="">
                                        </td>
                                    </tr>
                                </table>
                                    <div>
                                        <br>
                                        <br>
                                    </div>
                                <table border="1" class="rv" style="width: 100%;">
                                    <tr>
                                        <td width="80px">No</td>
                                        <td width="200px">Subject</td>
                                        <td width="100px">Writer</td>
                                        <td width="100px">Date</td>
                                        <td width="100px">Hit</td>
                                    </tr>
                                    <!-- 리뷰 내용 들어갈 공간 -->
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </section>

    <!-- 
    =================================================================
    우측 사이드바 레이아웃 세팅
    조은유   |   23-06-16      |                      사이드바 레이아웃 조정 
    ================================================================= 
    -->
      <!-- 우측사이드바 -->
      <aside id="aisdeRight">
        <div class="rightbar">
          <div class="cart" style="position: absolute; top: 80px; right: 0px;">
              <ul>
                  <li><a href="#" style="color: black; width: 200px;">Cart - 0</a></li>
              </ul>
          </div>
          <div class="login" style="position: absolute; top: 160px; right: 0px;">
              <ul id="log_ul" style="width: 200px;">
                  <li><a href="tp_main_login noneStyle.html">Log in</a></li>
                  <li><a href="tp_main_register.html">Register</a></li>
                  <li><a href="#">Order</a></li>
                  <li><a href="#">My Page</a></li>
              </ul>
          </div>
          <!-- 검색기능 -->
        <div class="search" style="position: absolute; top: 600px; right: 10px; width: 250px;">
          <form method="post" action="#">
              <fieldset>
                  <input type="text" class="underline">
                  <a href="#">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                          <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                      </svg>
                  </a>
              </fieldset>    
            </form>
          </div>
      </aside>

    </div>
  </main>
  <footer id="footer" style="font-family: notosans; text-align: left;">
    <a href="tp_main_1.html" style="color: black;">Room & Bloom</a> <br>
    <p style="line-height: 2em;">
      <a href="#">About us</a>
    </p>
  </footer>
  <div style="position: fixed; bottom: 5px; left: 50%; right: 50%;">
    <a href="#" style="font-size: xx-large;">^</a>
  </div>
<!--   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script> -->
</body>


<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!-- 제이쿼리 추가 ㅜㅜ.. -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	var cnt = 0;
	
	$("#optionColor").change(function(){
		$("#optionSize").change(function(){
		});
	});
	
	$("#optionSize").change(function() {
		var optionColor = $("#optionColor option:selected").val();
		console.log("optionColor ==>"+optionColor);
		var optionSize = $("#optionSize option:selected").val();
		console.log("optionSize ==>"+optionSize);
		
		if (optionSize != "" && optionColor == "") {
			alert("색상을 먼저 선택하셔야 합니다.");
		} else {
	        var insertRow = "";
	        var opColor = $("#optionColor option:selected").val();
	        var opSize = $("#optionSize option:selected").val();
	        var proprice = $("#proprice").val();
	        var prosale = $("#prosale").val();
	
	        var totalCnt = ($("#optionColor option:not(.x)").length) * ($("#optionSize option:not(.x)").length);//옵션갯수*옵션갯수
	
	        for (var i = 1; i < totalCnt; i++) {
	            if (opColor == $("#colorN"+i).text() && opSize == $("#sizeN"+i).text()) {
	                $("#optionColor option:selected").val("");
	                $("#optionSize option:selected").val("");
	                    alert("이미 선택한 상품입니다.");
	                    return false;
	            }
	        }
	        cnt++;
	        insertHTML = '<tr id=""productRow'+cnt+'"">'
	                    +'<td colspan="2">'+$("productName").text()
	                    +'<div id="addInfo'+cnt+'">'
	                    +'<div id="colorN'+cnt+'"><br> - 색상: '+opColor+'</div>/ '
	                    +'<div id="sizeN'+cnt+'"><br> - 사이즈: '+opSize+'</div>'
	                    +'<div id="product">'
						+'<input id="quantityN'+cnt+'" type="text" value="1" size="2" maxlength="2">'
						+'<a href="#" id="quantity'+cnt+'"><img src="resources/quantityup.png" alt="up"></a>'
						+'<a href="#" id="quantity'+cnt+'"><img src="resources/quantitydown.png" alt="down"></a>'
						+'<a href="#" id="ProRemove'+cnt+'"><img src="resources/remove.png" alt="remove"></a></td>'
						+'<td><div id="proTotal"></div></td>'
	                    +'</div></div></tr>';
	        // var table = document.getElementById('insertRow').parentNode;
	        // var row = table.insertRow(table.rows.length - 3);
	        // addrow.id = "productRow"+cnt;
	        // row.innerHTML = insertRow;
	        var addRow = $("#addRow");//addRow id를가진 요소 선택
	        addRow.insertBefore(insertHTML);//addRow 요소 위에 상품옵션 선택하면 행추가 됨
	
	        if ($("#addInfo"+cnt)) {
	            updatePrice();//옵션 선택된 상품에 대한 수량*금액
	            totalPrice();//총가격
	        }
	        
	        // 행추가 후 옵션선택 초기화
	        $("#optionColor option:selected").val("");
	        $("#optionSize option:selected").val("");
	
	        // 옵션선택 상품 삭제
	        $("#ProRemove"+cnt+" a").click(function() {
	            var rowId = $(this).closest("tr").data("row-id");
	            $("#"+rowId).remove();
	            totalPrice();
	        });
		}
	
	    // input태그 안에 수량 변경 함수
	    $("#quantityN input").change(function(){
	        updateAmount(this);
	    });
	    
	    function totalPrice() {
	        var addPrice = 0;
	        var addQuantity = 0;
	
	        $("#total").each(function(){
	            var price = parseInt($(this).children("#totalPrice").text().replace(',',''));
	            addQuantity += parseInt($(this).children("#totalQuantity input").val());
	            
	            addPrice += (price * addQuantity);
	        });
	
	        var totalPirce = addPrice;
	        var totalQuantity = addQuantity;
	
	        $("#total").change(function() {
	            $("#total_Price").html(totalPirce.toLocaleString());
	            $("#total_Quantity").html(totalQuantity.toLocaleString());
	        });
	    }
	    function updatePrice(quantityInput) {
	        var row = $(quantityInput).closest("tr"); // 선택된 수량 input의 부모 tr 요소를 찾습니다.
	        var quantity = parseInt($(quantityInput).val()); // 선택된 수량을 가져옵니다.
	        var price = parseInt(row.find("#proprice").val()); // 상품 가격을 가져옵니다.
	        var total = quantity * price; // 수량과 가격을 곱하여 총 가격을 계산합니다.
	        row.find("#proTotal").text(total); // 총 가격을 해당 요소에 표시합니다.
	        totalPrice(); // 총 가격을 업데이트합니다.
	    }
	});
	//	수량 증가
	function increaseQuantity(quantityId) {
	    var quantityElement = document.getElementById(quantityId);
	    var quantity = parseInt(quantityElement.value);
	    quantity += 1;
	    quantityElement.value = quantity;
	    if (quantityId == 'quantity1') {
	        updateAmount1();
	    } else if (quantityId == 'quantity2') {
	        updateAmount2();
	    }
	};
	//수량 감소
	function decreaseQuantity(quantityId) {
		var quantityElement = document.getElementById(quantityId);
	    var quantity = parseInt(quantityElement.value);
	    if (quantity > 1) {
	        quantity -= 1;
	        quantityElement.value = quantity;
	        if (quantityId == 'quantity1') {
	            updateAmount1();
	        } else if (quantityId == 'quantity2') {
	            updateAmount2();
	        }
	    };
	};
	//@@@@@@@@@@@@@@@@@@2	
</script>
</html>