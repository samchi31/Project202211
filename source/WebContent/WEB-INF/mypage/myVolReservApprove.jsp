<%@page import="volunteer.vo.ReservationVO"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	List<ReservationVO> approveList = (List<ReservationVO>)request.getAttribute("approveList");
	String memId = ((MemberVO) session.getAttribute("loginUser")).getMemId();
%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지(봉사승인)</title>
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
	<h1 class="title">봉사 승인<p>Approve</p></h1>
	<ul class="wrapper_inner">
		<%
		int size = approveList.size();
		if (size > 0) {
			for (int i = 0; i < size; i++) {
		%>
		<form>
			<div class="mylist">
				<input type="hidden" name="reservId" value="<%= (approveList.get(i).getReservId()) %>">
				<p><span>[예약 번호]</span>&nbsp;&nbsp;<%= (approveList.get(i).getReservId()) %></p>
		        <a href="volDetail.do?volId=<%= (approveList.get(i).getVolId()) %>">
				<p><span>[예약 봉사]</span>&nbsp;&nbsp;<%=(approveList.get(i).getVolId())%></p>
				</a>
				<p><span>[예약한아이디]</span>&nbsp;&nbsp;<%=(approveList.get(i).getMemId())%></p>
				<p><span>[예약 날짜]</span>&nbsp;&nbsp;<%=(approveList.get(i).getReservDate()) %></p>
				<p><span>[예약 시간]</span>&nbsp;&nbsp;<%=(approveList.get(i).getReservTime()) %></p>
				<p><span>[신청 날짜]</span>&nbsp;&nbsp;<%=(approveList.get(i).getApplyDate()) %></p>
				<p><span>[취소 날짜]</span>&nbsp;&nbsp;<%=(approveList.get(i).getCancelDate()) %></p>
				<p><span>[예약 상태]</span>&nbsp;&nbsp;</p>
					<select class="form-control" id="sel1" name="rStId">
						<option><%=approveList.get(i).getrStId()%></option>
						<option>SUBMITTED</option>
						<option>WAITING</option>
						<option>CONFIRMED</option>
						<option>EXPIRED</option>
						<option>REJECTED</option>
						<option>CANCELED</option>
					</select>
				<button class="btn btn-danger" type="submit" formaction="/approve.do?reservId=<%=(approveList.get(i).getReservId())%>" formmethod="post">수정</button>
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