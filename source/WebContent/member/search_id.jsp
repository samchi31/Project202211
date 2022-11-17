<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String rst = session.getAttribute("rst") == null ? "" : session.getAttribute("rst").toString();
	String user = session.getAttribute("user") == null ? "" : session.getAttribute("user").toString();
	session.removeAttribute("rst");
	session.removeAttribute("user");
%>
<%-- [<%=rst %>] --%>
<%-- [<%=user %>] --%>

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
}

.row {
	border: 4px solid lightgray;
	padding: 10px;
}

.content {
	border: 5px solid white;
}

p {
	display: none;
	padding: 10px;
	color: red;
}
</style>
</head>
<body>
	<form action="/member/searchId.do" method="post">
		<div id=option class="search">
			<a href="/member/search_id.jsp">ID 찾기</a>
		</div>
		<div id=option class="search">
			<a href="/member/search_pw.jsp">PW 찾기</a>
		</div>
		<div class="container">
			<div class="row">
				<div class="content">
					<input id="userName" name="memName" placeholder="이름">
				</div>
				<div class="content">
					<input id="userTel" name="memTel" placeholder="전화번호">
				</div>
				<div class="warning">
					<p>
						일치하는 회원 정보가 없습니다.<br>입력하신 내용을 다시 확인해주세요.
					</p>
				</div>
				<div class="content">
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
			alert("회원 아이디는 " + "<%=user%>");
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