<%@page import="qna.vo.QnaVO"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String memId = ((MemberVO) session.getAttribute("loginUser")).getMemId();
	List<QnaVO> adminQnaList = (List<QnaVO>) request.getAttribute("adminQnaList"); //겟파라미터는: 담아놓은 걸 꺼낼때

	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/mypage.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    .row.content {height: 450px}
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }    
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }    
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
     .pager {
    	float: left;
    }
    .p1 {
    	display: flex;
    	justify-content: space-between;
    	padding: 15px;
    }   
    
	.btn {
		float: right;
	}
	.container {
		width: 100%;
	}
	.row {
		width:90%; margin:0 auto;
	}
	
	.f_title {
	   font-weight: bold; 
	   font-family:'GmarketSansMedium', sans-serif ;font-weight:bold;
	}

	.f_title p {
	   position:absolute;
	   opacity:0.1;
	   font-size:100px;
	   top:-5%;
	   color:#ccc
	 }
	#pagelist {
    	display: flex;
    	justify-content: center;
    }
    
    .container {
    	margin-top: 70px;
    }
 
 
</style>
</head>
<body>
<%@ include file="../header.jsp"%>
<%@ include file="side.jsp"%>
<div id="wrapper">
	<h1 class="title">
		QNA 게시판
		<p>QNA</p>
	</h1>
	<ul class="wrapper_inner">
		<div class="col_line ">
			<table class="table table-hover notice_table">
				<thead>
					<tr>
						<th width="50%">제 목</th>
<!-- 						<th style="text-align: center" width="15%">작성ID</th> -->
						<th style="text-align: center" width="15%">문의날짜</th>
						<th style="text-align: center" width="20%">답변날짜</th>
					</tr>
				</thead>
				<tbody>

					<%
						int memSize = adminQnaList.size(); //꺼내기
					if (memSize > 0) {
						for (int i = 0; i < memSize; i++) {
							if(adminQnaList.get(i).getMemId().equals(memId)){
					%>
					<tr>
						<td><a
							href="DetailQnaController.do?inquiryId=<%=adminQnaList.get(i).getInquiryId()%>"><%=adminQnaList.get(i).getInquiryTitle()%></a></td>
<%-- 						<td style="text-align: center"><%=adminQnaList.get(i).getMemId()%></td> --%>
						<td style="text-align: center"><%=adminQnaList.get(i).getInquiryDate()%></td>
						<%
							if (adminQnaList.get(i).getAnswerContent() == null) {
						%>
						<th style="text-align: center" width="20%">미응답</th>
						<%
							} else {
						%>
						<td style="text-align: center"><%=adminQnaList.get(i).getAnswerDate()%></td>
						<%
							}
						%>
					</tr>
					<%
							}
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
			<%
				if (msg.equals("성공")) { //msg가 성공이 맞다면 만들어지는 구조
			%>

			<%
				}
			%>
		</div>
	</ul>
	<%-- PAGINATION --%>
	<c:set var="currentPage" value="${requestScope.cPage}"></c:set>
	<%-- 현재페이지: <c:out value="${currentPage}" /> --%>
	<div id="pagelist">
		<ul class="pager" style="float:center;">
			<li><a class="prev" href="#">Prev</a></li>
		</ul>
		<ul class="pagination" style="float:center;">
			<c:forEach var="i" begin="${requestScope.sPage}" end="${requestScope.ePage}">
	  		
	  		<c:if test="${currentPage == i}">
	  			<li class="active"><a class="paging" href="#">${i}</a></li>
	  		</c:if>
	  		<c:if test="${currentPage != i}">
	  			<li><a class="paging" href="#">${i}</a></li>
	  		</c:if>
	  	</c:forEach>
		</ul>
		<ul class="pager" style="float: left;">
			<li><a class="next" href="#">Next</a></li>
		</ul>	
	</div>
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
$(".paging").on('click',function(){
	location.href="/myQna.do?pageNo=" + $(this).text();
	
});
	
//이전버튼 클릭 이벤트
let currentPage;

$(".prev").on('click',function(){
	if(${currentPage} == 1){
		currentPage = ${currentPage};
	} else {
		currentPage = ${currentPage} - 1;
	}
	location.href="/myQna.do?pageNo=" + currentPage;
});
	
//다음버튼 클릭 이벤트
$(".next").on('click',function(){
	if(${currentPage} == ${requestScope.ttPage}) {
		currentPage = ${currentPage};
	} else {
		currentPage = ${currentPage} + 1;
	}
	location.href="/myQna.do?pageNo=" + currentPage;
});
<%-- PAGINATION --%>	
</script>
</body>