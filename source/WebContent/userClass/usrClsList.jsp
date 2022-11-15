<%@page import="userClass.vo.UsrClsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
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
<title>Document</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
.wrapper {
	width: 100%;
}

img {
	width: 100%;
}

#div_page{
	clear:both;
}

#pagelist {
	display: flex;
	justify-content: center;
}

#search{
	display: flex;
	justify-content:center;
}

</style>


</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1>재능기부</h1>
			<p>여러분들의 재능을 뽐내보세요</p>
		</div>
		<p></p>
		<div id="search">
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
			<div>
				<input class="form-control" id="textSearch" type="text" placeholder="Search..">
				<button id="btn_search"><span class="glyphicon glyphicon-search"></span></button>
			</div>
		</div>

		<div class="wrapper">
			<%
				for (int i = 0; i < clsList.size(); i=i+3) {
			%>
			<div class="row">
				<%
 					for (int j = 0;(i+j < clsList.size()) &&  j < 3; j++) {
 						if(clsList.get(i+j) != null) {
				%>
				<div class="col-xs-3">
					<div class="thumbnail">
						<a href="<%=request.getContextPath()%>/UsrClsDetail.do?classId=<%=clsList.get(i+j).getClassId()%>">
							<img src="<%=clsList.get(i+j).getClassThumbnail()%>" alt="">
							<div class="caption">
								<h4 class="list-group-item-heading"><%=clsList.get(i+j).getClassTitle()%></h4>
								<p class="list-group-item-text">
									<span class="glyphicon glyphicon-tag"><%=clsList.get(i+j).getClsCtId()%> </span> <span
										class="glyphicon glyphicon-eye-open"><%=clsList.get(i+j).getClassViews()%></span>
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
			<div>
				현재페이지:<%=currentPage%>
			</div>
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

		<button id="btn_write">글쓰기</button>
	</div>
	
	<script>
	
	$("#btn_write").on('click',function(){
		location.href="<%=request.getContextPath()%>/UsrClsEdit.do";
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

		
	</script>
</body>
</html>
