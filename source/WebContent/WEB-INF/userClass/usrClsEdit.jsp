<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>재능기부 작성</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/funding.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script 
	src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<style>
.dropdown{
	width: 66.66666667%;
}
.col-sm-8 {
    margin-bottom: 8px;
}
.summernote{
    margin-top: 8px;
}
.btn-primary{
    margin: 7px 0px 7px 95px;
}
#disp{
    margin-top: 8px;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="bigWrap">
		<div class="container">
			<h2 class="f_title">재능 기부 등록
				<p>RegistClass</p>
			</h2>
			<div class="row">
				<form action="UsrClsEdit.do" method="post" enctype="multipart/form-data">
					
					<table class="col-sm-8" style="z-index:999">
					<tr>
						<td>썸네일</td>
						<td><input type="file" name="thumbnail" id="file"></td>
					</tr>
					<tr>
						<td></td>
						<td><div id="disp"><img id="img_disp" src="" alt=""></div></td>
					</tr>

					<tr>
						<td>제목</td>
						<td><input class="form-control" type="text" name="title"></td>
					</tr>
					</table>

					<input name="category" type="hidden">
					<div class="dropdown">
						<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" id="btn_dropdown">
							카테고리선택 <span class="caret"></span>
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

					<div class="summernote">
						<textarea id="summernote" name="detail"></textarea>
					</div>


					<button class="btn btn-info">저장</button>
					<button class="btn" id="btn_cancel">취소</button>
				</form>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function(){
			$('.menu_wrap').hide();
			$('.gnbmenu').mouseover(function(){
				$('.menu_wrap').slideDown();
			});
// 			$('.menu_wrap').mouseout(function(){
// 				$('.menu_wrap').hide();
// 			});
			$('.container').mouseover(function(){
				$('.menu_wrap').hide();
			});
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
		
		$('#btn_cancel').on('click',function(){
			location.href="<%=request.getContextPath()%>/UsrClsList.do"
		});

		// 썸네일 미리보기
		var v_fileBtn = document.querySelector("#file");
        var v_disp = document.querySelector("#disp");

        v_fileBtn.onchange = function(){
            var v_file = v_fileBtn.files[0]; 

            var rd = new FileReader();

            // img동적요소를 생성하고 appendChild
            rd.onload = function(){
            	document.querySelector("#img_disp").src = rd.result;
            	document.querySelector("#img_disp").width = 100;
//                 var v_img = document.createElement("img")
//                 v_img.src = rd.result;
//                 v_img.width = 100;
// //                 v_disp.appendChild(v_img);
//                 v_disp.innerHTML=v_img;
            }
            // readAsDataURL메소드 이용해 정보가공하고 result로 받을 준비
            rd.readAsDataURL(v_file);
        }
	</script>
</body>
</html>