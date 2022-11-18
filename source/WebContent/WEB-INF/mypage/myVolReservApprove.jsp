<%@page import="volunteer.vo.ReservationVO"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	List<ReservationVO> approveList = (List<ReservationVO>)request.getAttribute("approveList");
	String memId = ((MemberVO) session.getAttribute("loginUser")).getMemId();
		

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
int size = approveList.size();
if (size > 0) {
	for (int i = 0; i < size; i++) {
%>
			<form >
				<div>
					<input type="hidden" name="reservId" value="<%= (approveList.get(i).getReservId()) %>">
					
			        [예약 번호]    <%= (approveList.get(i).getReservId()) %>
			        <a href="volDetail.do?volId=<%= (approveList.get(i).getVolId()) %>">
					[예약 봉사]   <%=(approveList.get(i).getVolId())%>
					</a>
					[예약한아이디]<%=(approveList.get(i).getMemId())%>
					[예약 날짜]   <%=(approveList.get(i).getReservDate()) %>
					[예약 시간]   <%=(approveList.get(i).getReservTime()) %>
					[신청 날짜]   <%=(approveList.get(i).getApplyDate()) %>
					[취소 날짜]   <%=(approveList.get(i).getCancelDate()) %>
					[예약 상태]   <%=(approveList.get(i).getrStId()) %>
					
					<button type="submit" formaction="/volReservUpdate.do?reservId=<%=(approveList.get(i).getReservId())%>" formmethod="get">수정</button>
					<button type="submit" formaction="/volReservCancel.do?reservId=<%=(approveList.get(i).getReservId())%>" formmethod="get">취소</button>
				</div>
			</form>
<%
		}
	} else {
%>
		조회된 데이터가 없습니다.
<%
	}
%>
	</div>

</body>