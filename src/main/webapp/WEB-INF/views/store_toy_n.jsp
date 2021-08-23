<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재밌겠냥</title>
<link href="resources/CSS/HC_store.css" rel="stylesheet" type="text/css"/>
<%-- <%String id = (String)session.getAttribute("user_id");%> --%>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<%-- <script>
$(function(){
	$(".logout_text").click(function(){
		location.href = "LogOut.jsp";
		<%
			if(id!=null){%>
				alert('로그아웃 되었습니다! 다음에 또 오세요!')
				location.href = "HCController?command=storemain";
			<%}else{%>
				alert('뭐가 문제지...')
			<%}%>
	});
	
});
</script> --%>
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
	<div class="bestPd">
		<div class="fl showOrderbyPd">
			<b>재밌겠냥 (신상품순)</b>
		</div>
		<div class="salesOrNew">
			<b>신상품순</b>&nbsp;|&nbsp;<a href="storetoy">인기순</a>
		</div>
	</div>
	<div class="showThreePd divCenter">
		<c:forEach var="p" items="${pdList}">
			<div class="showOnePd fl">
			<div class="pdImgDiv">
				<a href="showOnePd?id=${p.id }"><img src="resources/Images/${p.photo[0]}.jpg" class="scale pdPicImg"/></a>
			</div>
				<h2><span class="textDark">재밌겠냥</span></h2>
				<h1><a href="showOnePd?id=${p.id }">${p.name } </a>
				</h1><h3>${p.explain }</h3>
				<script>
					document.write(String("<h2 class=\"fl\" style=\"margin-top: 10px;\">"+${p.price}).replace(/\B(?=(\d{3})+(?!\d))/g, ',')+" 원</h2>");
				</script>
				<div class="showStars" style="float:right;">
					<c:forEach varStatus="vs" begin="1" end="5" step="1">
						<c:choose>
						    <c:when test="${p.score>=vs.count}">
						        <a href="showReview?id=${p.id }"><img src="resources/Images/rvStar.png" class="fl starImg"/></a>
						    </c:when>
						    <c:when test="${p.score>vs.count-1&&p.score<vs.count}">
						        <a href="showReview?id=${p.id }"><img src="resources/Images/halfStar.png" class="fl starImg"/></a>
						    </c:when>
						    <c:otherwise>
						        <a href="showReview?id=${p.id }"><img src="resources/Images/rvstar2.png" class="fl starImg"/></a>
						    </c:otherwise>
						</c:choose>
					</c:forEach>
					<a href="showReview?id=${p.id }" style="line-height: 49px;">&nbsp; (${p.cnt })</a>	
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="nomorePd">
		<button id="morePdbtn"style="width:100%; height:100%;" onclick="next_load_t()">
			상품 더 보기
		</button>
	</div>
</body>
</html>