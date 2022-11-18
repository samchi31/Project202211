<%@page import="userClass.vo.UsrClsVO"%>
<%@page import="member.vo.MemberVO"%>
<%@page import="volunteer.vo.ReservationVO"%>
<%@page import="common.VolStatus"%>
<%@page import="common.VolCategory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String memId = ((MemberVO) session.getAttribute("loginUser")).getMemId();
	List<UsrClsVO> clsList = (List<UsrClsVO>) request.getAttribute("list");
	int perPage = (int) request.getAttribute("perPage");
	int startPage = (int) request.getAttribute("sPage");
	int endPage = (int) request.getAttribute("ePage");
	int totalPage = (int) request.getAttribute("ttPage");
	int currentPage = (int) request.getAttribute("cPage");

	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	session.removeAttribute("msg");	// 세션은 계속 유지되니 속성값 삭제

	String category= request.getParameter("category") == null? "카테고리 선택" : request.getParameter("category");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		<div class="wrapper">
			<%
				for (int i = 0; i < clsList.size(); i++) {
			%>
			<div>
						<a href="<%=request.getContextPath()%>/UsrClsDetail.do?classId=<%=clsList.get(i).getClassId()%>"><%=clsList.get(i).getClassId()%></a>
						<%=clsList.get(i).getClassTitle()%>
						<%=clsList.get(i).getClsCtId()%>
						<%=clsList.get(i).getClassViews()%>
			</div>
			<%
				}
			%>
		</div>

	</div>
</body>
</html>