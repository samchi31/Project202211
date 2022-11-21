<%@page import="member.vo.MemberVO"%>
<%@page import="userClass.vo.UsrClsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
MemberVO memberVO = (MemberVO) request.getSession().getAttribute("loginUser");

List<UsrClsVO> clsList = (List<UsrClsVO>) request.getAttribute("list");
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
<title>재능기부 목록</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/usrCls.css">

<style>

</style>


</head>
<body>
<%
if(memberVO==null){
%>
	<%@ include file="../header.jsp"%>
<%
}else{
%>
	<%@ include file="../WEB-INF/header.jsp"%>
<%
}
%>
	<div class="bigWrap container">
		<div class="f_title row">
			<h1>재능기부</h1>
			<p>CLASS</p>
		</div>
		<p><br></p>
		<div id="search row" style="margin-left:50%; margin-top:30px; float:right">
			<ul style="display: inline-block;">
				<li style="display: inline-block;">
					<div class="dropdown">
						<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
							<%=category %> 
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#">전체</a></li>
							<li class="divider"></li>
							<li><a href="#">교육</a></li>
							<li><a href="#">체육</a></li>
							<li><a href="#">음악</a></li>
							<li><a href="#">디자인</a></li>
							<li><a href="#">언어</a></li>
						</ul>
					</div>
				</li>
				<li style="display: inline-block;">
					<input class="form-control col-sm" id="textSearch" type="text" placeholder="Search..">
				</li>
				<li style="display: inline-block;">
					<button id="btn_search" class="btn"><span class="glyphicon glyphicon-search"></span></button>
				</li>	
			</ul>
			<button id="btn_write" style="display: inline-block; margin-left:5px" class="btn">글쓰기</button>
		</div>

		<div class="wrapper row">
			<%
				for (int i = 0; i < clsList.size(); i=i+4) {
			%>
			<div class="row">
				<%
 					for (int j = 0;(i+j < clsList.size()) &&  j < 4; j++) {
 						if(clsList.get(i+j) != null) {
				%>
				<div class="col-xs-3">
					<div class="thumbnail">
						<a href="<%=request.getContextPath()%>/UsrClsDetail.do?classId=<%=clsList.get(i+j).getClassId()%>">
							<img src="<%=clsList.get(i+j).getClassThumbnail()%>" alt="">
							<div class="caption">
								<h4 class="list-group-item-heading f_title"><%=clsList.get(i+j).getClassTitle()%></h4>
								<p>
									<span class="glyphicon glyphicon-tag"></span>&nbsp;&nbsp;<%=clsList.get(i+j).getClsCtId()%>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;<%=clsList.get(i+j).getClassViews()%>
								</p>
								<!--<p class="list-group-item-text glyphicon "> -->
								<!--<span class="label label-primary">category1</span>  -->
								<!--<span class="glyphicon glyphicon-eye-open">11</span> -->
								<!--</p> -->
							</div>
						</a>
					</div>
				</div>
				<%
 						}
					}
				%>
			</div>
			<%
				}
			%>
		</div>

		<div id="div_page">
			<!-- 		페이지영역 -->
			<div id="pagelist">
				<ul class="pager">
					<li><a class="prev" href="#">Prev</a></li>
				</ul>
				<ul class="pagination pager">
					<%
						for (int i = startPage; i <= endPage; i++) {

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
	</div>
	
	<script>
	
	$("#btn_write").on('click',function(){
		<%
		if(memberVO != null){
		%>
			location.href="<%=request.getContextPath()%>/UsrClsEdit.do";
		<%
		} else {
		%>
			alert("로그인 후 이용 가능합니다");
			location.href="<%=request.getContextPath()%>/member/LoginForm.jsp";
		<%
		} 
		%>
	});
	
	<%if (msg.equals("성공")) {%>
		alert("정상적으로 처리되었습니다");
	<%}%>
	
	$(".dropdown-menu li a").click(function(){		  
// 		  $(".btn:first-child").html($(this).text()+' <span class="caret"></span>');	
		  location.href="<%=request.getContextPath()%>/UsrClsList.do?category="+$(this).text();
	});
	
	$('#btn_search').on('click', function(){
		location.href="<%=request.getContextPath()%>/UsrClsList.do?category="+"<%=category %>"
				+"&search="+$('#textSearch').val();
	});
	
	//페이지 번호 클릭이벤트
	$(".paging").on('click',function(){
	   // alert($(this).text());
	   location.href="/UsrClsList.do?pageNo=" + $(this).text();
	});

	let currentPage;
	// 이전버튼 클릭이벤트
	$(".prev").on('click', function(){
	   if(<%=currentPage%> == 1){
	      currentPage = <%=currentPage%>;
	   } else{
	      currentPage = <%=currentPage%> - 1;
	   } location.href="/UsrClsList.do?pageNo=" + currentPage;
	}); 

	// 다음버튼 클릭이벤트
	$(".next").on('click', function(){
	   if(<%=currentPage%> == <%=totalPage%>){
	      currentPage = <%=currentPage%>;
	   } else{
	      currentPage = <%=currentPage%> + 1;
	   } location.href="/UsrClsList.do?pageNo=" + currentPage;
	}); 
	
	
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
