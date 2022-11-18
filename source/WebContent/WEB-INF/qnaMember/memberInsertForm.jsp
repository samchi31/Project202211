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

<link rel="stylesheet" href="../css/common.css">
<title>신규회원 등록</title>
<style>
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
	 
	 
	.container {
    	margin-top: 70px;
    }
	
</style>
<script>
	
</script>
</head>
<body>
<%@ include file="../header.jsp"%>
	<div class="container">
	<h1 class="f_title">QNA 등록
		<p>Question&Answer</p>
	</h1>	
		<form action="/InsertMemberQnaController.do" method="post">
<%-- 		<input type="hidden" name="inquiryId"> --%>
			<div class="row">  
				  <div class="form-group">
				    <label for="memId">회원 ID</label>
				    <input type="text" class="form-control" name="memId" id="memId">
				  </div>
				  <div class="form-group">
				    <label for="title">제 목</label>
				    <input type="text" class="form-control" name="inquiryTitle" id="title">
				  </div>
				  <div class="form-group">
				    <label for="content">내 용</label>
				    <input type="text" class="form-control" name="inquiryContent" id="content" style="height:200px">
				  </div>
		  		<button type="submit" class="btn btn-default">등록</button>
			</div>
		</form>  
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