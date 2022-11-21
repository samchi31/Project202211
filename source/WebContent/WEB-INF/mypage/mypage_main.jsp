<%@page import="donate.vo.DonateVO"%>
<%@page import="volunteer.vo.ReservationVO"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
  List<ReservationVO> reservList = (List<ReservationVO>)request.getAttribute("reservList");
  List<DonateVO> donateList = (List<DonateVO>) request.getAttribute("DonateList");
  MemberVO memberVo = ((MemberVO) session.getAttribute("loginUser"));
%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
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
	
		<div id="content">
			<h1 class="title">마이페이지<p>
			My Page
			</p></h1>
			<!-- 회원 로그인 정보 -->
			<div class="mycon" id="mycon1">
				<h3>로그인 정보</h3>
				<p class="profile"><span><img src="https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/bear_russian_animal_avatar-64.png"></span>&nbsp;&nbsp;&nbsp;<span><%=memberVo.getMemName() %>(<%=memberVo.getMemId() %>)</span>님 온프로젝트 방문을 환영합니다</p>
			</div>
			<!-- 봉사내역 -->
			<div class="mycon" id="mycon2">
				<h3>봉사 예약 내역</h3>
				<table class="col-sm-12" class="mpTable">	
      			   	<tr>
      			   		<th>예약번호</th>
      			   		<th>예약봉사</th>
      			   		<th>예약날짜</th>
      			   		<th>예약시간</th>
      			   		<th>예약상태</th>
      			   	</tr>
					<% 
						if( reservList.size() == 0 ) { 
					%>
						<tr><td><p> 봉사 내역이 없습니다.</p></td></tr>
					<% } else {
						int tmpInt = reservList.size() > 5 ? 5 : reservList.size() ;
						for(int i=0; i<tmpInt; i++){
					 %>	
					 	<tr>					
							<td><p><%=(reservList.get(i).getReservId() )%></p></td>
							<td><p><%=(reservList.get(i).getVolId() )%></p></td>
							<td><p><%=(reservList.get(i).getReservDate() )%></p></td>
							<td><p><%=(reservList.get(i).getReservTime() )%></p></td>
							<td><p><%=(reservList.get(i).getrStId() )%></p></td>
						</tr>
						 <%
							}
						 %>
						<% } %>
				</table>
			</div>
			
			<!-- 후원 내역 -->
			<div class="mycon" id="mycon3">
				<h3>내 후원 내역</h3>
     			<table class="col-sm-12" class="mpTable">	
      			   	<tr>
      			   		<th>기부코드</th>
      			   		<th>기부명</th>
      			   		<th>후원일시</th>
      			   		<th>후원원금</th>
      			   		<th>취소</th>
      			   	</tr>
				<% 
					if( donateList.size() == 0 ) { 
				%>
					<tr><td><p> 기부 내역이 없습니다. </p></td></tr>
				<% } else {
		        	for(int j=0; j<donateList.size(); j++ ){
		        %>
				<tr>
					<td><p><%= donateList.get(j).getDonateId() %></p></td>
					<td><p><%= donateList.get(j).getFundingTitle() %></p></td>
					<td><p><%= donateList.get(j).getDonateDate() %></p></td>
					<td><p><%= donateList.get(j).getDonateAmount() %></p></td>
					<td><p><%= donateList.get(j).getRefund() %></p></td>
				</tr>
				 <%
					}
				}
				%>
			</table>	           	
			</div>
		</div>
	</div>
</body>
<script>
$(document).ready(function(){
	$('.menu_wrap').hide();
	$('.gnbmenu').mouseover(function(){
		$('.menu_wrap').slideDown();
	});
	$('#content').mouseover(function(){
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