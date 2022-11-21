<%@page import="userClass.vo.UsrClsVO"%>
<%@page import="member.vo.MemberVO"%>
<%@page import="volunteer.vo.ReservationVO"%>
<%@page import="common.VolStatus"%>
<%@page import="common.VolCategory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 	String memId = ((MemberVO) session.getAttribute("loginUser")).getMemId();
	List<UsrClsVO> clsList = (List<UsrClsVO>) request.getAttribute("list");
// 	int perPage = (int) request.getAttribute("perPage");
// 	int startPage = (int) request.getAttribute("sPage");
// 	int endPage = (int) request.getAttribute("ePage");
// 	int totalPage = (int) request.getAttribute("ttPage");
// 	int currentPage = (int) request.getAttribute("cPage");

// 	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
// 	session.removeAttribute("msg");	// 세션은 계속 유지되니 속성값 삭제

// 	String category= request.getParameter("category") == null? "카테고리 선택" : request.getParameter("category");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지(재능 기부 내역)</title>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/mypage.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../header.jsp"%>
<%@ include file="side.jsp"%>
<div id="wrapper">
	<h1 class="title">재능 기부 현황<p>Class</p></h1>
	<ul class="wrapper_inner">
		<%
			for (int i = 0; i < clsList.size(); i++) {
		%>
		<div class="mylist">
			<a href="<%=request.getContextPath()%>/UsrClsDetail.do?classId=<%=clsList.get(i).getClassId()%>">[<%=clsList.get(i).getClassId()%>]</a>
			<p><span>[클래스명]</span>&nbsp;&nbsp;<%=clsList.get(i).getClassTitle()%></p>
			<p><span>[클래스 카테고리]</span>&nbsp;&nbsp;<%=clsList.get(i).getClsCtId()%></p>
			<p><span>[클래스 조회수]</span>&nbsp;&nbsp;<%=clsList.get(i).getClassViews()%></p>
		</div>
		<%
			}
		%>
	</ul>
</div>
<script>
$(document).ready(function(){
	$('.menu_wrap').hide();
	$('.gnbmenu').mouseover(function(){
		$('.menu_wrap').slideDown();
	});
	$('#wrapper').mouseover(function(){
		$('.menu_wrap').hide();
	});
});
</script>
</body>
</html>