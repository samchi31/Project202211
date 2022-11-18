<%@page import="qna.vo.QnaVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<%
    QnaVO qv = (QnaVO)request.getAttribute("qv");


%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/common.css">
<title>QNA 상세내용</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
    th {
        text-align: center;
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
	 
    .container {
    	margin-top: 70px;
    }
    
</style>
</head>
<body>
<%@ include file="../header.jsp"%>
	<form action="/UpdateAdminQnaController.do" method="post">
	<input type="hidden" name="inquiryId" value="<%=qv.getInquiryId() %>">
	
		<div class="container">
		<h1 class="f_title">QNA 게시판
			<p>Question&Answer</p>
		</h1>
			<div class="row">
			
				<table border="1" class="table table-bordered">
					<tr>
						<th>문의번호</th>
						<td><%=qv.getInquiryId() %></td>
					</tr>
					
					<tr>
						<th>회원ID</th>
						<td><%=qv.getMemId() %></td>
					</tr>
					
					<tr>
						<th>제 목</th>
						<td><%=qv.getInquiryTitle() %></td>
					</tr>
					
					<tr height="150">
						<th>문의내용</th>
						<td><%=qv.getInquiryContent() %></td>
					</tr>
					
					
					<tr height="150">
						<th>답변내용</th>
	<%
					if(qv.getAnswerContent() == null) {
	%>				
						<td>
						<input type="text" class="form-control" name="answerContent" id="content" style="height:200px">
						</td>
	<%					
					} else {
	%>					
					<td><%=qv.getAnswerContent() %></td>
	<%				}%>							
					</tr>
					
					
					<tr>
						<th>답변날짜</th>
	<%
					if(qv.getAnswerDate() == null) {
	%>				
						<td>미응답</td>
	<%					
					} else {
	%>					
					<td><%=qv.getAnswerDate() %></td>
	<%				}%>	
					</tr>
				</table>
				
				
			<%-- ///////////////////////////  버튼영역  /////////////////////////// --%>
			
			<button type="button" class="btn btn-default" style="float:right"><a href="/ListQnaController.do">목록</a></button>
	<%
	
					if(qv.getAnswerDate() == null) {
	%>				
			<button  class="btn btn-default" style="float:right">답변하기</button>
	<%				}	%>			
	
			</div>
			
			
			
		</div>
		
	</form>
<script>
	$(document).ready(function(){
		$('.menu_wrap').hide();
		$('.gnbmenu').mouseover(function(){
			$('.menu_wrap').slideDown();
		});
		$('.menu_wrap').mouseout(function(){
			$('.menu_wrap').hide();
		});
	});	

</script>
</body>
</html>