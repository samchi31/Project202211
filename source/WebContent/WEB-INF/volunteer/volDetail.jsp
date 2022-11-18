<%@page import="volunteer.vo.ReviewVO"%>
<%@page import="volunteer.vo.VolunteerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
	VolunteerVO vv = (VolunteerVO)request.getAttribute("vv");
	List<ReviewVO> reviewList = (List<ReviewVO>)request.getAttribute("reviewList");
	String memId = (String)request.getAttribute("memId");  // session
	ReviewVO reviewVo = (ReviewVO)request.getAttribute("reviewVo");
	boolean canReview = (boolean)request.getAttribute("canReview");
	String reservId = (String)request.getAttribute("reservId");
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>봉사 상세 정보</title>
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
<style>
.star {
  position: relative;
  font-size: 2rem;
  color: #ddd;
}

.star input {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  opacity: 0;
  cursor: pointer;
}

.star span {
  width: 0;
  position: absolute; 
  left: 0;
  color: red;
  overflow: hidden;
  pointer-events: none;
  z-index:9999;
}
</style>
<script type="text/javascript">
	function drag2(){
		var no = (document.querySelector("#range").value)*16;
		var css = $('#real').css('width', no);
	}
</script>
<body>
	<%@ include file="../header.jsp"%>
    <div class="container">
        <h1 class="f_title">봉사 프로그램 상세 정보
			<p>VOLUNTEER</p>
		</h1>
        <div class="row">
		     <%-- 일반 회원 --%>
		     	 <table class="col-sm-6 fdetail_tb thum">
					<tr>
						<td>
							<img src="http://localhost:9999/<%=(vv.getThumbnail())%>" class="thumb_img_normal" alt="">
						</td>
					</tr>
				 </table>
        		 <table class="col-sm-6 fdetail_tb">
        		 	<tr>
        		 		 <td><h2 class="f_title2">봉사명 : <%=(vv.getVolTitle())%></h2></td>
        		 	<tr>
					<tr>
						<td><p style="color:#ccc">기관 아이디 : <%=(vv.getMemId())%></p></td>
					</tr>
					<tr>
						<td><p><span class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;모집 기간 : <%=(vv.getStartDate())%> ~ <%=(vv.getEndDate())%></p></td>
					</tr>
					<tr>
						<td><p><span class="glyphicon glyphicon-time"></span>&nbsp;&nbsp;모집 시간 : <%=(vv.getStartTime())%> ~ <%=(vv.getEndTime())%></p></td>
					</tr>
					<tr>
						<td><p><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;신청 인원 : <%=(vv.getTotal())%> / <%=(vv.getPersonnel())%></p></td>
					</tr>
					<tr>
						<td><p><span class="glyphicon glyphicon-glyphicon glyphicon-map-marker"></span>&nbsp;&nbsp;봉사 장소 : <%=(vv.getLocation())%></p></td>
					</tr>
					<tr>
						<td><p><span class="glyphicon glyphicon-play"></span>&nbsp;&nbsp;모집 상태 : <%=(vv.getStatus().getKorName())%></p></td>
					</tr>
					<tr>
						<td><p><span class="glyphicon glyphicon-transfer"></span>&nbsp;&nbsp;봉사 대상 : <%=(vv.getTarget())%></p></td>
					</tr>
					<tr>
						<td><p><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;자격 요건 : <%=(vv.getQualification())%></p></td>
					</tr>
					<tr>
						<td><p>
							<div><br><br></div>
							<div id="button" style="text-align: right;">
<%
//session
// 일반 : 예약 / 기관 : 삭제, 수정 / 관리자 : 삭제 수정
// 기관일 시, 작성자와 같냐

// if () {
	
// } else if () {
	
// } else {
	
// }
%>
							<a href="volReservation.do?volId=<%= (vv.getVolId()) %>" class="btn btn-primary btn-lg">예약</a>
							<a href="volDelete.do?volId=<%= (vv.getVolId()) %>" class="btn btn-danger btn-lg">삭제</a>
							<a href="volUpdate.do?volId=<%= (vv.getVolId()) %>" class="btn btn-warning btn-lg">수정</a>
							</div>
							<div><br><br></div>
						</p></td>
					</tr>
				 </table>
				 <div id="detail" class="col-sm-12 editorview">
					<%= vv.getDetail() %>
		         </div>
		         
		         <div id="review" class="col-sm-12">
		            <h2 class="f_title2">후기</h2>
 <% 
//session
// 예약한 내역이 있는 사람 중 예약 상태가 expired면 버튼 보이기
 if(canReview){ // canReview = true -> reservId != null && existNum == 0
%>
	        <button style="color: black;" onclick="reviewRegister()">후기 작성하기</button>
	    <div id="reviewDiv" style="display: none;">
	        <form action="volRegisterRewview.do" method="post">
	        <div>
				<span class="star">
				  ★★★★★
				  <span id="real">★★★★★</span>
				  <input id="range" type="range" oninput="drag()" value="2" step="2" min="2" max="10">
				</span>
			</div>
				<input type="text" name="reservId" value="<%=reservId%>" hidden>
				<input id="star" type="text" name="star" value="" hidden>
	        	<input type="text" name="volId" value="<%=(vv.getVolId())%>" hidden>
	        	<input type="text" name="reservId" value="" hidden>
				<input class="form-control" type="text" name="content">
				<input type="submit" value="등록">
			</form>
		</div>
<%	 
 } else {
	 
 }
	int size = reviewList.size();
	String contentment = "☆☆☆☆☆";
	if (size > 0) {
		for (int i = 0; i < size; i++) {
%>
        <div>
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
		<br>
		조회된 데이터가 없습니다.
		<br>
<%
	}
%>
		         </div>
		         
		         <div id="list"style="text-align: left;">
			      <a href="/volList.do" class="btn btn-success">목록가기</a>
		         </div>
        		
        </div><!-- row End -->
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

$('input[name=thumbnail]').on('click', function(){
	$('input[name=isChange]').val("click");
});

function reviewRegister(){
	if($('#reviewDiv').css('display') == 'none'){
		$('#reviewDiv').show();
	} else {
		$('#reviewDiv').hide();
	}
}
function drag(){
	var no = (document.querySelector("#range").value)*10;
	var css = $('#real').css('width', no);
	$('#star').val(no/20);
}
</script>
</html>