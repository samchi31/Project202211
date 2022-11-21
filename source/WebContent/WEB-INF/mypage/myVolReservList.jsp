<%@page import="member.vo.MemberVO"%>
<%@page import="volunteer.vo.ReservationVO"%>
<%@page import="common.VolStatus"%>
<%@page import="common.VolCategory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<ReservationVO> reservList = (List<ReservationVO>)request.getAttribute("reservList");
	String memId = ((MemberVO) session.getAttribute("loginUser")).getMemId();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지(봉사 예약 내역)</title>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/mypage.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../header.jsp"%>
<%@ include file="side.jsp"%>
<div id="wrapper">
	<h1 class="title">봉사 예약 내역<p>Reservation List</p></h1>
	<ul class="wrapper_inner">
		
		<%
		int size = reservList.size();
		if (size > 0) {
			for (int i = 0; i < size; i++) {
				// if expired, rejected, canceled면 취소 버튼 안 나오게
		%>
		<form>
			<div class="mylist">
				<input type="hidden" name="reservId" value="<%= (reservList.get(i).getReservId()) %>">
				<input type="hidden" name="memId" value="<%= (reservList.get(i).getMemId()) %>">
		         <p><span>[예약 번호]</span>&nbsp;&nbsp;<%= (reservList.get(i).getReservId()) %></p>
		         <a href="volDetail.do?volId=<%= (reservList.get(i).getVolId()) %>">
				 <p><span>[예약 봉사]</span>&nbsp;&nbsp;<%=(reservList.get(i).getVolId())%></p></a>
				 <p><span>[예약한아이디]</span>&nbsp;&nbsp;<%=(reservList.get(i).getMemId())%></p>
				 <p><span>[예약 날짜]</span>&nbsp;&nbsp;<%=(reservList.get(i).getReservDate()) %></p>
				 <p><span>[예약 시간]</span>&nbsp;&nbsp;<%=(reservList.get(i).getReservTime()) %></p>
				 <p><span>[신청 날짜]</span>&nbsp;&nbsp;<%=(reservList.get(i).getApplyDate()) %></p>
				 <p><span>[취소 날짜]</span>&nbsp;&nbsp;<%=(reservList.get(i).getCancelDate()) %></p>
				 <p><span>[예약 상태]</span>&nbsp;&nbsp;<%=(reservList.get(i).getrStId()) %></p>
				
				<button type="submit" class="btn btn-danger" formaction="/volReservUpdate.do?reservId=<%=(reservList.get(i).getReservId())%>" formmethod="get">수정</button>
				<button type="submit" class="btn btn-primary" formaction="/volReservCancel.do?reservId=<%=(reservList.get(i).getReservId())%>" formmethod="get">취소</button>
			</div>
		</form>
		<%
				}
			} else {
		%>
				조회된 데이터가 없습니다.
		<%
			}
		%>
		<button class="list_bt btn btn-default" type="button" onclick="location.href='/volList.do'">봉사 프로그램 목록</button>
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