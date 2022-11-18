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
<%@ include file="./header.jsp"%>
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
	<div class="scrollbox">
		<p><img src="https://cdn2.iconfinder.com/data/icons/css-vol-3/24/scroll-v-256.png" alt=""></p>
		<p>마우스를 스크롤해주세요</p>
	</div>
	<div class="c_content">
		<div class="c_content_inner">
			<h2 class="vc_title">봉사 프로그램</h2>
			<ul>
				<li>
					<a href="#" >
						<span>CATEGORY</span>
						<img src="https://img.seoul.co.kr/img/upload/2021/08/24/SSI_20210824162911_O2.jpg">
						<h4>벽화 그리기 캠페인</h4>
						<p>다 함께 그리는 벽화 동네를 예쁘게 꾸며요...저희 동네도 예쁘게 꾸며주실래요</p>
					</a>
				</li>
				<li>
					<a href="#">
						<span>CATEGORY</span>
						<img src="https://file.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg">
						<h4>연탄 나르기 봉사활동</h4>
						<p>연탄은 사랑입니다. 근데 일산화탄소 중독되면 위험하니까 조심조심해서 피우세요</p>
					</a>
				</li>
				<li>
					<a href="#">
						<span>CATEGORY</span>
						<img src="https://img.kr.news.samsung.com/kr/wp-content/uploads/2019/07/0710oneweek1.jpg">
						<h4>대덕인재개발원 봉사활동</h4>
						<p>개발하기 바쁜데 봉사활동까지 해야하는 현실... 스카이캐슬 대덕인재개발원 버전..</p>
					</a>
				</li>
				<li class="last">
					<a href="#" class="first">
						<span>CATEGORY</span>
						<img src="http://www.queen.co.kr/news/photo/201908/316305_54777_4833.png">
						<h4>어르신들 대신해서 김장 담그기</h4>
						<p>김장 이제 피할 수 없는 1년 중 미션. 울엄마 김장 담글때도 맨날 도망갔는데 이제 시어머니가 부르면 달려가야함</p>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="v_content">
		<div class="v_row">
			<h2 class="vc_title">재능 기부 클래스</h2>
			<div class="left" data-aos="fade-up">
				<a href=""> <img
					src="https://www.sh1365.or.kr/upload/editordata/_2020%EC%96%B8%EC%A0%9C%EB%82%98%EC%9E%90%EC%9B%90%EB%B4%89%EC%82%AC_%ED%99%8D%EB%B3%B4%EB%AC%BC1jpg4.jpg" alt=""></a>
				<span>VOLUNTEER</span>
				<h3>주말 농장 봉사활동</h3>
				<p>봉사활동 참여자를 모집합니다</p>
				<p>November 10, 2022</p>
			</div>
			<div class="right" data-aos="fade-up">
				<a href=""><img
					src="https://www.1365.go.kr/upload/se2/3ce28c02-291b-45ca-a40c-4f3ebc65dd72..jpg"
					alt=""></a>
				<span>VOLUNTEER</span>
				<h3>주말 농장 봉사활동</h3>
				<p>봉사활동 참여자를 모집합니다</p>
				<p>November 10, 2022</p>
			</div>
		</div>
		<div class="v_row">
			<div class="left" data-aos="fade-up">
				<a href=""> 
					<img
					src="http://garmuri.com/files/attach/images/169/333/159/3f0060c6d522bc49ede8ce75d187cc53.jpg" 
					alt="">
				</a>
				<span>VOLUNTEER</span>
				<h3>주말 농장 봉사활동</h3>
				<p>봉사활동 참여자를 모집합니다</p>
				<p>November 10, 2022</p>
			</div>
			<div class="right" data-aos="fade-up">
				<a href=""><img
					src="https://www.ktng.com/imgEditorViewer?fpath=CM0019/190417_1.jpg"
					alt=""></a>
				<span>VOLUNTEER</span>
				<h3>주말 농장 봉사활동</h3>
				<p>봉사활동 참여자를 모집합니다</p>
				<p>November 10, 2022</p>
			</div>
		</div>
		<div class="v_row">
			<div class="left" data-aos="fade-up">
				<a href=""><img
					src="https://cb1365.net:40048/new/data/upload/aion_cs_notice/%EB%B3%84%EB%B3%84%EC%9E%90%EC%9B%90%EB%B4%89%EC%82%AC%20%ED%8F%AC%EC%8A%A4%ED%84%B0_%EA%B2%8C%EC%8B%9C%EC%9A%A9(1).jpg" 
					alt=""></a>
				<span>VOLUNTEER</span>
				<h3>주말 농장 봉사활동</h3>
				<p>봉사활동 참여자를 모집합니다</p>
				<p>November 10, 2022</p>
			</div>
			<div class="right" data-aos="fade-up">
				<a href=""><img
					src="https://www.ktng.com/imgEditorViewer?fpath=CM0019/190417_1.jpg"
					alt=""></a>
				<span>VOLUNTEER</span>
				<h3>주말 농장 봉사활동</h3>
				<p>봉사활동 참여자를 모집합니다</p>
				<p>November 10, 2022</p>
			</div>
		</div>
	</div>
	<footer id="ft">
		<p class="">COPYRIGHT&copy;대덕인재개발원 202208월반 2조 세상에공짜없조 중간프로젝트</p>
	</footer>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
	$(document).ready(function(){
		$('.menu_wrap').hide();
		$('.gnbmenu').mouseover(function(){
			$('.menu_wrap').slideDown();
		});
		$('.visual').mouseover(function(){
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
