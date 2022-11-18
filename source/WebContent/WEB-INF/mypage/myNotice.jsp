<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String rst = session.getAttribute("rst") == null ? "" : session.getAttribute("rst").toString();
	String user = session.getAttribute("user") == null ? "" : session.getAttribute("user").toString();
	session.removeAttribute("rst");
	session.removeAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
<style>

@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
body{
	 overflow: hidden;
}
.*{
	 font-family:'GmarketSansMedium', sans-serif ;
}
.container {
	width: 40%;
	margin: 13% 28%;
	position : relative;
	display: table;
    content: " ";
    clear: both;

}
.row {
	margin:8% auto 0 auto;
	padding:5%;
	border:1px solid #f1f1f1;
	border-radius:10px;
	box-shadow : 0px 0px 20px #f1f1f1;
	transition:0.2s
}

.title {
	font-weight: bold; 
    font-family:'GmarketSansMedium', sans-serif ;
    margin:auto;
    text-align: center;
    margin-top:5%
}
.content {
width:80%; 
margin:10px auto;
}

.warning {
 clear:both; 
 display:block;
 text-align:center;
 color:red;
}

.backbt {
	width:150px;
	height:150px;
	border-radius:150px; 
	position:absolute;
	left:3%;
	top:5%
}
</style>
</head>
<body>
	<form action="/member/searchPw.do" method="post">
	
		<%-- <div id=option class="search">
			<a href="/member/search_id.jsp">ID 찾기</a>
		</div>
		<div id=option class="search">
			<a href="/member/search_pw.jsp">PW 찾기</a>
		</div>
		 --%>
		 <div class="backbt">
			<a href="/member/LoginForm.jsp" class="btn btn-success">뒤로 가기</a>
		</div>
		
		
		<div class="container">
			<div class="row">
				<h1 class="title">비밀번호 찾기</h1>
				<div class="content">
					<input id="userId" name="memId" class="form-control" placeholder="ID">
				</div>
				<div class="content">
					<input id="userMail" name="mail" class="form-control"  placeholder="E-MAIL">
				</div>
				<div class="warning">
					<p>
						일치하는 회원 정보가 없습니다.<br>입력하신 내용을 다시 확인해주세요.
					</p>
				</div>
				<div class="content">
					<button id="Btn" class="col-sm-12 btn btn-success">메일 발송</button>

					<button id="Btn">완료</button>
				</div>
			</div>
		</div>
	</form>
	<script>
	<%
	if(rst == "ok"){
	%>
			// 성공시 페이지 이동
			alert("회원님의 비밀번호가 발송되었습니다.");
 			location.replace("/member/login.do");
	<%
	}else if(rst == "no") {
	%>
			// 실패시 경고문 출력
			$('p').show();
	<%
	}
	%>
	</script>
</body>
</html>