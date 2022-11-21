<%@page import="member.vo.InsVO"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>


<%
	//MemberVO mv = (MemberVO)request.getAttribute("mv");
	InsVO iv = (InsVO)request.getAttribute("iv");
%>

<!DOCTYPE html>
<html>
<head>
<title>회원 정소 부섲</title>
<script type="text/javascript"></script>
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
	<h1 class="title">
		회원 정보 수정
		<p>Profile Modify</p>
	</h1>
	<ul class="wrapper_inner">
		<form action="/mypage/memUpdate.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="memId" value="<%=mv.getMemId()%>">
			<%
				if (iv != null) {
			%>

			<input type="hidden" name="atchFile" value="<%=iv.getAtchCourse()%>">

			<%
				}
			%>

			<div class="col_line">
				<div class="col_inner3">ID</div>
				<div class="col_inner3"><%=mv.getMemId()%></div>
			</div>

			<div class="col_line">
				<label class="col_inner3" for="pass">비밀번호</label>
				<div class=col_inner3>
					<input type="text" id="pass" name="memPass"
						placeholder="8자 이상(대ㆍ소문자,숫자,특수문자)" required
						pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{8,}"
						value="<%=mv.getMemPass()%>">
				</div>
			</div>

			<div class="col_line">
				<label for="pass" class="col_inner3">비밀번호 확인</label>
				<%-- 	      임의문자(.)를 대상으로 최소 갯수(*?)의 패턴을 찾음 --%>
				<div class="col_inner3">
					<input type="text" id="pass_chk" required
						pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{8,}">
				</div>
				<div class="col_inner3" style="text-align: left;">
					<div id="pwChk"></div>
					<span id="pw"></span>
				</div>
			</div>
			<%
				if (iv != null) {
			%>
			<div class="col_line">
				<label for="ins_name" class="col_inner3">기관명</label> <span class="sp"></span>
				<div class="col_inner3">
					<input type="text" id="ins_name" name="insName" required
						parttern="[가-힣][A-Z]{1,8}" value="<%=iv.getInstName()%>">
				</div>
			</div>
			<div style="text-align: left;" class="col_line">
				<input type="file" id="upload" class="col_inner3"name="atchFile"
					value="<%=iv.getAtchCourse()%>">
			</div>
			<%
				}
			%>
			<div class="col_line">
				<label for="name" class="col_inner3">이름</label> <span class="sp"></span>
				<div class="col_inner3">
					<input type="text" id="name" name="memName" required
						parttern="[가-힣a-zA-z0-9]{2,8}" value="<%=mv.getMemName()%>">
				</div>
			</div>

			<div class="col_line">
				<label class="col_inner3" for="reg1">주민번호</label>
				<div class="col_inner3">
					<input type="text" id="reg_no1" name="regno1" maxlength="6"
						required value="<%=mv.getRegno1()%>"> <span class="sp"></span>
				</div>
				<label class="col_inner3">ㅡ</label>
				<div class="col_inner3">
					<input type="text" id="reg_no2" name="regno2" maxlength="1"
						required value="<%=mv.getRegno2()%>"> <span class="sp"></span>
				</div>
				<div class="col_inner3" style="text-align: left;">
					<span id="reg"></span>
				</div>
			</div>

			<div class="col_line">
				<label class="col_inner3" for="hp">연락처</label>
				<div class="col_inner3">
					<input type="text" id="hp" name="memTel"
						placeholder="010-0000-0000"
						pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"
						value="<%=mv.getMemTel()%>">
				</div>
				<span class="sp col_inner3"></span>
			</div>

			<div class="col_line">
				<label class="col_inner3" for="mail">이메일</label>
				<div class="col_inner3">
					<input type="email" id="mail" name="mail"
						pattern="[0-9a-zA-z]+@[0-9a-zA-Z]+(\.[a-z]+){1,2}"
						value="<%=mv.getMail()%>">
				</div>
				<span class="sp col_inner3"></span>
			</div>

			<div class="col_line">
				<label for="add1" class="col_inner3">우편번호</label>
				<div class="col_inner3">
					<input type="text" id="postAddr" name="memZip" required
						value="<%=mv.getMemZip()%>">
				</div>
				<div class="col_inner3">
					<button type="button" id="addrBtn">주소검색</button>
				</div>
			</div>
			<div class="col_line">
				<label for="add1" class="col_inner3">주소</label>
				<div class="col_inner3">
					<input type="text" id="addr1" name="memAddr1" required
						value="<%=mv.getMemAddr1()%>">
				</div>
			</div>

			<div class="col_line">
				<label class="col_inner3" for="add2">상세주소</label>
				<div class="col_inner3">
					<input type="text" id="addr2" name="memAddr2" required
						value="<%=mv.getMemAddr2()%>">
				</div>
			</div>
			<div id="select">
				<button>완료</button>
				<span id="btn"></span>
			</div>
		</form>
	</ul>
</div>
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
</script>
</body>
</html>
