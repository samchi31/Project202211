<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>


<script
	src="https://cdn.ckeditor.com/ckeditor5/35.3.0/classic/ckeditor.js"></script>


<style>

#editor{
	
	display:none;
	height:300px;	

}


</style>
</head>
<body>
<form action="UsrClsEdit.do" method="post" enctype="multipart/form-data">
	<div>
	<h2>썸네일설정</h2>
	<input type="file" name="thumbnail">
	</div>
	
	<div>
	<h2>제목</h2>
	<input type="text" name="title">
	</div>
	
	<div>
	<h2>내용테스트</h2>
	<input type="text" name="content">
	</div>
	
	<div>
	CKEditor, summernote 써보세요
	댓글 대댓글은 계층형 쿼리
	계층형 게시판
	start with
	connect by prior
	</div>

	<div id="editor">글을 적어줘~</div>
	
	<button>저장</button>
	<button></button>
</form>	
	
	<script>
	let ckEditor;
	
	ClassicEditor.create( document.querySelector('#editor'), {
		ckfinder:{
			uploadUrl:'/imageUpload'
		}
	})
	.then( newEditor => {
        //console.log( ckEditor );
		ckEditor = newEditor;
    }).then( ckEditor => {
    	Window.editor = ckEditor;
    }).catch( error => {
            console.error( error );
    });
	
    </script>
</body>
</html>