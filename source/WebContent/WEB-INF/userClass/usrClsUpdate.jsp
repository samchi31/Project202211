<%@page import="java.io.File"%>
<%@page import="common.ClsCategory"%>
<%@page import="userClass.vo.UsrClsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
UsrClsVO usrClsVO = (UsrClsVO)request.getAttribute("usrClsVO");
File file = new File(usrClsVO.getClassThumbnail());

%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

</head>
<body>

	<form action="UsrClsUpdate.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="classId" value="<%=usrClsVO.getClassId() %>">
		<div>
			<h2>썸네일설정</h2>
			<%=file.getName()%>
			<input type="hidden" name="old" value="<%=usrClsVO.getClassThumbnail()%>">
			<input type="file" name="thumbnail" value="<%=file.getName()%>">
		</div>

		<div>
			<h2>제목</h2>
			<input type="text" name="title" value="<%=usrClsVO.getClassTitle() %>">
		</div>
		
		<input name="category" type="hidden" value="<%=ClsCategory.valueOf(usrClsVO.getClsCtId()).getKor() %>">
		<div class="dropdown">
			<button class="btn btn-primary dropdown-toggle" type="button"
				data-toggle="dropdown" id="btn_dropdown">
				<%=ClsCategory.valueOf(usrClsVO.getClsCtId()).getKor() %> <span class="caret"></span>
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
		</input>

		<div>
			<h2>작성자id:<%=usrClsVO.getMemId() %></h2>
		</div>

		<div>
			<h2>내용테스트</h2>
		</div>

		<textarea id="summernote" name="content"><%=usrClsVO.getClassContent() %></textarea>

		<button>수정</button>
	</form>

	<button id="btn_cancel">취소</button>

	<script>

		$('#btn_cancel').on('click',function(){
			location.href="<%=request.getContextPath()%>/UsrClsList.do"
		});

		$(document).ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				height : 800, // 에디터 높이
				minHeight : null, // 최소 높이
				maxHeight : null, // 최대 높이
				focus : true, // 에디터 로딩후 포커스를 맞출지 여부
				lang : "ko-KR", // 한글 설정
				placeholder : '' //placeholder 설정

			});
		});
		
		$(".dropdown-menu li a").click(function(){		  
	 		  $("#btn_dropdown").html($(this).text()+' <span class="caret"></span>');
	 		 $("input[name=category]").val($(this).text());
		});
		
		$('input[name=thumbnail]').on('click',function(){
			$('input[name=old]').val("click");
		})
	</script>

</body>
</html>