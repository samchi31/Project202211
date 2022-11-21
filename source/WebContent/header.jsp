<%@ page language="java" pageEncoding="UTF-8"%>
<!-- header -->
<header>
	<div class="hd_wrap">
		<a href="#none">
		<h1 class="logo">
			<img src="http://kalch413.dothome.co.kr/images/on_logo.png" alt="로고">
		</h1>
		</a>
		<nav class="gnb">
			<ul class="gnbmenu">
				<li>봉사</li>
				<li>후원</li>
				<li>재능기부</li>
				<li>커뮤니티</li>
				<li>마이페이지</li>
				<li><a href="/member/LoginForm.jsp" class="loginbt">로그인</a></li>
			</ul>
		</nav>
	</div>
</header>
<!-- //header -->
<!-- inside -->
<div class="menu_wrap">
	<ul>
		<li><a href="/member/LoginForm.jsp">봉사 프로그램</a> <a href="/member/LoginForm.jsp">봉사 프로그램 등록</a></li>
		<li><a href="/member/LoginForm.jsp">후원 목록</a> <a href="/member/LoginForm.jsp"></a></li>
		<li><a href="/member/LoginForm.jsp">재능기부 클래스</a> <a href="">재능기부 등록</a></li>
		<li><a href="/member/LoginForm.jsp">공지사항</a> <a href="/member/LoginForm.jsp">문의사항</a> </li>
		<li><a href="/member/LoginForm.jsp">마이페이지</a></li>
	</ul>
</div>
<!-- inside -->
<script>
$(document).ready(function(){
    $('.menu_wrap a').click(function() {
        var result = confirm('사이트를 이용하시려면 회원가입 하셔야합니다. 가입하시겠습니까?');

        if(result) {
           //yes
            location.replace('/member/LoginForm.jsp');
        } else {
            //no
        	 return false;
        }
    });
});
</script>