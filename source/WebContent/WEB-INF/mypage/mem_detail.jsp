<%@page import="member.vo.InsVO"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>


<%
	MemberVO mv = (MemberVO) request.getAttribute("mv");
	InsVO iv = (InsVO) request.getAttribute("iv");
	String msg = session.getAttribute("msg") == null ? "" : session.getAttribute("msg").toString();
	session.removeAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript"></script>
<style>
div {
	border: 1px solid olivedrab;
}

#side, #wrapper {
	float: left;
	height: 85vh;
}

#side {
	width: 25%;
}

#wrapper {
	width: 74%;
}

.content {
	display: inline-block;
	bor
}
</style>
</head>
<body>
	<h1>온(溫:ON)</h1>
	<div id="side">
		<div id="memDetail" class="memDetail">
			<a href="/mypage/memDetail.do">회원정보</a>
		</div>
		<div id=class="">
			<a href="/myVolReserv.do">봉사내역</a>
		</div>
		<div id=class="">
			<a href="/myUserClass.do">재능기부현황</a>
		</div>
		<div id=class="">
			<a href="/myDonate.do">후원내역</a>
		</div>
		<div id=class="">
			<a href="/">Q&A</a>
		</div>
	</div>

	<div id="wrapper">
		<div>
			<div class="content">ID</div>
			<div class="content"><%=mv.getMemId()%></div>
		</div>

		<div>
			<div class="content">비밀번호</div>
			<div class="content"><%=mv.getMemPass()%>"</div>
		</div>


		<%
			if (iv != null) {
		%>

		<div>
			<div class="content">기관명</div>
			<div class="content"><%=iv.getInstName()%></div>
		</div>

		<div>
			<div class="content">첨부파일</div>
			<div class="content"><%=iv.getAtchCourse()%></div>
		</div>
		<%
			}
		%>


		<div>
			<div class="content">이름</div>
			<div class="content"><%=mv.getMemName()%></div>
		</div>

		<div>
			<div class="content">주민번호</div>
			<div class="content"><%=mv.getRegno1()%>
				ㅡ
				<%=mv.getRegno2()%></div>
		</div>

		<div>
			<div class="content">연락처</div>
			<div class="content"><%=mv.getMemTel()%></div>
		</div>

		<div>
			<div class="content">이메일</div>
			<div class="content"><%=mv.getMail()%></div>
		</div>

		<div>
			<div class="content">우편번호</div>
			<div class="content"><%=mv.getMemZip()%></div>
		</div>

		<div>
			<div class="content">주소</div>
			<div class="content"><%=mv.getMemAddr1()%></div>
		</div>

		<div>
			<div class="content">상세주소</div>
			<div class="content"><%=mv.getMemAddr2()%></div>
		</div>

		<div id=select>
			<div id=option class="update">
				<a href="/mypage/memUpdate.do?memId=<%=mv.getMemId()%>">회원정보 수정</a>
			</div>
		</div>

		<div id=select>
			<input type="button" id="delete" class="delete" value="회원탈퇴">
		</div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$('#delete').on('click',function(){
	var result = confirm("회원탈퇴?");
	var v_id = '<%=mv.getMemId()%>';
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
						location.replace("/member/start.jsp");
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