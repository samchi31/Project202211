<%@page import="funding.vo.FundingVO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String insName = (String) request.getAttribute("insName");
%>

<!DOCTYPE html>
<html>
<head>
    <title>후원 내역</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/funding.css">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
 	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="bigWrap">
    <div class="container">
        <h2 class="f_title">후원 내역 등록
        	<p>RegistFunding</p>
        </h2>
        <div class="row">
			<form action="Insert.do" method="post" enctype="multipart/form-data">
				<table class="col-sm-12">
					<tr>
						<td>아이디</td>
						<td><p><%=mv.getMemId()%></p></td>
					</tr>
					<tr>
						<td>기관명</td>
						<td><p><%= insName%></p></td>
					</tr>
					<tr>
						<td>후원타이틀:</td>
						<td><input class="form-control" type="text" name="fundingTitle" value=""></td>
					</tr>
					<tr>
						<td>목표금액:</td>
						<td><input class="form-control" type="text" name="targetAmount" value=""></td>
					</tr>
					<tr>
						<td>현재금액:</td>
						<td><input class="form-control" type="text" name="recentAmount" value="0"></td>
					</tr>
					<%
						DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
						DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
						String todate = LocalDate.now().format(formatter2);
					%>
					<tr>
						<td>시작날짜:</td>
						<td><input type="date" class="form-control"  min="<%=todate%>" id="fundingStartDate" name="fundingStartDate" required></td>
					</tr>
					<tr>
						<td>마감날짜:</td>
                        <td><input type="date" class="form-control"  min="<%=todate%>" id="fundingEndDate" name="fundingEndDate" required></td>
					</tr>
					<tr>
						<td>계좌번호:</td>
						<td><input class="form-control" type="text" name="fundingAccount" value=""></td>
					</tr>
					<tr>
						<td>예금주:</td>
						<td><input class="form-control" type="text" name="fundingAccountHolder" value=""></td>
					</tr>
					<tr>
						<td>은행명:</td>
						<td><input class="form-control" type="text" name="fundingBankName" value=""></td>
					</tr>
					<tr>
						<td>상세설명:</td>
						<td>
							<textarea id="summernote" name="fundingDetail"></textarea>
						</td>
					</tr>
					<tr>
						<td>썸네일:</td>
						<td><input type="file" name="thumbnail"></td>
					</tr>
					<tr style="width:100%;border-top:1px solid black;display:block">
						<td style="padding:50px 0"><input class="btn btn-primary" type="submit" value="후원 등록"></td>
					</tr>
				</table>
			</form>
		</div>
     	<a href="/funding/List.do" class="btn btn-success" style="float:right;margin:2% 0;width:150px">목록</a>
		<!-- 글 내용 수정 -->
    </div>
   </div>
 <script>
$(document).ready(function(){
	$('.menu_wrap').hide();
	$('.gnbmenu').mouseover(function(){
		$('.menu_wrap').slideDown();
	});
	$('.container').mouseover(function(){
		$('.menu_wrap').hide();
	});
});
//펀딩 내역 에디터
 $(document).ready(function() {
 	$('#summernote').summernote();
 });
	
 </script>
</body>
</html>