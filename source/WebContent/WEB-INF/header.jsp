<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@page import="member.vo.InsVO"%>
<%@page import="member.vo.MemberVO"%>

<%
	MemberVO memVo = (MemberVO) session.getAttribute("loginUser");
%>
<!-- header -->
<header>
	<p>로그인 된 화면</p>
	<div class="hd_wrap">
		<a href="#none">
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
				<li><a href="/member/logout.do" class="loginbt">로그아웃</a></li>
			</ul>
		</nav>
	</div>
</header>
<!-- //header -->
<!-- inside -->
<div class="menu_wrap">
	<ul>
		<li><a href="/funding/List.do">온프로젝트 소개</a></li>
		<li><a href="/funding/List.do">봉사 프로그램</a><a href="">봉사프로그램 후기</a></li>
		<li><a href="/funding/List.do">후원 목록</a> <a href="">메뉴1</a> <a href="">메뉴1</a></li>
		<li><a href="/funding/List.do">재능기부 클래스</a> <a href="">메뉴1</a> <a href="">메뉴1</a></li>
		<li><a href="">공지사항</a> <a href="">문의사항</a></li>
		<li><a href="<%=request.getContextPath()%>/mypage/detail.do?<%=memVo.getMemId()%>">마이페이지</a></li>
	</ul>
</div>
<!-- inside -->