<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/mypage.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"></script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="myWrap">
		<div id="side">
			<p>b001님 로그인 상태입니다</p>
			<p class="p_img"><img src="https://cdn2.iconfinder.com/data/icons/green-2/32/expand-color-web2-23-256.png" alt="" ></p>
			<ul class="myMenu">
				<li><a href="/mypage/memDetail.do">회원정보</a></li>
				<li><a href="/myVolReserv.do">봉사 내역</a></li>
				<li><a href="/volWish.do">관심 봉사</a></li>
				<li><a href="/approve.do">봉사 승인</a></li>
				<li><a href="/myVolList.do">봉사글 작성 내역</a></li>
				<li><a href="/myUserClass.do">재능기부 현황</a></li>
				<li><a href="/myDonate.do">후원 내역</a></li>
				<li><a href="/myQna.do">Q&A</a></li>
				<li><a href="/myNotice.do">공지사항</a></li>
			</ul>
		</div>
	
		<div id="content">
			<h1 class="title">마이페이지<p>
			My Page
			</p></h1>
			<div class="mycon" id="mycon1">1</div>
			<div class="mycon" id="mycon2">2</div>
			<div class="mycon" id="mycon3">3</div>
			<div class="mycon" id="mycon4">4</div>		
		</div>
	</div>
</body>
<script>
$(document).ready(function(){
	$('.menu_wrap').hide();
	$('.gnbmenu').mouseover(function(){
		$('.menu_wrap').slideDown();
	});
	$('.menu_wrap').mouseout(function(){
		$('.menu_wrap').hide();
	});
	
	
	$('#side').mouseover(function(){
		$('#side').css({"left":"0","transition":"0.4s"});
	});
	$('#side').mouseout(function(){
		$('#side').css({"left":"0","transition":"0.4s"});
	});
});
</script>
</html>