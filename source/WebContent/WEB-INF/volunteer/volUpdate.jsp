<%@page import="volunteer.vo.VolunteerVO"%>
<%@page import="common.VolStatus"%>
<%@page import="common.VolCategory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%

	VolunteerVO vv = (VolunteerVO)request.getAttribute("vv");
	String memId = ((MemberVO)session.getAttribute("loginUser")).getMemId();

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>봉사 프로그램 수정</title>
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
        <h1 class="f_title">봉사 프로그램 수정
			<p>VOLUNTEER</p>
		</h1>
      	<form action="/volUpdate.do" method="post" enctype="multipart/form-data">
        <div class="row">
		     <%-- 일반 회원 --%>
		     	 <table class="col-sm-6 fdetail_tb thum">
		     	 	<tr>
		     	 		<td>
		     	 			<label for="input" style="width: 193px;">봉사 ID</label>
							<input class="form-control" type="text" name="volId" value="<%=(vv.getVolId())%>" readonly>
							<br>
							<label for="input">회원 ID</label>
							<input class="form-control" type="text" name="memId" value="<%=(vv.getMemId())%>" readonly>
		     	 		</td>
		     	 	</tr>
					<tr>
						<td>
							<img src="http://localhost:9999/<%=(vv.getThumbnail())%>" class="thumb_img_normal" style="width:450px; margin-right:0px; height: 460px;">
							썸네일 <input type="file" name="thumbnail" value="<%=(vv.getThumbnail()) %>">
							
						</td>
					</tr>
				 </table>
        		 <table class="col-sm-6 fdetail_tb">
        		 	<tr>
        		 		 <td>
       		 		 		<label for="input"><h1>제목</h1></label>
							<input class="form-control" type="text" name="volTitle"  value="<%= (vv.getVolTitle())%>"><br>
						</td>
        		 	</tr>
        		 	<tr>
        		 		<td>
							<label for="sel1">카테고리</label>
								<select class="form-control" id="sel1" name="category">
									<option><%= (vv.getVolCtId().getKorName())%></option>
<%
for(VolCategory volCategory : VolCategory.values()){
%>
									<option>
									<%= (volCategory.getKorName()) %>
									</option>
<%
}
%>
								</select>
						</td>        		 	
					</tr>
					<tr>
						<td>
							<label for="date">시작 날짜</label>
							<input type="date" name="startDate" value="<%=(vv.getStartDate())%>">
						</td>
					</tr>
					<tr>
						<td>
							<label for="date">종료 날짜</label>
							<input type="date" name="endDate" value="<%=(vv.getEndDate())%>"><br>
						</td>
					</tr>
					<tr>
						<td>
							<label for="time">시작 시간</label>
							<input type="time" name="startTime" value="<%=(vv.getStartTime())%>">
						</td>
					</tr>
					<tr>
						<td>
							<label for="time">종료 시간</label>
							<input type="time" name="endTime" value="<%=(vv.getEndTime())%>"><br>
						</td>
					</tr>
					<tr>
						<td>
							<label for="input">최대 인원</label>
							<input type="number" name="personnel" value="<%=(vv.getPersonnel())%>">
						</td>
					</tr>
					<tr>
						<td>
							<label for="input">현재 인원</label>
							<input type="number" name="total" value="<%=(vv.getTotal())%>" readonly><br>
							(현재 인원은 마이페이지의 봉사 승인 페이지에서 개별적으로 적용해주세요.)
						</td>
					</tr>
					<tr>
						<td>
							<label for="sel2">모집 현황</label>
								<select class="form-control" id="sel2" name="status">
									<option><%= (vv.getStatus().getKorName())%></option>
<%
for(VolStatus volStatus : VolStatus.values()){
%>
									<option>
									<%= (volStatus.getKorName()) %>
									</option>
<%
}
%>								</select><br>
						</td>
					</tr>
					<tr>
						<td>
							<label for="input">봉사 대상</label>
							<input type="text" name="target" value="<%=(vv.getTarget())%>"><br>
						</td>
					</tr>
					<tr>
						<td>
							<label for="input">자격 요건</label>
							<input type="text" name="qualification" value="<%=(vv.getQualification())%>"><br>
						</td>
					</tr>
				 </table>
        </div><!-- row End -->
        
        <div class="row">
        	<p><h3><span class="glyphicon glyphicon-glyphicon glyphicon-map-marker"></span>&nbsp;&nbsp;봉사 장소</h3></p>
	        <table>
				<tr>
					<td>주소</td>
					<td><input type="text" name="detailAddress" id="address" value="<%=vv.getLocation()%>"></td>
					<td><input type="text" name="location" id="typeLocation" value="<%=vv.getLocation()%>" hidden></td>
					<td><button type="button" id="searchBtn">검색</button></td>
				</tr>
			</table>
			<div id="map" style="width:100%;height:350px;"></div>
        </div>
        
		<div class="row">
			<h1>상세내용</h1>
			<textarea id="summernote" name="detail"><%=(vv.getDetail())%></textarea>
		</div>
		<div id="button" style="text-align: right;">
			<p>
				<input type="submit" class="btn btn-success btn-lg" value="등록" style="width: 240px;">
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=016a5620bb71501a85eeb5f90f394c41&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	
	$('#searchBtn').click(function(){
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