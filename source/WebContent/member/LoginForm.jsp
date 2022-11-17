<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String rst = session.getAttribute("rst") == null ? "" : session.getAttribute("rst").toString();
	session.removeAttribute("rst");
%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
h1{
	font-weight: bold; 
    font-family:'GmarketSansMedium', sans-serif ;
    margin:auto;
    text-align: center;
}

.row {
    height:auto;
	border-radius: 10px;
	border-collapse: separate;
	margin-bottom: 10px;
	margin:8% auto 0 auto;
    padding:5%; 
    border:1px solid #f1f1f1;
    width: 450px;
    box-shadow : 0px 0px 20px #f1f1f1
}
.content {
	border: 5px solid white;
	border-radius: 4px;
	margin: 20px 0px;
}

p{
	display: none;
	padding: 10px;
	color: red;
	line-height: 1.42857143;
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
    block-size: 45px;
}
#loginBtn{
	color: #444;
	font-weight: bold; 
	border: 1px solid #f1f1f1;
    padding: 6px 12px;
    border-radius: 4px;
    width: 100%;
    float: left;  
    height: 50px;
    transition:0.4s 
}

#loginBtn:hover {
	background-color:#444;
	color:#fff
}

a{
	font-size: 16px;
	color: #999;
	font-weight: bolder
}
#option{
	display: inline;
	padding : 15px 25px;
}
div{
    content: " ";
    clear: both;
}
#select{
	display: flex;
    justify-content: center;
}
</style>
</head>
<body>
	<div class="container">
	<h1>온(溫:ON)</h1>
	 <form action="login.do" method="post">
			<div class="row">
				<div class="content">
					<input id="userId" name="memId" class="input" placeholder="ID">
				</div>
				<div class="content">
					<input id="userPw" name="memPass" class="input" type="password"
						placeholder="PASSWORD">
				</div>
				<div class="warning">
					<p>아이디 또는 비밀번호를 잘못 입력했습니다.<br>입력하신 내용을 다시 확인해주세요.</p>
				</div>
				<div class="content">
					<button id="loginBtn">로그인</button>
				</div>
			</div>
		<div id ="select">
		<div id="option" class="join">
			<a href="<%=request.getContextPath() %>/member/select.jsp">회원가입하기</a>
		</div>
		<div id="option" class="search">
			<a href="<%=request.getContextPath() %>/member/search_id.jsp">아이디 찾기 / </a>
			<a href="<%=request.getContextPath() %>/member/search_pw.jsp">비밀번호 찾기</a>
		</div>
	</form>


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