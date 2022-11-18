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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>온(ON:溫)</title>
</head>
<style>
div {
	border: 1px solid olivedrab;
}

#side, #content {
	float: left;
	height: 85vh;
}

#side {
	width: 25%;
}

#content {
	width: 74%;
}
</style>
</head>
<body>
	<h1>온(溫:ON)</h1>
	<div id="side">
		<div id="memDetail" class="memDetail">
			<a href="/mypage/memDetail.do">회원정보</a>
		</div>
		<div id=class="">
			<a href="/myVolReserv.do">봉사 내역</a>
		</div>
		<div id=class="">
			<a href="/volWish.do">관심 봉사</a>
		</div>
		<div id=class="">
			<a href="/approve.do">봉사 승인</a>
		</div>
		<div id=class="">
			<a href="/myVolList.do">봉사글 작성 내역</a>
		</div>
		<div id=class="">
			<a href="/myUserClass.do">재능기부 현황</a>
		</div>
		<div id=class="">
			<a href="/myDonate.do">후원 내역</a>
		</div>
		<div id=class="">
			<a href="/myQna.do">Q&A</a>
		</div>
		<div id=class="">
			<a href="/myNotice.do">공지사항</a>
		</div>
	</div>

	<div id="content">
	<%
	int k = 1;
	for(int i = 0; i < wishList.size(); i++){
		if(wishList.get(i).getMemId().equals(memId)){
			for(int j = 0; j < volList.size(); j++){
				if(volList.get(j).getVolId().equals(wishList.get(i).getVolId())){
				%>
				<div>
				<span>(<%=k%>)</span>
			        <a href="volDetail.do?volId=<%= (volList.get(j).getVolId()) %>" class="volList-group-item media-heading">[<%=(volList.get(j).getVolCtId().getKorName())%>]<%=(volList.get(j).getVolTitle())%></a><br>
					[모집 기간]   <%=(volList.get(j).getStartDate())%> ~ <%=(volList.get(j).getEndDate())%> <br>
					[모집 시간]   <%=(volList.get(j).getStartTime())%> ~ <%=(volList.get(j).getEndTime())%> <br>
					[신청 인원]   <%=(volList.get(j).getTotal())%> / <%=(volList.get(j).getPersonnel())%> <br> 
					[봉사 장소]   <%=(volList.get(j).getLocation())%> <br>
					[모집 상태]   <%=(volList.get(j).getStatus().getKorName())%> <br>
					[봉사 대상]   <%=(volList.get(j).getTarget())%> <br>
					[자격 요건]   <%=(volList.get(j).getQualification())%><br>
						<form action="volWish.do" method="post" onsubmit="return true;">
							<button type="submit">
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
	%>
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
</body>
</html>