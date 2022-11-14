<%@page import="common.VolStatus"%>
<%@page import="common.VolCategory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<style>
body {
	position: relative;
}

ul.nav-pills {
	top: 20px;
	position: fixed;
}

div.col-sm-9 div {
	position: relative;
	font-size: 20px;
}

#section1 {
	display: inline-block;
	position: relative; 
	color : #fff;
	background-color: #1E88E5;
	border: 5px dotted pink;
	color: #fff;
}

#section2 {
	display: block; 
	position : relative;
	color: #fff;
	background-color: #673ab7;
	border: 5px solid red;
	position: relative;
}

@media screen and (max-width: 810px) {
	#section1, #section2 {
		margin-left: 150px;
	}
}

#detailLeft {
	position: relative;
	z-index: 1;
	float: left;
	width: 35%
}

#detailRight {
	position: relative;
	z-index: 1;
	float: left;
	width: 65%
}

img {
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 99;
}
input {
 color: black;
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
					<li class="active"><a href="#section1">프로그램 상세</a></li>
					<li><a href="#section2">글 및 첨부파일</a></li>
				</ul>
			</nav>
		<form action="volRegister.do" method="post" enctype="multipart/form-data">
			<div class="col-sm-9" style='border: 2px solid black; padding: 10px;'>
				<div class="col-sm-12" id="section1">
					<div id="detailLeft">썸네일 
						<input type="file" name="thumbnail">
					</div>
					<div id="detailRight">
							<div class="form-group">
								<label for="sel1">카테고리</label>
								<select class="form-control" id="sel1" name="category">
									<option>종류를 선택하세요</option>
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
								<input class="form-control" type="text" name="volTitle">
								<label for="date">시작 날짜</label>
								<input type="date" name="startDate">
								<label for="date">종료 날짜</label>
								<input type="date" name="endDate"><br>
								<label for="time">시작 시간</label>
								<input type="time" name="startTime">
								<label for="time">종료 시간</label>
								<input type="time" name="endTime"><br>
								<label for="input">최대 인원</label>
								<input type="number" name="personnel"><br>
								<label for="input">현재 인원</label>
								<input type="number" name="total"><br>
								<label for="typeLocation">봉사 장소</label>
								<input type="text" id="typeLocation" name="location"><br>
								<div id="map" style="height: 400px;"></div>
								<label for="sel2">모집 현황</label>
								<select class="form-control" id="sel2" name="status">
									<option>상태를 선택하세요</option>
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
								<input type="text" name="target"><br>
								<label for="input">자격 요건</label>
								<input type="text" name="qualification"><br>
							</div>
					</div>
				</div>

				<hr>

				<div class="col-sm-12" id="section2">
					<h1>상세내용</h1>
					<div>
						<input type="text" name="detail">
					</div>
				</div>
				
				<div>
								
				<input type="submit" value="등록">
				<script>
				console.log($(volTitle));
				</script>
				</div>
			</div>
		</form>
		</div>
	</div>

</body>
<script>
	window.initMap = function() {
		const map = new google.maps.Map(document.getElementById("map"), {
			center : {
				lat : 37.5400456,
				lng : 126.9921017
			},
			zoom : 10
		});
	};
</script>
</html>