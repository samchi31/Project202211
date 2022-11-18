<%@page import="notice.vo.AtchFileVO"%>
<%@page import="notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
NoticeVO nv = (NoticeVO) request.getAttribute("nv");

List<AtchFileVO> atchFileList = (List<AtchFileVO>) request.getAttribute("atchFileList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/common.css">


<title>회원정보 변경</title>
<style>
	.container {
		width: 100%;
	}
	
	.row {
		width: 90%;
		margin: 0 auto;
	}
	
	.f_title {
		font-weight: bold;
		font-family: 'GmarketSansMedium', sans-serif;
		font-weight: bold;
	}
	
	.f_title p {
		position: absolute;
		opacity: 0.1;
		font-size: 100px;
		top: -5%;
		color: #ccc
	}

	.container {
    	margin-top: 70px;
    }

</style>
</head>
<body>
<%@ include file="../header.jsp"%>

	<%-- 	<input type="hidden" name="atchFileId" value="<%=mv.getAtchFileId() %>"> --%>

	<div class="container">
		<h1 class="f_title">
			공지사항 수정
			<p>Notice</p>
		</h1>
		<form action="/UpdateNoticeController.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="noticeId" value="<%=nv.getNoticeId()%>">
			<input type="hidden" name="memId" value="<%=nv.getMemId()%>">
<!-- 			<input type="hidden" name="noticeDate" -->
<%-- 				value="<%=nv.getNoticeDate()%>"> --%>
			<div class="row">
				<div class="form-group">
					<label for="title">제 목</label> <input type="text"
						class="form-control" name="noticeTitle"
						value="<%=nv.getNoticeTitle()%>">
				</div>
				<div class="form-group">
					<label for="content">내 용</label> <input type="text"
						class="form-control" name="noticeContent"
						value="<%=nv.getNoticeContent()%>" style="height: 200px">
				</div>


				<tr>
					<td>기존 첨부파일:</td>
					<td>
					<%
					if(atchFileList != null) { 
						for(AtchFileVO fileVO : atchFileList) {
					%>
						<div>
							<a href="<%=request.getContextPath()%>/AtchFileDownload.do?atchId=<%=fileVO.getAtchId() %>&fileSn=<%=fileVO.getAtchSn()%>"><%=fileVO.getAtchName()%></a>
						</div> 
					<%
						} 
					}
					%>

					</td>
				</tr>

				<tr>
					<td>새로운 첨부파일:</td>
					<td>
						<input type="hidden" name="isChange" value="no">
						<input type="file" name="atchFile" multiple>
					</td>
				</tr>
				<input type="submit" value="글 수정">
			</div>
		</form>
	</div>
	
	<script>
	$('input[name=atchFile]').on('click',function(){
		$('input[name=isChange]').val("yes");
	});
	
	
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