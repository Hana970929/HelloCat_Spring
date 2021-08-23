<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String id = (String)session.getAttribute("user_id");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link href="resources/CSS/HC_store.css" rel="stylesheet" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
$(function(){
	$(".logout_text").click(function(){
		location.href = "LogOut.jsp";
		<%
			if(id!=null){%>
				alert('로그아웃 되었습니다! 다음에 또 오세요!')
				location.href = "storemain";
			<%}else{%>
				alert('뭐가 문제지...')
			<%}%>
	});
	
});
	$(function(){
		$(".check").change(function(){
			var total = 0;
			$(".check").each(function(){
				if($(this).is(":checked")) {
					price = $(this).val();
					price = Number(price);
					total += price;
				}
			});
			diliverypr = 0;
			if(total>0 && total<50000) {
				diliverypr = 2500;				
			}
			discount = total/10;
			finalprice = total-discount+diliverypr;
			finalprice = String(finalprice).replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			diliverypr = String(diliverypr).replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$("#diliv").text('(+) '+diliverypr+' 원')
			discount = String(discount).replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			total = String(total).replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$("#ttprice").text(total+' 원');
			$("#discountpr").text('(-) '+discount+' 원');		
			$("#lastPr").text(finalprice+' 원');		
			});
		$("#checkall").click(function(){
	        if($("#checkall").is(":checked")){
	            $("input[class=check]").prop("checked",true);
	        }else{
	            $("input[class=check]").prop("checked",false);
	        }
	    	});
		});
	function cartSubmit(type) {
		var formData = $("form[name=cartform]").serialize();
		if(type==1) {
			$.ajax({
				type:"get",
				url:"HCController?command=deleteFromCart",
				data:formData,
				datatype:"json",
				success:function() {
					location.reload();
					alert("삭제되었습니다.");
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+
					"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		} else {
			document.cartform.action="HCController?command=buyProduct&buynow=no";			
			document.cartform.submit();
		}
	}
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
	<form name="cartform">
	<div class="divCenter cartDiv">
		<ul>
			<li class="selectallforcart">
				<div class="hanadiv">
					<input type="checkbox" id="checkall" class="check" value="0"/>
					<label for="checkall"></label> 전체선택
				</div>
			</li>
		</ul>
		<c:forEach var="c" items="${cartList}">
			<div class="cartProduct" id="${c.pd_id }">
				<div class="fl cartCheck">
					<input type="checkbox" class="check" name="${c.name }"
					value="${c.order_price }" id="${c.name }"
					style="">
					<label for="${c.name }">
					</label>
				</div>
				<div class="fl cartPdImgDiv">
				<img src="resources/Images/${c.photo[0] }.jpg" class="cartPdImg"/>
				</div>
				<div class="fl cartExp">
					<h1 class="brown">${c.name }</h1>
					<h3 class="brown">${c.explain }</h3>
					<h3 class="brown">수량 : ${c.order_cnt }개 ( 개당 
						<script>
							document.write(String(${c.price}).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
						</script>
					 원)</h3>
				</div>
				<div class="molaaaa">
					<div class="showHowMuch">
						<h1 class="brown">상품금액</h1>
					</div>
					<div class="showThePrice" id="pd1Pr">
						<script>
							document.write("<h1>"+String(${c.price}).replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원</h1>");
						</script>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="resultTable">
		<div class="innerResult">
			<br/>
				<h1 class="brown">선택상품</h1>
			<div class="fl leftinner">
				<h2 class="brown">총 상품금액</h2>
				<h2 class="brown">총 할인 (상품금액의 10%)</h2>
				<h2 class="brown">배송비 (5만원 이상 무료)</h2>
			</div>
			<div class="fl rightinner">
				<h1 class="brown"> </h1>
				<h2 id="ttprice">0 원</h2>
				<h2 id="discountpr">0 원</h2>				
				<h2 id="diliv">0 원</h2>
			</div>
		</div>
		<div class="lastPrice">
			<div class="fl innerlast">
				<h1 class="brown">총 가격</h1>
			</div>
			<div class="fl innerlast2">
				<h2 id="lastPr">0 원</h2>
			</div>
		</div>
	</div>
	<input type="hidden" name="buyNow" value="no">
	<div class="orderBtnDiv">
		<button type="button" onClick='cartSubmit(1)' class="orderBtn">
			선택상품 삭제하기
		</button>
		<button type="submit" name="command" value="buyProduct" class="orderBtn">
			선택상품 결제하기
		</button>
	</div>
	</form>
</body>
</html>











