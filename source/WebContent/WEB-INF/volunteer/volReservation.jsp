<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="volunteer.vo.ReservationVO"%>
<%@page import="common.VolStatus"%>
<%@page import="common.VolCategory"%>
<%@page import="java.util.List"%>
<%@page import="volunteer.vo.VolunteerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	VolunteerVO vv = (VolunteerVO)request.getAttribute("vv");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>봉사 프로그램 예약</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/funding.css">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
 	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
</head>
<body>
	<%@ include file="../header.jsp"%>
    <div class="container">
        <h1 class="f_title">봉사 프로그램 예약
			<p>VOLUNTEER</p>
		</h1>
      	<form action="/volReservation.do" method="post">
        <div class="row">
		     <%-- 일반 회원 --%>
		     	 <table class="col-sm-6 fdetail_tb thum" style="height: 320px;">
					<tr>
						<td>
	   					   <img src="http://localhost:9999/<%=(vv.getThumbnail())%>" class="col-sm-12"/>
						</td>
					</tr>
				 </table>
        		 <table class="col-sm-6 fdetail_tb">
        		 	<tr>
        		 		 <td>
       		 		 		<h1><%=(vv.getVolTitle())%></h1><br>
							<p style="color:#ccc">봉사 아이디 : <%= (vv.getVolId()) %> <br> 기관 아이디 : <%= (vv.getMemId()) %></p>
							<input type="text" name="volId" value="<%=vv.getVolId() %>" hidden>							
						</td>
        		 	</tr>
        		 	<tr>
        		 		<td>
							<label for="input">카테고리</label>
							<input type="text" value="<%=(vv.getVolCtId().getKorName())%>" readonly><br>
						</td>        		 	
					</tr>
					<tr>
						<td>
							<label for="input">모집 기간</label>
	       					<input type="text" value="<%=(vv.getStartDate())%> ~ <%=(vv.getEndDate())%>" readonly><br>
						</td>
					</tr>
					<tr>
						<td>
							<label for="input">모집 시간</label>
	       					<input type="text" value="<%=(vv.getStartTime())%> ~ <%=(vv.getEndTime())%>" readonly><br>
						</td>
					</tr>
					<tr>
						<td>
							<label for="input">인원 현황</label>
							<input type="text" value="<%=(vv.getTotal())%> / <%=(vv.getPersonnel())%>" readonly>
						</td>
					</tr>
					<tr>
						<td>
							<label for="input">봉사 장소</label>
							<input type="text" value="<%=(vv.getLocation())%>" readonly><br>
							<!-- <div id="map" style="height: 400px;"></div> -->
						</td>
					</tr>
					<tr>
						<td>
							<label for="input">모집 현황</label>
							<input type="text" value="<%=(vv.getStatus().getKorName())%>" readonly>
						</td>
					</tr>
					<tr>
						<td>
							<label for="input">봉사 대상</label>
							<input type="text" value="<%=(vv.getTarget())%>" readonly><br>
						</td>
					</tr>
					<tr>
						<td>
							<label for="input">자격 요건</label>
							<input type="text" value="<%=(vv.getQualification())%>" readonly><br>
						</td>
					</tr>
				 </table>
        </div><!-- row End -->
        
		<div class="row">
			<h1>상세내용</h1>
			<%= (vv.getDetail()) %>
		</div>
					
		<div class="row"> 
			<h1>날짜 선택</h1>
<%
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
String todate = LocalDate.now().format(formatter2);
int today = Integer.parseInt(LocalDate.now().format(formatter));
int start = Integer.parseInt(vv.getStartDate().replace("-",""));
%>
            	<input type="date" name="reservDate" value="<%if(today >= start){%><%=todate%><%}else{%><%=vv.getStartDate()%><%}%>"min="<%if(today >= start){%><%=todate%><%}else{%><%=vv.getStartDate()%><%}%>" max="<%=vv.getEndDate()%>">
       		 <h1>시간 선택</h1>
        		<input type="time" name="startTime" value="<%=vv.getStartTime() %>" min="<%=vv.getStartTime()%>"> ~ <input type="time" name="endTime" value="<%=vv.getEndTime() %>" max="<%=vv.getEndTime()%>" max="<%=vv.getEndTime()%>">
		</div>
		
		<br><br>
		
		<div id="button" style="text-align: right;">
			<p>
				<input type="submit" class="btn btn-success btn-lg" value="신청" style="width: 240px;">
				<input type="text" class="btn btn-danger btn-lg" onClick="location.href='/volList.do'" value="취소">
			</p>
		</div>
     </form>
    </div><!-- container End -->
    
</body>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$(document).ready(function(){
	$('.menu_wrap').hide();
	$('.gnbmenu').mouseover(function(){
		$('.menu_wrap').slideDown();
	});
	$('.menu_wrap').mouseout(function(){
		$('.menu_wrap').hide();
	});
});

//펀딩 내역 에디터
	$(document).ready(function() {
		   $('#summernote').summernote();
		});
	
// 지
	window.initMap = function() {
		const map = new google.maps.Map(document.getElementById("map"), {
			center : {
				lat : 37.5400456,
				lng : 126.9921017
			},
			zoom : 10
		});
	};

$('input[name=thumbnail]').on('click', function(){
	$('input[name=isChange]').val("click");
});

</script>
</html>