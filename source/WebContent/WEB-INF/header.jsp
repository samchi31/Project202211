<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@page import="member.vo.InsVO"%>
<%@page import="member.vo.MemberVO"%>
<%
	MemberVO mv = (MemberVO) session.getAttribute("loginUser");
%>
<!-- header -->
<header>
	<div class="hd_wrap">
		<a href="/index.do">
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
				<li><a href="/member/logout.do" class="loginbt">로그아웃</a></li>
			</ul>
		</nav>
	</div>
</header>
<!-- //header -->
<!-- inside -->
<div class="menu_wrap">
	<ul>
		<li><a href="/volList.do">봉사 프로그램</a></li>
		<li><a href="/funding/List.do">후원 목록</a> </li>
		<li><a href="/UsrClsList.do">재능기부 클래스</a></li>
		<li><a href="/ListNoticeController.do">공지사항</a> <a href="/ListQnaController.do">문의사항</a></li>
		<li><a href="/mypageMain.do?<%=mv.getMemId()%>">마이페이지</a></li>
	</ul>
</div>
<!-- inside -->