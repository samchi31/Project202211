<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>온:ON (봉사활동 플랫폼)</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/common.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
</head>
<body>
	<!-- header -->
	<header>
		<div class="hd_wrap">
			<a href="index.html">
			<h1 class="logo">
				<img src="http://kalch413.dothome.co.kr/images/on_logo.png" alt="로고">
			</h1>
			</a>
			<nav class="gnb">
				<ul class="gnbmenu">
					<li>소개</li>
					<li>봉사</li>
					<li>후원</li>
					<li>재능기부</li>
					<li>커뮤니티</li>
					<li>마이페이지</li>
					<li><a href="#" class="loginbt">로그인</a></li>
				</ul>
				
			</nav>
		</div>
	</header>
	<!-- //header -->
	<!-- inside -->
	<div class="menu_wrap">
		<ul>
			<li><a href="/funding/List.do">메뉴1</a> <a href="">메뉴1</a> <a href="">메뉴1</a></li>
			<li><a href="">메뉴2</a> <a href="">메뉴1</a> <a href="">메뉴1</a></li>
			<li><a href="">메뉴3</a> <a href="">메뉴1</a> <a href="">메뉴1</a></li>
			<li><a href="">메뉴1</a> <a href="">메뉴1</a> <a href="">메뉴1</a></li>
			<li><a href="">메뉴1</a> <a href="">메뉴1</a> <a href="">메뉴1</a></li>
			<li></li>
		</ul>
	</div>
	<!-- inside -->
	<div class="visual">
		<div class="obj_area">
			<img id="ob1" class="obImg" src="http://kalch413.dothome.co.kr/images/obj1.png" alt="" >
			<img id="ob2" class="obImg" src="http://kalch413.dothome.co.kr/images/obj2.png" alt="" onmouseover="ChnImg(this)" onmouseout="BackImg(this)">
			<img id="ob3" class="obImg" src="http://kalch413.dothome.co.kr/images/obj3.png" alt="">
			<img id="ob4" class="obImg" src="http://kalch413.dothome.co.kr/images/obj4.png" alt="">
			<img id="ob5" class="obImg" src="http://kalch413.dothome.co.kr/images/obj5.png" alt="" onmouseover="ChnImg(this)" onmouseout="BackImg(this)">
			<img id="ob6" class="obImg" src="http://kalch413.dothome.co.kr/images/obj6.png" alt="" onmouseover="ChnImg(this)" onmouseout="BackImg(this)">
			<img id="ob7" class="obImg" src="http://kalch413.dothome.co.kr/images/obj7.png" alt="">
			<img id="ob8" class="obImg" src="http://kalch413.dothome.co.kr/images/obj8.png" alt="" onmouseover="ChnImg(this)" onmouseout="BackImg(this)">
			<img id="ob9" class="obImg" src="http://kalch413.dothome.co.kr/images/obj9.png" alt="" onmouseover="ChnImg(this)" onmouseout="BackImg(this)">
			<img id="ob10" class="obImg" src="http://kalch413.dothome.co.kr/images/obj10.png" alt="" onmouseover="ChnImg(this)" onmouseout="BackImg(this)">
		</div>
	</div>
	<style>
.c_content {
	width: 100%;
	margin:10% 0
}

.c_content_inner {
	dispaly: block;
	margin: 0 auto; 
	position: relative;
	overflow: hidden;
	list-style: none;
	width: 80%;
}

.c_content_inner a {
	display: flex;
	float: left;
	justify-content: space-around;
	width: 22%;
	margin-right:2%;
}

.c_content_inner a.first {margin-right:0}

