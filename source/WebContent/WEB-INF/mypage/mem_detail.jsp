<%@page import="member.vo.InsVO"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	MemberVO Mv = (MemberVO) request.getAttribute("mv");
	InsVO iv = (InsVO) request.getAttribute("iv");
	String msg = session.getAttribute("msg") == null ? "" : session.getAttribute("msg").toString();
	session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지:회원정보수정</title>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/mypage.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../header.jsp"%>
<%@ include file="side.jsp"%>

<div id="wrapper">
	<h1 class="title">회원정보<p>Profile</p></h1>
	<ul class="wrapper_inner">
		<div class="col_line">
			<div class="col_inner2">ID</div>
			<div class="col_inner2"><%=Mv.getMemId()%></div>
		</div>

		<div class="col_line">
			<div class="col_inner2">비밀번호</div>
			<div class="col_inner2"><%=Mv.getMemPass()%></div>
		</div>
		<%
			if (iv != null) {
		%>

		<div class="col_line">
			<div class="col_inner2">기관명</div>
			<div class="col_inner2"><%=iv.getInstName()%></div>
		</div>

		<div class="col_line">
			<div class="col_inner2">첨부파일</div>
			<div class="col_inner2"><%=iv.getAtchCourse()%></div>
		</div>
		<%
			}
		%>
		<div class="col_line">
			<div class="col_inner2">이름</div>
			<div class="col_inner2"><%=Mv.getMemName()%></div>
		</div>

		<div class="col_line">
			<div class="col_inner2">주민번호</div>
			<div class="col_inner2"><%=Mv.getRegno1()%>
									ㅡ <%=Mv.getRegno2()%></div>
			</div>

		<div class="col_line">
			<div class="col_inner2">연락처</div>
			<div class="col_inner2"><%=Mv.getMemTel()%></div>
		</div>

		<div class="col_line">
			<div class="col_inner2">이메일</div>
			<div class="col_inner2"><%=Mv.getMail()%></div>
		</div>

		<div class="col_line">
			<div class="col_inner2">우편번호</div>
			<div class="col_inner2"><%=Mv.getMemZip()%></div>
		</div>

		<div class="col_line">
			<div class="col_inner2">주소</div>
			<div class="col_inner2"><%=Mv.getMemAddr1()%></div>
		</div>

		<div class="col_line">
			<div class="col_inner2">상세주소</div>
			<div class="col_inner2"><%=Mv.getMemAddr2()%></div>
		</div>

		<div id="select" class="col_line">
			<div id=option class="update">
				<a class="btn btn-warning" href="/mypage/memUpdate.do?memId=<%=Mv.getMemId()%>">회원정보 수정</a>
			</div>
		</div>

		<div id="select" class="col_line">
			<input type="button" id="delete" class="delete btn btn-default" value="회원탈퇴">
		</div>
	</ul>
</div>
</body>
<script>
$(document).ready(function(){
	$('.menu_wrap').hide();
	$('.gnbmenu').mouseover(function(){
		$('.menu_wrap').slideDown();
	});
	$('#wrapper').mouseover(function(){
		$('.menu_wrap').hide();
	});
});

$('#delete').on('click',function(){
	var result = confirm("회원탈퇴를 진행하시겠습니까?");
	var v_id = '<%=Mv.getMemId()%>';
	if (result) {
		
		$.ajax({
				type : 'post',
				url : '<%=request.getContextPath()%>/mypage/memDelete.do',
				data : {memId : v_id},
				dataType : 'json',
				success : function(rst){
					console.log(rst);
					if(rst.code == "ok"){
						// 성공시 페이지 이동
						alert("회원 탈퇴가 완료되었습니다.");
						location.replace("/index.jsp");
					}
				}
		 });
	}else {
		alert("취소(아니오)를 누르셨습니다.");
	}
});
</script>
</body>
</html>