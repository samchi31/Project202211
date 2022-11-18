<%@page import="member.vo.MemberVO"%>
<%@page import="volunteer.vo.WishVO"%>
<%@page import="common.VolStatus"%>
<%@page import="common.VolCategory"%>
<%@page import="java.util.List"%>
<%@page import="volunteer.vo.VolunteerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<VolunteerVO> volList = (List<VolunteerVO>) request.getAttribute("volList");
	List<WishVO> wishList = (List<WishVO>)request.getAttribute("wishList");
	String memId = ((MemberVO)session.getAttribute("loginUser")).getMemId(); // session
	String yon = (String)request.getAttribute("yesOrNo");

String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>온(ON:溫)</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.container {
	margin-top:10%
}

.container2 {
	margin:10% 20%
}

@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.v_title {
	margin:1% 0 2% 0;
	font-color:#444
}

.title {
	font-weight: bold; 
	font-family:'GmarketSansMedium', sans-serif ;font-weight:bold;
	position:relative;
	color:#444;
	font-size:52px;
	padding-bottom:5%
}

#filter {
	display: flex;
	justify-content: left;
	font-size:18px; text-indent:2px; 
	font-weight: bold; 
	font-family:'GmarketSansMedium', sans-serif ;font-weight:bold;
}

#filter img{width:15px; height:15px;} 

.table { padding:5%; background-color:#f1f1f1}

.table th {text-align:center;
color:#fff;font-size:16px;
font-family:'GmarketSansMedium', sans-serif ;
font-weight:bold;
background-color:#50DCA4 
}

.table tr td {margin:10px}

#listArea {
	display: flex;
	justify-content: left;
}

#ListAreaTable {
	border: 1px solid ccc;
}
.media-left {
	width: 30%;
}


