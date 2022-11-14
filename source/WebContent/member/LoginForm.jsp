<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String rst = session.getAttribute("rst") == null ? "" : session.getAttribute("rst").toString();
	session.removeAttribute("rst");
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
.container {
	width: 40%;
	margin: 30%;
	position : relative;
}

.row {
	border: 4px solid #ffc72c;
	padding: 10px;
	border-radius: 10px;
}
.content {
	border: 5px solid white;
	border-radius: 4px;
}

p{
	display: none;
	padding: 10px;
	color: red;
}
.input{
	display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
}
#loginBtn{
	color: #fff;
    background-color: #f8df59;
    border-color: #2e6da4;
    border: 1px solid transparent;
    padding: 6px 12px;
    border-radius: 4px;
    width: 100%;
    float: left;
    
}
a{
	display: inline;
	font-size: 14px;
	position : Absolute;
}
#option
</style>
</head>
<body>
	<form action="login.do" method="post">
		<div class="container">
			<div class="row">
				<div class="content">
					<input id="userId" name="memId" class="input" placeholder="ID">
				</div>
				<div class="content">
					<input id="userPw" name="memPass" class="input" type="password"
						placeholder="PASSWORD">
				</div>
				<div class="warning">
					<p>
						아이디 또는 비밀번호를 잘못 입력했습니다.<br>입력하신 내용을 다시 확인해주세요.
					</p>
				</div>
				<div class="content">
					<button id="loginBtn">로그인</button>
				</div>
			</div>
		</div>
	</form>


		<div id=option class="join">
			<a href="/member/select.jsp">회원가입하기</a>
		</div>
		<div id=option class="search">
			<a href="/member/search_id.jsp">ID ● PW 찾기</a>
		</div>


	<script>
					
		if("<%=rst%>" == "ok"){
			// 성공시 페이지 이동
			location.replace("/member/login.do");
			
		}else if("<%=rst%>" == "no") {
			// 실패시 경고문 출력
			$('p').show();
		}
	</script>
</body>
</html>