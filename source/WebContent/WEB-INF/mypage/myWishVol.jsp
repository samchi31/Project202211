<%@page import="volunteer.vo.VolunteerVO"%>
<%@page import="volunteer.vo.WishVO"%>
<%@page import="member.vo.MemberVO"%>
<%@page import="volunteer.vo.ReservationVO"%>
<%@page import="common.VolStatus"%>
<%@page import="common.VolCategory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String memId = ((MemberVO) session.getAttribute("loginUser")).getMemId();
	List<WishVO> wishList = (List<WishVO>)request.getAttribute("wishList");
	List<VolunteerVO> volList = (List<VolunteerVO>)request.getAttribute("volList");
	String yon = (String)request.getAttribute("yesOrNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지(관심리스트)</title>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/mypage.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
#heart { background:#fff; border:0px solid #fff;}
</style>
</head>
<body>
<%@ include file="../header.jsp"%>
<%@ include file="side.jsp"%>
<div id="wrapper">
	<h1 class="title">관심리스트<p>WishList</p></h1>
	<ul class="wrapper_inner">
	<%
	int k = 1;
	if(wishList!=null){
	for(int i = 0; i < wishList.size(); i++){
		if(wishList.get(i).getMemId().equals(memId)){
			for(int j = 0; j < volList.size(); j++){
				if(volList.get(j).getVolId().equals(wishList.get(i).getVolId())){
				%>
				<div class="mylist">
					<!-- <span class="list_num"><%=k%></span> -->
			        <a class="list_title" href="volDetail.do?volId=<%= (volList.get(j).getVolId()) %>" class="volList-group-item media-heading">[<%=(volList.get(j).getVolCtId().getKorName())%>]&nbsp;&nbsp;<%=(volList.get(j).getVolTitle())%></a><br>
					<br>
					<p><span>[모집 기간]</span>&nbsp;&nbsp;<%=(volList.get(j).getStartDate())%> ~ <%=(volList.get(j).getEndDate())%></p>
					<p><span>[모집 시간]</span>&nbsp;&nbsp;<%=(volList.get(j).getStartTime())%> ~ <%=(volList.get(j).getEndTime())%></p>
					<p><span>[신청 인원]</span>&nbsp;&nbsp;<%=(volList.get(j).getTotal())%> / <%=(volList.get(j).getPersonnel())%></p>
					<p><span>[봉사 장소]</span>&nbsp;&nbsp;<%=(volList.get(j).getLocation())%></p>
					<p><span>[모집 상태]</span>&nbsp;&nbsp;<%=(volList.get(j).getStatus().getKorName())%></p>
					<p><span>[봉사 대상]</span>&nbsp;&nbsp;<%=(volList.get(j).getTarget())%></p>
					<p><span>[자격 요건]</span>&nbsp;&nbsp;<%=(volList.get(j).getQualification())%></p>
					<form action="volWish.do" method="post" onsubmit="return true;">
						<button type="submit" id="heart">
<% 
						for(int l = 0; l < wishList.size(); l++) {
							if(volList.get(j).getVolId().equals(wishList.get(l).getVolId()) && memId.equals(wishList.get(l).getMemId())) {
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
							<input id="volId" name="volId" value="<%=(volList.get(j).getVolId())%>" type="hidden">
							<input name="page" value="mypage" type="hidden">
							
							</i>
						</button>
					</form>
				</div>
				<%
					k++;
				}
			}
		}
	}
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
                 }
       		});
        };
</script>
</body>
</html>