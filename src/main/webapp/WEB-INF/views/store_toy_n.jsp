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
<%String id = (String)session.getAttribute("user_id");%>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
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
	var page = 2; //불러올 페이지
	var data = {
			sort:'toy',
			orderBy:'sales'
	}
	function next_load_t() { 
		$.ajax({
			type:"POST",
			url:"infiniteScroll/t",
			data : {'page':page, 'data':data},
			dataType : "json",
			success: function(string) {
				var result = string.jsonArr;
				if(result.length<6) {
					for (var i=0;i<=result.length-1;i++) {
						var pd = result[i];
						var append_node = "";
						append_node += "<div class='showOnePd fl'>";
						append_node += "<div class='pdImgDiv'>";
						append_node += "<a href='HCController?command=showOnePd&id="+pd.pdid+"'><img src='Images/"+pd.photo+".jpg' class='scale pdPicImg'/></a>";
						append_node += "</div>";
						append_node += "<h2><span class='textDark'>갖고싶냥</span></h2>";
						append_node += "<h1><a href='goods_view.html'>"+pd.name+"</a>";
						append_node += "</h1><h3>"+pd.explain+"</h3>";
						append_node += "<h2 class='fl' style='margin-top: 10px;'>"+pd.s_price+"원</h2>";
						append_node += "<div class='showStars' style='float:right; width: 180px;'>";
						for(var j=1; j<=5; j++) { 
							if(j<=pd.score) {
								append_node += "<a href='HCController?command=showReview&id="+pd.pdid+"'><img src='Images/rvStar.png' class='fl starImg'/></a>";
						  }	else {
							  	append_node += "<a href='HCController?command=showReview&id="+pd.pdid+"'><img src='Images/rvstar2.png' class='fl starImg'/></a>";			
							}
						} append_node += "<a href='HCController?command=showReview&id="+pd.pdid+"' style='line-height: 49px;'> ("+pd.rvcnt+")</a>";	
						append_node += "</div>";
						append_node += "</div>";
						$('#pdcontainer').append(append_node);
					} page++;
					$("#morePdbtn").html("상품이 더 이상 없습니다.")
					$("#morePdbtn").prop("disabled", true);
				} else {
					for (var i=0;i<=result.length-1;i++) {
						var pd = result[i];
						var append_node = "";
						append_node += "<div class='showOnePd fl'>";
						append_node += "<div class='pdImgDiv'>";
						append_node += "<a href='HCController?command=showOnePd&id="+pd.pdid+"'><img src='Images/"+pd.photo+".jpg' class='scale pdPicImg'/></a>";
						append_node += "</div>";
						append_node += "<h2><span class='textDark'>갖고싶냥</span></h2>";
						append_node += "<h1><a href='goods_view.html'>"+pd.name+"</a>";
						append_node += "</h1><h3>"+pd.explain+"</h3>";
						append_node += "<h2 class='fl' style='margin-top: 10px;'>"+pd.s_price+"원</h2>";
						append_node += "<div class='showStars' style='float:right; width: 180px;'>";
						for(var j=1; j<=5; j++) { 
							if(j<=pd.score) {
								append_node += "<a href='HCController?command=showReview&id="+pd.pdid+"'><img src='Images/rvStar.png' class='fl starImg'/></a>";
						  }	else {
							  	append_node += "<a href='HCController?command=showReview&id="+pd.pdid+"'><img src='Images/rvstar2.png' class='fl starImg'/></a>";			
							}
						} append_node += "<a href='HCController?command=showReview&id="+pd.pdid+"' style='line-height: 49px;'> ("+pd.rvcnt+")</a>";	
						append_node += "</div>";
						append_node += "</div>";
						$('#pdcontainer').append(append_node);
					} page++;
				}
			},
			error: function(xhr, status, error) {
			 	}
			});
		}
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