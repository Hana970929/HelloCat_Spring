<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어 홈</title>
<script>
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	function change() {
		ori_price = ${pdList.price};
		mul = $("#quantity").val();
		mul = Number(mul);
		multi_price = mul*ori_price;
		multi_price = String(multi_price).replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$("#price").text(multi_price+" 원");
	}
	function count(type) {
		num = $("#quantity").val();
		num = Number(num);
		if(type=="plus") {
			$("#quantity").val(num+1);
			change();
		} else if(type=="minus"&&num>1) {
			$("#quantity").val(num-1);
			change();
		}
	}
	function buyOrCart(type) {
		num = $("#quantity").val();
		num = Number(num);
		if(type=="cart") {
			location.href="HCController?command=insertToCart&pdid=${pdid}&quantity="+num;
		} else if(type=="buy") {
			location.href="HCController?command=buyProduct&buyNow=yes&${pdid}="+num;
		}		
	}
</script>
<script>
  $(document).ready(function(){
	  $('.slider').bxSlider({ // 클래스명 주의!
	        auto: true, // 자동으로 애니메이션 시작
	        speed: 500,  // 애니메이션 속도
	        pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
	        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
	        pager: true // 페이지 표시 보여짐
	    });
	  /* var cart = ${cart};
	  console.log(cart);
	  if(cart!=0) {
		  $("#addToCartBtn").prop("disabled", true);
		  $("#addToCartBtnDiv").append("<h4 style='color:#866744;'>이미 장바구니에 담긴 상품입니다.</h4>");
	  } */
	  $("#price").text(String(${pdList.price}).replace(/\B(?=(\d{3})+(?!\d))/g, ',')+" 원");
  });
</script>
<link href="resources/CSS/HC_store.css" rel="stylesheet" type="text/css"/>
<%String id = (String)session.getAttribute("user_id");%>
<script>
$(function(){
	$(".logout_text").click(function(){
		location.href = "LogOut";
		<%
			if(id!=null){%>
				alert('로그아웃 되었습니다! 다음에 또 오세요!')
				location.href = "storemain";
			<%}else{%>
				alert('뭐가 문제지...')
			<%}%>
	});
	
});
</script>
</head>
<body bgcolor="#f1e6d3">
	<div class="basic">
		<div class="textCenter divCenter firstline">
			<div class="logo">
				<a href="storemain">
					<img src="resources/Images/logo.png" width="270px"/>
				</a>
			</div>
			<div class="fl comSt">
				<a href="Board_Main"><img src="resources/Images/community.png" class="menuImg"/></a>
			</div>
			<div class="fl comSt">
				<a href="storemain"><img src="resources/Images/store.png" class="menuImg"/></a>
			</div>
			<div class="fl searchbar">
				<form action="">
					<label for="input1">
					</label><input type="text" id="input1" name="search" class="search" placeholder=" 통합검색"/>
					<input type="submit" class="btn_search" alt="search" value=""/>
				</form>
			</div>
			<div class="fl cart">
				<a href="showcart"><img src="resources/Images/cart.png" class="cartImg"/></a>
			</div>
			<c:if test="${!empty id}">
				<div class="fl comStId">
					<div class = "comStId2">
						<a class = "logout_text"><img href = "logout.jsp" class = "shit" src = "resources/Images/logout.png"></a>
					</div>	
				</div>
			</c:if>
			<c:if test="${empty id}">	
				<div class="fl comSt">
					<a href="Login"><img src="resources/Images/login.png" class="menuImg"/></a>
				</div>
				<div class="fl comSt">
					<a href="Join"><img src="resources/Images/join.png" class="menuImg"/></a>
				</div>
			</c:if>
		</div>
		<div class="bgDark secondLine">
			<div class="fl storeHome">
				<a href="storemain"><img src="resources/Images/storehome.png" class="storeMenuImg"/></a>
			</div>
			<div class="fl storeMenu">
				<a href="storefood"><img src="resources/Images/yumyum.png" class="storeMenuImg"/></a>
			</div>
			<div class="fl storeMenu">
				<a href="storetoy"><img src="resources/Images/play.png" class="storeMenuImg"/></a>
			</div>
			<div class="fl storeMenu">
				<a href="storegoods"><img src="resources/Images/good.png" class="storeMenuImg"/></a>
			</div>
			<div class="footprint">
				<img src="resources/Images/footprint.png" class="footPrintImg">
			</div>
		</div>
	</div>
	<!-- 여기까지가 기본 -->
	<div class="viewGoodsDiv">
		<div class="slider">
			<c:forEach var="dto" items="${pdList.photo }">
				<img src="resources/Images/${dto }.jpg" class="goodsImg"/>
			</c:forEach>
		</div>
		<div class="fl goodsInfo">
			<div class="goodsName">
				<p>${pdList.name}</p>
			</div>
			<div class="fl showStars">
				<c:forEach varStatus="vs" begin="1" end="5" step="1">
					<c:choose>
					    <c:when test="${pdList.score>=vs.count}">
					        <a href="showReview?id=${p.id }"><img src="resources/Images/rvStar.png" class="fl starImg"/></a>
					    </c:when>
					    <c:when test="${pdList.score>vs.count-1&&pdList.score<vs.count}">
					        <a href="showReview?id=${pdList.id }"><img src="resources/Images/halfStar.png" class="fl starImg"/></a>
					    </c:when>
					    <c:otherwise>
					        <a href="showReview?id=${pdList.id }"><img src="resources/Images/rvstar2.png" class="fl starImg"/></a>
					    </c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
			<div class="fl showscore">
				<span style="line-height: 43px;"> ( ${pdList.score} / 5.0 )</span>			
			</div>
			<div class="goodsExplain">
				<p>${pdList.explain}</p>
			</div>
			<div class="diliveryPrice">
				<ul class="goodsUlli">
					<li>
					<p>택배 배송비 : 2,500원</p>
					</li>
					<li class="goodsLi">
					<input type='button' class="pmbutton" onclick='count("minus")' value='-'/>	    			
					<input type="text" name="quantity" class="selectQuantity" id="quantity" value="1"/> 개
					<input type='button' class="pmbutton" onclick='count("plus")' value='+'/>
					</li>
				</ul>
			</div>
			<div class="goodsPrice">
				<p id="price">${pdList.price} 원</p>
			</div>
			<div class="fl twoBtnDiv" id="addToCartBtnDiv">
				<button type="button" onClick='return buyOrCart("cart")' class="twoBtn" id="addToCartBtn">
					장바구니
				</button>
			</div>
			<div class="fl twoBtnDiv">
				<button type="button" onClick='return buyOrCart("buy")' class="twoBtn"
				style="margin-left:50px;">
					구매하기
				</button>
			</div>
		</div>
	</div>
</body>
</html>
