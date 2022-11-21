<%@page import="volunteer.vo.VolunteerVO"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String memId = ((MemberVO) session.getAttribute("loginUser")).getMemId();
	List<VolunteerVO> volList = (List<VolunteerVO>) request.getAttribute("volList");

%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지(봉사내역)</title>
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
	<h1 class="title">내가 올린 봉사글<p>Volunteer List</p></h1>
	<ul class="wrapper_inner">
		<%
		int size = volList.size();
		int k = 0;
	
		if (size > 0) {
			for (int i = 0; i < size; i++) {
	
		%>
		<div class="mylist2">
<%-- 		<div class="media-left">
				<img src="<%=(volList.get(i).getThumbnail())%>"  class="media-object" style="width:100%"/>
			</div>
			<div class="media-body"> --%>
				<!-- session -->
		        <a class="list_title2" href="volDetail.do?volId=<%= (volList.get(i).getVolId()) %>&memId=<%= (memId) %>" class="volList-group-item media-heading">
		        	[<%=(volList.get(i).getVolCtId().getKorName())%>]&nbsp;&nbsp;<%=(volList.get(i).getVolTitle())%>
		        </a>
				<p><span>[모집 기간]</span>&nbsp;&nbsp;<%=(volList.get(i).getStartDate())%> ~ <%=(volList.get(i).getEndDate())%></p>
				<p><span>[모집 시간]</span>&nbsp;&nbsp;<%=(volList.get(i).getStartTime())%> ~ <%=(volList.get(i).getEndTime())%></p>
				<p><span>[신청 인원]</span>&nbsp;&nbsp;<%=(volList.get(i).getTotal())%> / <%=(volList.get(i).getPersonnel())%></p> 
				<p><span>[봉사 장소]</span>&nbsp;&nbsp;<%=(volList.get(i).getLocation())%></p>
				<p><span>[모집 상태]</span>&nbsp;&nbsp;<%=(volList.get(i).getStatus().getKorName())%></p>
				<p><span>[봉사 대상]</span>&nbsp;&nbsp;<%=(volList.get(i).getTarget())%></p>
				<p><span>[자격 요건]</span>&nbsp;&nbsp;<%=(volList.get(i).getQualification())%></p>
			</div>
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