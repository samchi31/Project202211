<%@page import="volunteer.vo.ReservationVO"%>
<%@page import="common.VolStatus"%>
<%@page import="common.VolCategory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<ReservationVO> reservList = (List<ReservationVO>)request.getAttribute("reservList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온(ON:溫)</title>
</head>
<body>
	<h1>예약 목록</h1>
<%
	int size = reservList.size();
	if (size > 0) {
		for (int i = 0; i < size; i++) {

			// if expired, rejected, canceled면 취소 버튼 안 나오게
%>
<form >
	<div>
		<input type="hidden" name="reservId" value="<%= (reservList.get(i).getReservId()) %>">
		<input type="hidden" name="memId" value="<%= (reservList.get(i).getMemId()) %>">
		
        [예약 번호]    <%= (reservList.get(i).getReservId()) %>
        <a href="volDetail.do?volId=<%= (reservList.get(i).getVolId()) %>">
		[예약 봉사]   <%=(reservList.get(i).getVolId())%>
		</a>
		[예약한아이디]<%=(reservList.get(i).getMemId())%>
		[예약 날짜]   <%=(reservList.get(i).getReservDate()) %>
		[예약 시간]   <%=(reservList.get(i).getReservTime()) %>
		[신청 날짜]   <%=(reservList.get(i).getApplyDate()) %>
		[취소 날짜]   <%=(reservList.get(i).getCancelDate()) %>
		[예약 상태]   <%=(reservList.get(i).getrStId()) %>
		
		<button type="submit" formaction="volReservUpdate.do?reservId=<%=(reservList.get(i).getReservId())%>" formmethod="get">수정</button>
		<button type="submit" formaction="volReservCancel.do?reservId=<%=(reservList.get(i).getReservId())%>" formmethod="get">취소</button>
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
	<button type="button" onclick="location.href='volList.do'">봉사 프로그램 목록</button>
</body>
</html>