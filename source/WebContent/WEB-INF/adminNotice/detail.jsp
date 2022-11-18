<%@page import="notice.vo.AtchFileVO"%>
<%@page import="notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<%
	NoticeVO nv = (NoticeVO)request.getAttribute("nv");
	
	List<AtchFileVO> atchFileList = (List<AtchFileVO>) request.getAttribute("atchFileList");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세내용</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/common.css">

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
	 
	.btn btn-default {
		float: right;
	}
	 
	.container {
    	margin-top: 70px;
    }
    th{
    	width: 20%;
    }
	 
	 
</style>
</head>
<body>
<%@ include file="../header.jsp"%>
	<div class="container">
	<h1 class="f_title">공지사항 내용
		<p>Notice</p>
	</h1>
		<div class="row">
			<table border="1" class="table table-bordered">
				<tr>
					<th>NoticeID</th>
					<td><%=nv.getNoticeId() %></td>
				</tr>
				<tr>
					<th>userID</th>
					<td><%=nv.getMemId() %></td>
				</tr>
				<tr>
					<th>날 짜</th>
					<td><%=nv.getNoticeDate() %></td>
				</tr>
				<tr>
					<th>제 목</th>
					<td><%=nv.getNoticeTitle() %></td>
				</tr>
				<tr height="150">
					<th>내 용</th>
					<td><%=nv.getNoticeContent() %></td>
				</tr>
				<tr> 
					<td>첨부파일</td>
					<td> 
					<%
		 				if(atchFileList != null) {
		 					for(AtchFileVO fileVO : atchFileList) {
		 			%>	
					<div><a href="<%=request.getContextPath() %>/AtchFileDownload.do?atchId=<%=fileVO.getAtchId() %>&fileSn=<%=fileVO.getAtchSn()%>"><%=fileVO.getAtchName()%></a></div>
					<%
							}
		 				}
					%>
					
					
					
					</td>
				</tr>
				<tr>
				</tr>
			</table>
		</div>
		
		<button class="btn btn-default" ><a href="<%=request.getContextPath() %>/ListNoticeController.do">목록</a></button>
	</div>
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