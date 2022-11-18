<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	MemberVO memVo = (MemberVO) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript"></script>
<style>
div {
	border: 1px solid olivedrab;
}

#side, #content {
	float: left;
	height: 85vh;
}

#side {
	width: 25%;
}

#content {
	width: 74%;
}
</style>
</head>
<body>
	<h1>온(溫:ON)</h1>
	<div id="side">
		<div id="memDetail" class="memDetail">
			<a href="/mypage/memDetail.do?memId=<%=memVo.getMemId()%>">회원정보</a>
		</div>
		<div id=class="">
			<a href="/myVolReserv.do">봉사내역</a>
		</div>
		<div id=class="">
			<a href="/myUserClass.do">재능기부현황</a>
		</div>
		<div id=class="">
			<a href="/myDonate.do">후원내역</a>
		</div>
		<div id=class="">
			<a href="/">Q&A</a>
		</div>
	</div>

	<div id="content">내용</div>

</body>