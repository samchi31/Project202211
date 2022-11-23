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
	   					   <img src="<%=(vv.getThumbnail())%>" class="thumb_img_normal col-sm-12" style="width:450px; margin-right:0px; height: 460px;"/>
						</td>
					</tr>
				 </table>
        		 <table class="col-sm-6 fdetail_tb">
        		 	<tr>
        		 		 <td>
        		 		 	<h2 class="f_title2"><%=(vv.getVolTitle())%></h2>
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
        	<p><h2 class="f_title2"><span class="glyphicon glyphicon-glyphicon glyphicon-map-marker"></span>&nbsp;&nbsp;봉사 장소 : <%=(vv.getLocation())%></h2></p>
        	<td><input type="text" name="detailAddress" id="address" value="<%=(vv.getLocation())%>" hidden></td>
        	<input type="text" id="location" value="<%=(vv.getLocation())%>" hidden>
			<div id="map" style="width:1000px;height:400px;"></div>
        </div>
        
<!-- 		<div class="row"> -->
<!--         	<h2 class="f_title2">상세 내용</h2> -->
<%-- 			<%= (vv.getDetail()) %> --%>
<!-- 		</div> -->
					
		<div class="row"> 
			<h2 class="f_title2">날짜 선택</h2>
<%
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
String todate = LocalDate.now().format(formatter2);
int today = Integer.parseInt(LocalDate.now().format(formatter));
int start = Integer.parseInt(vv.getStartDate().replace("-",""));
%>
            	<input type="date" name="reservDate" value="<%if(today >= start){%><%=todate%><%}else{%><%=vv.getStartDate()%><%}%>"min="<%if(today >= start){%><%=todate%><%}else{%><%=vv.getStartDate()%><%}%>" max="<%=vv.getEndDate()%>">
       		 <h2 class="f_title2">시간 선택</h2>
        		<input type="time" name="startTime" value="<%=vv.getStartTime() %>" min="<%=vv.getStartTime()%>"> ~ <input type="time" name="endTime" value="<%=vv.getEndTime() %>" max="<%=vv.getEndTime()%>" max="<%=vv.getEndTime()%>">
		</div>
		
		<br><br>
		
		<div id="button" style="text-align: right;">
			<p>
				<button type="submit" class="btn btn-success btn-lg" style="width: 240px;">신청</button>
				<button class="btn btn-danger btn-lg" formaction="/volList.do" formmethod="get" style="width: 240px;">돌아가기</button>
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
	$('.container').mouseover(function(){
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=016a5620bb71501a85eeb5f90f394c41&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	
	$(document).ready(function(){
		// 버튼을 click했을때
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch($('#address').val(), function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        
		        // 추출한 좌표를 통해 도로명 주소 추출
		        let lat = result[0].y;
		        let lng = result[0].x;
		        getAddr(lat,lng);
		        function getAddr(lat,lng){
		            let geocoder = new kakao.maps.services.Geocoder();
	
		            let coord = new kakao.maps.LatLng(lat, lng);
		            let callback = function(result, status) {
		                if (status === kakao.maps.services.Status.OK) {
		                	// 추출한 도로명 주소를 해당 input의 value값으로 적용
		                    $('#address').val(result[0].road_address.address_name);
		                    $('#typeLocation').val(result[0].road_address.address_name);
		                }
		            }
		            geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
		        }
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
	
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">봉사 장소</div>'
		        });
		        infowindow.open(map, marker);
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});  
	});
	  
</script>
</html>