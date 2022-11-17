<%@page import="member.vo.InsVO"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
	MemberVO memVo = (MemberVO) session.getAttribute("loginUser");
%>


<!DOCTYPE html>
<html lang="en">
<body>

<p>로그인 된 화면</p>
<li><a href="<%=request.getContextPath()%>/member/logout.do"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
<li><a href="<%=request.getContextPath()%>/mypage/detail.do?<%=memVo.getMemId()%>">마이페이지</a></li>

</body>
</html>