/**/
.list-group-item.active {background-color:#444 !important;
border-color:#444}

.row {
	margin:5% auto;
	padding:5%;
	border:1px solid #f1f1f1;
	border-radius:10px;
	box-shadow : 0px 0px 20px #f1f1f1;
	transition:0.2s
}

.row:hover {
	box-shadow : 0px 5px 30px #ccc;
}

.register {float:right}

.v_title {
	font-family:'GmarketSansMedium', sans-serif ;
font-weight:bold;
}
.media-heading {margin-bottom:0 !important;margin-left:5%}

#v_content {text-align:left;padding:0%;color:#666;position:relative;}

#v_status {font-family:'GmarketSansMedium', sans-serif ;position:absolute;top:3%;right:15%; 
font-weight:bold;font-size:20px;color:#444;}
button { background:#fff; border:0px solid #fff;position:absolute; top:0;right:0%}
i {background:tranparent;}

</style>
</head>
<body>
  	<%@ include file="../header.jsp"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<div class="col-sm-12 text-center">
		<!-- 필터 시작 -->
		<div class="container">
			<h1 class="title">봉사 프로그램 목록</h1>
			<h4 id="filter">
				<img src="https://cdn-icons-png.flaticon.com/512/107/107799.png">필터 적용
			</h4>
			<table class="table">
				<thead>
					<tr>
						<th>지역</th>
						<th>유형</th>
						<th>날짜</th>
						<th>대상</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="locationFilter">
							  <a href="#" class="list-group-item btn active">전체</a>
							  <a href="#" class="list-group-item btn">Second item</a>
							  <a href="#" class="list-group-item btn">Third item</a>
							</div>
						</td>
						<td>
							<div class="categoryFilter">
							  <a href="#" class="list-group-item active">전체</a>
							  <a href="#" class="list-group-item">Second item</a>
							  <a href="#" class="list-group-item">Third item</a>
							</div>
						</td>
						<td>
							<div class="dateFilter">
							  <a href="#" class="list-group-item active">전체</a>
							  <a href="#" class="list-group-item">Second item</a>
							  <a href="#" class="list-group-item">Third item</a>
							</div>
						</td>
						<td>
							<div class="targetFilter">
							  <a href="#" class="list-group-item active">전체</a>
							  <a href="#" class="list-group-item">Second item</a>
							  <a href="#" class="list-group-item">Third item</a>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<hr>
			<div class="register">
				<a href="volRegister.do" class="btn btn-info" role="button">봉사 프로그램 등록</a>
			</div>
		</div>
		<!-- 필터 끝 -->

		
		
		<!-- 리스트 시작 -->
		<div class="container2">
<%
	int size = volList.size();
	int wishSize = wishList.size();
	int k = 0;

	if (size > 0) {
		for (int i = 0; i < size; i++) {

%>
			<div class="volList-group row">
				<div class="media">	
					<div class="media-left">
						<img src="<%=(volList.get(i).getThumbnail())%>"  class="media-object" style="width:100%;margin-top:20px;padding-right:20px;"/>
					</div>
					<div class="media-body" >
						<!-- session -->
				        <a id="v_content" href="volDetail.do?volId=<%= (volList.get(i).getVolId()) %>&memId=<%= (memId) %>" class="volList-group-item media-heading" >
					        <h3 class="v_title">[<%=(volList.get(i).getVolCtId().getKorName())%>]<%=(volList.get(i).getVolTitle())%></h3>
							<p><span class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;모집 기간 : <%=(volList.get(i).getStartDate())%> ~ <%=(volList.get(i).getEndDate())%> </p>
							<p><span class="glyphicon glyphicon-time"></span>&nbsp;&nbsp;모집 시간 : <%=(volList.get(i).getStartTime())%> ~ <%=(volList.get(i).getEndTime())%></p>
							<p><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;신청 인원 : <%=(volList.get(i).getTotal())%> / <%=(volList.get(i).getPersonnel())%></p> 
							<p><span class="glyphicon glyphicon-map-marker"></span>&nbsp;&nbsp;봉사 장소 : <%=(volList.get(i).getLocation())%></p>
							<p><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;봉사 대상 : <%=(volList.get(i).getTarget())%></p>
							<p><span class="glyphicon glyphicon-check"></span>&nbsp;&nbsp;자격 요건 : <%=(volList.get(i).getQualification())%></p>
						
						<span id="v_status"><%=(volList.get(i).getStatus().getKorName())%></span>
						<form action="volWish.do" method="post" onsubmit="return true;">
							<button type="submit">
<% 
							for(int j = 0; j < wishSize; j++) {
								if(volList.get(i).getVolId().equals(wishList.get(j).getVolId()) && memId.equals(wishList.get(j).getMemId())) {
									k = 1;
									break;
								} else {
									k = 0;
									continue;
								}
							}
							if(k == 1) {
%>								
								<i id="fillHeart" class="bi-heart-fill" style="font-size:3rem; color: red; cursor: pointer;">
									<input id="isWished" name="isWished" value="y" type="hidden">
<%
							} else {
%>
								<i id="emptyHeart" class="bi-heart" style="font-size:3rem; color: red; cursor: pointer;">
									<input id="isWished" name="isWished" value="n" type="hidden">
<%								
							}
%>
								<input id="volId" name="volId" value="<%=(volList.get(i).getVolId())%>" type="hidden">
								<input name="page" value="volList" type="hidden">
								</i>
							</button>
						</form>
						</a>
					</div>
				</div>
			</div>
<%
		}
	} else {
%>
		조회된 데이터가 없습니다.
<%
	}
%>
		</div>
		<!-- 리스트 끝 -->
		
	</div>
	
<script>

// 하트
      	var yon = <%=yon%>;

        $('i').on('click',function(){
        	
          	
			$.ajax({
                type: 'post',
				url: '/volWish.do',
                data: {
            		"isWished" : $('#isWished').val(),
            		"volId" : $('#volId').val(),
            		"memId" : $('#memId').val()
          			 },
                success: 
                	 if(yon == 'y'){
				     	$(this).attr('class','bi-heart-fill');
				     	$('#isWished').val('y');
		             } else if($(yon == 'n'){
				        $(this).attr('class','bi-heart');
				     	$('#isWished').val('n');
				     	
		             },
                 error: function(chr){
                     alert("상태 : " + xhr.status)
                 };
       		})
        });

//         $('i').on('click',function(){
        	
//           	var isWished = $('#isWished').val();
//           	var volId = $('#volId').val();
//           	var memId = $('#memId').val(); // session
          	
//           	var jsonObj = {
//     		"isWished" : isWished,
//     		"volId" : volId,
//     		"memId" : memId // session
//   			 };
          	
// 			$.ajax({
//                 type: 'post',
// 				url: '/volWish.do',
// 				dataType: 'json',
//                 data: JSON.stringify(jsonObj),
//                 contentType: "application/json; charset=utf-8",
//                 success: 
//                 	 if(data.msg == 'y'){
// 				     	$(this).attr('class','bi-heart-fill');
// 				     	$('#isWished').val('y');
// 		             } else if($(data.msg == 'n'){
// 				        $(this).attr('class','bi-heart');
// 				     	$('#isWished').val('n');
// 		             },
//                  error: function(chr){
//                      alert("상태 : " + xhr.status)
//                  };
//        		})
//         });


        
        
       	var active = 'list-group-item active';
       	var inactive = 'list-group-item';
//        	var lfSize = $('.locationFilter').children().length;
		
		// $(event.target)
// 		$("body").click(function(event){
// 			if(event.target)
// 		    console.log("무엇을 클릭했을 까요? ", event.target.nodeName);
// 		})
		
        $('.locationFilter a:nth-of-type(' + 1 + ')').on('click', function(){
    		$('.locationFilter a').attr('class', inactive);
    		$('.locationFilter a:nth-of-type(' + 1 + ')').attr('class', active);
        });
        $('.locationFilter a:nth-of-type(' + 2 + ')').on('click', function(){
    		$('.locationFilter a').attr('class', inactive);
    		$('.locationFilter a:nth-of-type(' + 2 + ')').attr('class', active);
        });
        $('.locationFilter a:nth-of-type(' + 3 + ')').on('click', function(){
    		$('.locationFilter a').attr('class', inactive);
    		$('.locationFilter a:nth-of-type(' + 3 + ')').attr('class', active);
        });
        
        
        
        $('.categoryFilter a:nth-of-type(' + 1 + ')').on('click', function(){
    		$('.categoryFilter a').attr('class', inactive);
    		$('.categoryFilter a:nth-of-type(' + 1 + ')').attr('class', active);
        });
        $('.categoryFilter a:nth-of-type(' + 2 + ')').on('click', function(){
    		$('.categoryFilter a').attr('class', inactive);
    		$('.categoryFilter a:nth-of-type(' + 2 + ')').attr('class', active);
        });
        $('.categoryFilter a:nth-of-type(' + 3 + ')').on('click', function(){
    		$('.categoryFilter a').attr('class', inactive);
    		$('.categoryFilter a:nth-of-type(' + 3 + ')').attr('class', active);
        });
        
        
        
        $('.dateFilter a:nth-of-type(' + 1 + ')').on('click', function(){
    		$('.dateFilter a').attr('class', inactive);
    		$('.dateFilter a:nth-of-type(' + 1 + ')').attr('class', active);
        });
        $('.dateFilter a:nth-of-type(' + 2 + ')').on('click', function(){
    		$('.dateFilter a').attr('class', inactive);
    		$('.dateFilter a:nth-of-type(' + 2 + ')').attr('class', active);
        });
        $('.dateFilter a:nth-of-type(' + 3 + ')').on('click', function(){
    		$('.dateFilter a').attr('class', inactive);
    		$('.dateFilter a:nth-of-type(' + 3 + ')').attr('class', active);
        });
        
        
        
        $('.targetFilter a:nth-of-type(' + 1 + ')').on('click', function(){
    		$('.targetFilter a').attr('class', inactive);
			$('.targetFilter a:nth-of-type(' + 1 + ')').attr('class', active);
        });
        $('.targetFilter a:nth-of-type(' + 2 + ')').on('click', function(){
    		$('.targetFilter a').attr('class', inactive);
			$('.targetFilter a:nth-of-type(' + 2 + ')').attr('class', active);
        });
        $('.targetFilter a:nth-of-type(' + 3 + ')').on('click', function(){
    		$('.targetFilter a').attr('class', inactive);
			$('.targetFilter a:nth-of-type(' + 3 + ')').attr('class', active);
        });
    </script>
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

</script>
</body>
</html>