.c_content_inner a img {
	display: block;
	width: 100%;
}
</style>
	<div class="c_content">
		<h2 class="f_title2">재능기부 클래스</h2>
		<div class="c_content_inner">
			<a href="#" class="first"><img src="https://campaign-cdn.pstatic.net/0/campaign/2022/06/channelsearch/img_v4/main/img_main_content_10.jpg"></a>
			<a href="#" ><img src="https://campaign-cdn.pstatic.net/0/campaign/2022/06/channelsearch/img_v4/main/img_main_content_10.jpg"></a>
			<a href="#" ><img src="https://campaign-cdn.pstatic.net/0/campaign/2022/06/channelsearch/img_v4/main/img_main_content_10.jpg"></a>
			<a href="#" ><img src="https://campaign-cdn.pstatic.net/0/campaign/2022/06/channelsearch/img_v4/main/img_main_content_10.jpg"></a>
		</div>
	</div>
	<!-- <div class="container">
		<div class="v_content">
			<div class="row">
				<div class="left" data-aos="fade-up">
					<a href=""> <img
						src="http://kalch413.dothome.co.kr/images/obj4.png"
						alt=""></a>
					<spa>VOLUNTEER</spa>
					<h3>주말 농장 봉사활동</h3>
					<p>봉사활동 참여자를 모집합니다</p>
					<p>November 10, 2022</p>
				</div>
				<div class="right" data-aos="fade-up">
					<a href=""><img
						src="https://campaign-cdn.pstatic.net/0/campaign/2022/06/channelsearch/img_v4/main/img_main_content_10.jpg"
						alt=""></a>
					<spa>VOLUNTEER</spa>
					<h3>주말 농장 봉사활동</h3>
					<p>봉사활동 참여자를 모집합니다</p>
					<p>November 10, 2022</p>
				</div>
			</div>
			<div class="row">
				<div class="left" data-aos="fade-up">
					<a href=""> <img
						src="https://campaign-cdn.pstatic.net/0/campaign/2022/06/channelsearch/img_v4/main/img_main_content_10.jpg"
						alt=""></a>
					<spa>VOLUNTEER</spa>
					<h3>주말 농장 봉사활동</h3>
					<p>봉사활동 참여자를 모집합니다</p>
					<p>November 10, 2022</p>
				</div>
				<div class="right" data-aos="fade-up">
					<a href=""><img
						src="https://campaign-cdn.pstatic.net/0/campaign/2022/06/channelsearch/img_v4/main/img_main_content_10.jpg"
						alt=""></a>
					<spa>VOLUNTEER</spa>
					<h3>주말 농장 봉사활동</h3>
					<p>봉사활동 참여자를 모집합니다</p>
					<p>November 10, 2022</p>
				</div>
			</div>
			<div class="row">
				<div class="left" data-aos="fade-up">
					<a href=""> <img
						src="https://campaign-cdn.pstatic.net/0/campaign/2022/06/channelsearch/img_v4/main/img_main_content_10.jpg"
						alt=""></a>
					<spa>VOLUNTEER</spa>
					<h3>주말 농장 봉사활동</h3>
					<p>봉사활동 참여자를 모집합니다</p>
					<p>November 10, 2022</p>
				</div>
				<div class="right" data-aos="fade-up">
					<a href=""><img
						src="https://campaign-cdn.pstatic.net/0/campaign/2022/06/channelsearch/img_v4/main/img_main_content_10.jpg"
						alt=""></a>
					<spa>VOLUNTEER</spa>
					<h3>주말 농장 봉사활동</h3>
					<p>봉사활동 참여자를 모집합니다</p>
					<p>November 10, 2022</p>
				</div>
			</div>
		</div>
	</div>
	 -->
	<footer id="ft"> </footer>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
	$(document).ready(function(){
		$('.menu_wrap').hide();
		$('.gnbmenu').mouseover(function(){
			$('.menu_wrap').slideDown();
		});
		$('.menu_wrap').mouseout(function(){
			$('.menu_wrap').hide();
		});
	});
	
	
   AOS.init();  // 초기화 선언 필수
   
   function ChnImg(obj){
	   
	   if( obj.id == "ob5"){
		document.getElementById("ob5").src = "http://kalch413.dothome.co.kr/images/obj5_on.png";
		obj.style.transition='0.2s';
	   }else if( obj.id == "ob6" ){
		   document.getElementById("ob6").src = "http://kalch413.dothome.co.kr/images/obj6_on.png";	   
		   obj.style.transition='0.2s';
	   }else if( obj.id == "ob8" ){
		   document.getElementById("ob8").src = "http://kalch413.dothome.co.kr/images/obj8_on.png";	   
	   }else if( obj.id == "ob9" ){
		   document.getElementById("ob9").src = "http://kalch413.dothome.co.kr/images/obj9_on.png";
	   }else if( obj.id == "ob10" ){
		   document.getElementById("ob10").src = "http://kalch413.dothome.co.kr/images/obj10_on.png";
	   }else if( obj.id == "ob2" ){
		   obj.style.transform='rotate(15deg)';
	   }
   }
   
   function BackImg(){
	 document.getElementById("ob5").src = "http://kalch413.dothome.co.kr/images/obj5.png";
	 document.getElementById("ob6").src = "http://kalch413.dothome.co.kr/images/obj6.png";
	 document.getElementById("ob8").src = "http://kalch413.dothome.co.kr/images/obj8.png";
	 document.getElementById("ob9").src = "http://kalch413.dothome.co.kr/images/obj9.png";
	 document.getElementById("ob10").src = "http://kalch413.dothome.co.kr/images/obj10.png";
	 document.getElementById("ob2").style.transform='rotate(0deg)';
	}

</script>
</body>
</html>
