<%@page import="notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String memId = ((MemberVO) session.getAttribute("loginUser")).getMemId();
	
	List<NoticeVO> noticeList = (List<NoticeVO>) request.getAttribute("noticeList"); //겟파라미터는: 담아놓은 걸 꺼낼때
	int perPage = (int) request.getAttribute("perPage");
	int startPage = (int) request.getAttribute("sPage");
	int endPage = (int) request.getAttribute("ePage");
	int totalPage = (int) request.getAttribute("ttPage");
	int currentPage = (int) request.getAttribute("cPage");
	
	//msg를 꺼내서 담음	
	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	//한번 꺼내왔으면 제거해주기
	session.removeAttribute("msg");

%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지(공지사항)</title>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/mypage.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
#pagelist {
	display: flex;
	justify-content: center;
	overflow: hidden
}

</style>
</head>
<body>
<%@ include file="../header.jsp"%>
<%@ include file="side.jsp"%>
	<div id="wrapper">
		<h1 class="title">공지사항
			<p>Notice</p>
		</h1>
		<ul class="wrapper_inner">
			<div class="col_line ">
				<table class="table table-hover notice_table">
				    <thead>
				      <tr>
				        <th width="60%">제목</th>
				        <th class="col-xs-4">날짜</th>
				        <%if("admin".equals(memId)) {%>
					        <th class="col-xs-2">수정</th>
					        <th class="col-xs-2">삭제</th>
				        <%} %>
				      </tr>
				    </thead>
			    <tbody>
		
				<% 
					int memSize = noticeList.size(); //꺼내기
					if(memSize > 0) {
						for(int i=0; i<memSize; i++) {
				%>			
				<tr>
					<td><a href="detail.do?noticeId=<%=noticeList.get(i).getNoticeId() %>"><%=noticeList.get(i).getNoticeTitle() %></a></td>
					<td class="col-xs-4 hi"><%=noticeList.get(i).getNoticeDate() %></td>
					<%if("admin".equals(memId)) {%>
						<td class="col-xs-2"><a href="<%=request.getContextPath()%>/UpdateNoticeController.do?noticeId=<%=noticeList.get(i).getNoticeId()%>" type="button" class="btn btn-warning">수정</a></td>
						<td class="col-xs-2"><a href="<%=request.getContextPath()%>/deleteNotice.do?noticeId=<%=noticeList.get(i).getNoticeId()%>" class="btn btn-danger">삭제</a></td>
					<%} %>
				</tr>
				<%
						}
						
					} else {
				%>		
				<tr>
					<td colspan="4">조회된 데이터가 없습니다.</td>
				</tr>
				<%
					}
				%>		
			    </tbody>
		  </table>
		  <%if("admin".equals(memId)) {%>
		  	<a href="InsertNoticeController.do" type="button" class="btn btn-default" >글 등록</a>
		  <%} %>
	
			</div>
			
			<!-- --------------페이지영역-------------- -->
			<div id="div_page">
				<div id="pagelist">
					<ul class="pager">
						<li><a class="prev" href="#">Prev</a></li>
					</ul>
					<ul class="pagination pager">
						<%
							for (int i = startPage; i < endPage; i++) {
							if (currentPage == i) {
						%>
						<li class="active"><a class="paging" href="#"><%=i%></a></li>
						<%
							} else {
						%>
						<li><a class="paging" href="#"><%=i%></a></li>
						<%
							}
						}
						%>
					</ul>
					<ul class="pager">
						<li><a class="next" href="#">Next</a></li>
					</ul>
				</div>
			</div>
			<!-- --------------페이지영역-------------- -->
		</div>   
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


<% if(msg.equals("성공")) { //msg가 성공이 맞다면 만들어지는 구조 %>
	alert("정상적으로 처리되었습니다");
<% } %>
</script>
</body>