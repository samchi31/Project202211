<%@page import="qna.vo.QnaVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	List<QnaVO> adminQnaList = (List<QnaVO>) request.getAttribute("adminQnaList"); //겟파라미터는: 담아놓은 걸 꺼낼때
	//msg를 꺼내서 담음
	
	
	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	//한번 꺼내왔으면 제거해주기
	session.removeAttribute("msg");
%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/common.css">
<title>QNA</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/noticeInquiry.css">


</head>
<body>
<%@ include file="../header.jsp"%>
	<div class="bigWrap">
		<div class="container">
			<h1 class="f_title">QNA 게시판 (admin)
				<p>QnA</p>
			</h1>
			<div class="row">
			<table class="table table-hover notice_table">
			    <thead>
			      <tr>
			        <th width="50%">제 목</th>
			        <th style="text-align:center" width="15%">작성ID</th>
			        <th style="text-align:center" width="15%">문의날짜</th>
			        <th style="text-align:center" width="20%">답변날짜</th>
	
			        
			      </tr>
			    </thead>
		    <tbody>
		
		<% 
			int memSize = adminQnaList.size(); //꺼내기
			if(memSize > 0) {
				for(int i=0; i<memSize; i++) {
		%>			
				<tr>
					<td><a href="DetailQnaController.do?inquiryId=<%= adminQnaList.get(i).getInquiryId() %>"><%=adminQnaList.get(i).getInquiryTitle() %></a></td>
					<td style="text-align:center"><%=adminQnaList.get(i).getMemId() %></td>
					<td style="text-align:center"><%=adminQnaList.get(i).getInquiryDate() %></td>
	<%
					if(adminQnaList.get(i).getAnswerContent() == null) {
	%>				
						<th style="text-align:center; color: Firebrick;" width="20%">미응답</th>
	<%					
					} else {
	%>					
					<td style="text-align:center"><%=adminQnaList.get(i).getAnswerDate() %></td>
	<%				}%>				
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
		  
		
		<%
			if(msg.equals("성공")) { //msg가 성공이 맞다면 만들어지는 구조
		%>
			
		
		<%
			} 
		%>
			</div>
		</div>
	</div>	
	
	
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
	

	
<script>

	$(".paging").on('click',function(){
		location.href="/ListQnaController.do?pageNo=" + $(this).text();
		
	});
	
	
//이전버튼 클릭 이벤트
	let currentPage;
	
	$(".prev").on('click',function(){
		if(${currentPage} == 1){
			currentPage = ${currentPage};
		} else {
			currentPage = ${currentPage} - 1;
		}
		location.href="/ListQnaController.do?pageNo=" + currentPage;
	});
	
//다음버튼 클릭 이벤트
	$(".next").on('click',function(){
		if(${currentPage} == ${requestScope.ttPage}) {
			currentPage = ${currentPage};
		} else {
			currentPage = ${currentPage} + 1;
		}
		location.href="/ListQnaController.do?pageNo=" + currentPage;
	});
	<%-- PAGINATION --%>	
	
	
	$(document).ready(function(){
		$('.menu_wrap').hide();
		$('.gnbmenu').mouseover(function(){
			$('.menu_wrap').slideDown();
		});
		$('.bigWrap').mouseout(function(){
			$('.menu_wrap').hide();
		});
	});		
	
</script>	
	
</body>
</html>