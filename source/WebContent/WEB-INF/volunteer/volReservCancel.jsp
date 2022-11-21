<%@page import="volunteer.vo.ReviewVO"%>
<%@page import="volunteer.vo.ReservationVO"%>
<%@page import="common.VolStatus"%>
<%@page import="common.VolCategory"%>
<%@page import="java.util.List"%>
<%@page import="volunteer.vo.VolunteerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	VolunteerVO vv = (VolunteerVO)request.getAttribute("vv");
	ReservationVO rv = (ReservationVO)request.getAttribute("rv");
	List<ReviewVO> reviewList = (List<ReviewVO>)request.getAttribute("reviewList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>봉사 프로그램 예약 취소</title>
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
        <h1 class="f_title">봉사 프로그램 예약 취소
			<p>VOLUNTEER</p>
		</h1>
      <form action="/volReservCancel.do" method="post">
	 	<div class="row">
	 		<h1>예약현황</h1>
		     <%-- 일반 회원 --%>
        		 <table class="col-sm-6 fdetail_tb">
        		 	<tr>
        		 		 <td>
       		 		 		<h3>예약 번호<%=(rv.getReservId())%></h3>
       		 		 		<input type="text" value="<%=(rv.getReservId()) %>" name="reservId" hidden>
						</td>
        		 	</tr>
        		 	<tr>
        		 		<td>
							<label for="input">예약한 아이디</label>
							<input type="text" value="<%=(rv.getMemId())%>" name="memId" readonly>        		 	
					</tr>
					<tr>
						<td>
							<label for="input">예약한 봉사</label>
							<a href="volDetail.do?volId=<%= (rv.getVolId()) %>"><%=(rv.getVolId())%></a>
						</td>
					</tr>
					<tr>
						<td>
							<label for="input">예약 날짜</label>
	       					<input type="text" value="<%=(rv.getReservDate()) %>" readonly><br>
						</td>
					</tr>
					<tr>
						<td>
							<label for="input">예약 시간</label>
							<input type="text" value="<%=(rv.getReservTime()) %>" readonly>
						</td>
					</tr>
					<tr>
						<td>
							<label for="input">신청 날짜</label>
							<input type="text" value="<%=(rv.getApplyDate()) %>" readonly><br>
						</td>
					</tr>
					<tr>
						<td>
							<label for="input">예약 상태</label>
							<input type="text" value="<%=(rv.getrStId()) %>" readonly>
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
        </div>
        
        <div id="button" style="text-align: right;"><br>
      		<button type="submit" class="btn btn-danger btn-lg">취소</button>
      	</div>
      	
        <div class="row">
        	<h1>봉사 프로그램</h1>
        	<br><br>
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
							<input type="text" value="<%=(vv.getVolTitle())%>" readonly><br>
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
        </div>

		<div class="row">
			<h1>상세내용</h1>
			<br><br>
			<%= (vv.getDetail()) %>
		</div>
         <div class="row">
        	<h1>후기</h1>
<%
	int size = reviewList.size();
	String contentment = "☆☆☆☆☆";
	if (size > 0) {
		for (int i = 0; i < size; i++) {
%>
<%
			for (int k = 0; k < reviewList.get(i).getStar(); k++) {
				contentment = contentment.replaceFirst("☆", "★");
			}
%>
	        <h2><%= (contentment) %></h2>
	        <%= (reviewList.get(i).getCorrectionDate()) %> <br>
	        <%= (reviewList.get(i).getContent()) %>
         </div>
<%
		}
	} else {
%>
		조회된 데이터가 없습니다.
		</div>
<%
	}
%>

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