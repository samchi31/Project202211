<%@page import="volunteer.vo.VolunteerVO"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String memId = ((MemberVO) session.getAttribute("loginUser")).getMemId();
	List<VolunteerVO> volList = (List<VolunteerVO>) request.getAttribute("volList");

%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript"></script>
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
div {
	border: 1px solid black
}
.media-left {
	width: 30%;
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
	int size = volList.size();
	int k = 0;

	if (size > 0) {
		for (int i = 0; i < size; i++) {

%>
			
			<div class="volList-group">
				<div class="media">	
					<div class="media-left">
						<img src="<%=(volList.get(i).getThumbnail())%>"  class="media-object" style="width:100%"/>
					</div>
					<div class="media-body">
						<!-- session -->
				        <a href="volDetail.do?volId=<%= (volList.get(i).getVolId()) %>&memId=<%= (memId) %>" class="volList-group-item media-heading"><h1>[<%=(volList.get(i).getVolCtId().getKorName())%>]<%=(volList.get(i).getVolTitle())%></h1>
						[모집 기간]   <%=(volList.get(i).getStartDate())%> ~ <%=(volList.get(i).getEndDate())%> <br>
						[모집 시간]   <%=(volList.get(i).getStartTime())%> ~ <%=(volList.get(i).getEndTime())%> <br>
						[신청 인원]   <%=(volList.get(i).getTotal())%> / <%=(volList.get(i).getPersonnel())%> <br> 
						[봉사 장소]   <%=(volList.get(i).getLocation())%> <br>
						[모집 상태]   <%=(volList.get(i).getStatus().getKorName())%> <br>
						[봉사 대상]   <%=(volList.get(i).getTarget())%> <br>
						[자격 요건]   <%=(volList.get(i).getQualification())%><br>
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
	</div>

</body>