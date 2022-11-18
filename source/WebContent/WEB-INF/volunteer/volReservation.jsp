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
<title>온(ON:溫)</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@4.4.0/"></script>
<style>
body {
	color: black;
	position: relative;
}

ul.nav-pills {
	top: 20px;
	position: fixed;
}

div.col-sm-9 div {
	height: 410px;
	font-size: 20px;
}

#section1 {
	color: #333;
	border: 5px dotted pink;
}

#section2 {
	color: #333;
	border: 5px dotted pink;
}

#section3 {
	color: #333;
	border: 5px dotted pink;
}

@media screen and (max-width: 810px) {
	#section1, #section2, #section3, #section41, #section42 {
		margin-left: 150px;
	}
}

#detailLeft {
	position: relative;
	z-index:1;
	float: left;
	width:35%
}

#detailRight {
	position: relative;
	z-index:1;
	float: left;
	width:65%
	
}

img {
	display:block;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 99;
}
 #calendar {
  max-width: 900px;
  margin: 0 auto;
  z-index:9999;
}
</style>
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="20">

<div class="col-sm-12 text-center">
	<h1>봉사 프로그램 예약</h1>

</div>


<div class="container">
  <div class="row">
    <nav class="col-sm-3" id="myScrollspy">
      <ul class="nav nav-pills nav-stacked">
<!--       session -->
          <li><a href="volList.do">봉사 프로그램 목록</a></li> 
          <hr>
          <li class="active"><a href="#section1">프로그램 상세</a></li>
          <li><a href="#section2">글 및 첨부파일</a></li>
          <li><a href="#section3">후기</a></li>
      </ul>
    </nav>
<form action="volReservation.do" method="post">
    <div class="col-sm-9" style='border: 2px solid black; padding: 10px; height:auto;'>
      <div id="section1">
	    <div id="detailLeft">
	      <img src="http://localhost:9999/<%=(vv.getThumbnail())%>" />
	    </div>
	  	<div id="detailRight">
	        [<%=(vv.getVolCtId().getKorName())%>]
	        <h1><%=(vv.getVolTitle())%></h1>
	        <input type="text" name="volId" value="<%= (vv.getVolId()) %>" readonly><br>
			[모집 기간]   <%=(vv.getStartDate())%> ~ <%=(vv.getEndDate())%> <br>
			[모집 시간]   <%=(vv.getStartTime())%> ~ <%=(vv.getEndTime())%> <br>
			[신청 인원]   <%=(vv.getTotal())%> / <%=(vv.getPersonnel())%> <br> 
			[봉사 장소]   <%=(vv.getLocation())%> <br>
			[모집 상태]   <%=(vv.getStatus().getKorName())%> <br>
			[봉사 대상]   <%=(vv.getTarget())%> <br>
			[자격 요건]   <%=(vv.getQualification())%><br>
			<label for="#checkDetail">확인</label>
			<input type="checkbox" name="checkDetail">
      	</div> 
      </div>
      
      <hr>
      
      <div id="section2"> 
        <h1>날짜 선택</h1>
            <input type="date" name="reservDate">
        <h1>시간 선택</h1>
        	<input type="number" name="reservTime">
      </div>
      
      <hr>
      	 <div id="section3">         
			<h1>섹션3</h1>
     	 </div>
      
	 	<div>
			<input type="submit" value="등록">
	  	</div>
      </div>
    </form>
  </div>
</div>
</body>
</html>