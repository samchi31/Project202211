<%@page import="member.vo.MemberVO"%>
<%@page import="volunteer.vo.VolunteerVO"%>
<%@page import="common.VolStatus"%>
<%@page import="common.VolCategory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	VolunteerVO vv = (VolunteerVO)request.getAttribute("vv");
	String memId = ((MemberVO)session.getAttribute("loginUser")).getMemId(); // session

%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>온(ON:溫)</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDLuXrEPIX_kNeetaUw8_vyzsILuNypCfw&callback=initMap"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>


<style>
body {
}

ul.nav-pills {
	top: 20px;
/* 	position: fixed; */
	left:0;
	z-index:3;
}

div.col-sm-9 div {
/* 	position: relative; */
	font-size: 20px;
	border:1px solid red
}

#section1 {
	display: inline-block;
/* 	position: relative;  */
	color : #fff;
	background-color: #1E88E5;
	border: 5px dotted pink;
	color: #fff;
}

#section2 {
	display: block; 
/* 	position : static; */
	color: #fff;
	background-color: #673ab7;
	border: 5px solid red;
}

@media screen and (max-width: 810px) {
	#section1, #section2 {
		margin-left: 150px;
	}
}

#detailLeft {
/* 	position: relative; */
	float: left;
	width: 35%
}

#detailRight {
/* 	position: relative; */
	float: left;
	width: 65%
}

img {
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	width: 100px;
	height: 100px;
	z-index: 99;
}
input {
	color: black;
}
#summernote {
}
</style>
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="20">

	<div class="col-sm-12 text-center">
		<h1>봉사 프로그램 등록</h1>
	</div>

	<div class="container">
		<div class="row">
			<nav class="col-sm-3" id="myScrollspy">
				<ul class="nav nav-pills nav-stacked">
			        <li><a href="volList.do">봉사 프로그램 목록</a></li>
			        <hr>
			        <li class="active"><a href="#section1">프로그램 상세</a></li>
			        <li><a href="#section2">글 및 첨부파일</a></li>
				</ul>
			</nav>
		<form action="volUpdate.do" method="post" enctype="multipart/form-data">
			<div class="col-sm-9" style='border: 2px solid black; padding: 10px;'>
				<div class="col-sm-12" id="section1">
					<div id="detailLeft">썸네일 
						<input type="file" name="thumbnail" value="<%=(vv.getThumbnail()) %>">
					</div>
					<div id="detailRight">
							<div class="form-group">
								<label for="input">봉사 ID</label>
								<input class="form-control" type="text" name="volId" value="<%=(vv.getVolId())%>" readonly>
								<lavel for="input">회원 ID</lavel>
								<input class="form-control" type="text" name="memId" value="<%=(vv.getMemId())%>" readonly>
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

								<label for="input">제목</label>
								<input class="form-control" type="text" name="volTitle" value="<%= (vv.getVolTitle())%>">
								<label for="date">시작 날짜</label>
								<input type="date" name="startDate" value="<%=(vv.getStartDate())%>">
								<label for="date">종료 날짜</label>
								<input type="date" name="endDate" value="<%=(vv.getEndDate())%>"><br>
								<label for="time">시작 시간</label>
								<input type="time" name="startTime" value="<%=(vv.getStartTime())%>">
								<label for="time">종료 시간</label>
								<input type="time" name="endTime" value="<%=(vv.getEndTime())%>"><br>
								<label for="input">최대 인원</label>
								<input type="number" name="personnel" value="<%=(vv.getPersonnel())%>"><br>
								<label for="input">현재 인원</label>
								<input type="number" name="total" value="<%=(vv.getTotal())%>"><br>
								<label for="typeLocation">봉사 장소</label>
								<input type="text" id="typeLocation" name="location" value="<%=(vv.getLocation())%>"><br>
								<div id="map" style="height: 400px;"></div>
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
%>								</select>
								<label for="input">봉사 대상</label>
								<input type="text" name="target" value="<%=(vv.getTarget())%>"><br>
								<label for="input">자격 요건</label>
								<input type="text" name="qualification" value="<%=(vv.getQualification())%>"><br>
							</div>
					</div>
				</div>

				<hr>

				<div class="col-sm-12" id="section2" style="height: 100vh;">
					<h1>상세내용</h1>
					<textarea id="summernote" name="detail"><%=(vv.getDetail())%></textarea>
				</div>

                     
					
				<div>
				<input type="submit" value="등록">
				</div>
			</div>
		</form>
		</div>
	</div>

</body>
<script>
	$(document).ready(function() {
		   $('#summernote').summernote();
		});
	
	window.initMap = function() {
		const map = new google.maps.Map(document.getElementById("map"), {
			center : {
				lat : 37.5400456,
				lng : 126.9921017
			},
			zoom : 10
		});
	};
	
// 	function changeCategory(){
// 		if($('#hiddenCategory').val()) != $('#sel1').val() ){
// 			$('#hiddenCategory').val($('#sel1').val());
// 		}
// 	}
	
	
</script>
</html>