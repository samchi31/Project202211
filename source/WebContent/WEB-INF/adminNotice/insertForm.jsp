<%@page import="notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>신규회원 등록</title>
<style>
	.table {
		border= 1px;
	}
</style>
<script>
	
</script>
</head>
<body>



	<h3 style="border-bottom: 1px solid lightgray;" > 공지사항 등록 </h3>
		<div class="container">
			<form action="/InsertNoticeController.do" method="post">
				  <div class="form-group">
				    <label for="noticeId">글번호</label>
				    <input type="text" class="form-control" name="noticeId" id="noticeId">
				  </div>
				  <div class="form-group">
				    <label for="memId">회원ID</label>
				    <input type="text" class="form-control" name="memId" id="memId">
				  </div>
				  <div class="form-group">
				    <label for="date">날 짜</label>
				    <input type="text" class="form-control" name="noticeDate" id="date">
				  </div>
				  <div class="form-group">
				    <label for="title">제 목</label>
				    <input type="text" class="form-control" name="noticeTitle" id="title">
				  </div>
				  <div class="form-group">
				    <label for="content">내 용</label>
				    <input type="text" class="form-control" name="noticeContent" id="content">
				  </div>
				  <div class="form-group">
				    <label for="pwd">첨부파일</label>
				    <input type="file" name="atchFile" multiple="multiple">
				  </div>
		  		<button type="submit" class="btn btn-default">Submit</button>
			</form>
	    </div>	  
	    


	    
	    
</body>
</html>