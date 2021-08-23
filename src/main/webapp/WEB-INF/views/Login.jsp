<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="resources/CSS/HC_community.css">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
<%String id = (String)session.getAttribute("user_id");%>
$(function() {
	$(".logout_text").click(function(){
		<%
			if(id!=null){%>
				alert('로그아웃 되었습니다! 다음에 또 오세요!')
				location.href = "logout";
			<%}else{%>
				alert('뭐가 문제지...')
			<%}%>
	});
	var prePage = document.referrer;
	$("#previousPage").val(prePage);
});
	
	
</script>
</head>
<body>
<body bgcolor="#f1e6d3">
	<div class="basic">
		<div class="textCenter divCenter firstline">
			<div class="logo dib">
				<a href="storemain">
					<img class = "HClogo" src="resources/Images/logo.png" width="270px"/>
				</a>
			</div>
			<div class = "leftcomSt">
				<div class="fl comSt">
					<a href="Board_Main"><img src="resources/Images/community.png" class="menuImgC"/></a>
				</div>
				<div class="fl comSt">
					<a href="storemain"><img src="resources/Images/store.png" class="menuImg"/></a>
				</div>
			</div>
				<div class="fl searchbar">
				<form action="http://localhost:9090/HelloCat/SearchResult.html">
					<label for="input1">
					</label><input type="text" id="input1" name="search" class="search" placeholder=" 통합검색"/>
					<input type="submit" class="btn_search" name="submit" alt="search" value="">
				</form>
			</div>
			<div class="fl cart">
				<a href="showcart"><img src="resources/Images/cart.png" class="cartImg"/></a>
			</div>
			<%if(id!=null){%>
				<div class="fl comStId">
					<div class = "comStId2">
						<a class = "logout_text"><img class = "shit" src = "resources/Images/logout.png"></a>
					</div>	
				</div>
			<%}else{ %>	
				<div class="fl comSt">
					<a href="HCController?command=Login"><img src="resources/Images/login.png" class="menuImg"/></a>
				</div>
				<div class="fl comSt">
					<a href="HCController?command=Join"><img src="resources/Images/join.png" class="menuImg"/></a>
				</div>
			<%} %>
		</div>
		<div class="bgDark secondLine">
			<div class="fl community_home">
				<a href="HCController?command=Board_Main"><img src="resources/Images/community_home.png" class="img_community_home"/></a>
			</div>
			<div class="fl comunity_menu">
				<a href="HCController?command=Letter"><img src="resources/Images/줄냥쉑.png" class="img_community_letter"/></a>
			</div>
			<div class="fl comunity_menu">
				<a href="HCController?command=Photo"><img src="resources/Images/컷냥쉑.png" class="img_community_photo"/></a>
			</div>
			<div class="footprint">
				<img src="resources/Images/footprint.png" class="footPrintImg">
			</div>
		</div>
	</div>
	<div class = "content">
			<div class = "login">
				<form name = frm action = "login" method="post">
					<input type = "text" name = "id" class = "id" placeholder = "아이디를 입력해주세요" ><br/>
					<input type = "password" name = "pw" class = "pw" placeholder = "비밀번호를 입력해주세요"><br/>
					<input type="hidden" name="url" id="previousPage">
					<button type = "submit" name = "command" value = "Login_check" class = "loginbtn"><b><span style = "font-family:sans; font-size:20px;">Login</span></b></button>
				</form>
			</div>
				<img src = "resources/Images/편안.png" class = "cat1">
				<img src = "resources/Images/호다닥.png" class = "cat2">
		</div>
</body>
</html>