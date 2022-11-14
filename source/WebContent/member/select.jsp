<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
.container{
	width: 40%;
	margin: 30%;
}

.row {
	border: 4px solid lightgray;
	padding: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<input type="button" value="일반" class="btn btn-primary col-xs-6"
					onclick="f_gen()">
			</div>
			<div class="col-xs-12">
				<input type="button" value="기관" class="btn btn-primary col-xs-6"
					onclick="f_ins()">
			</div>
		</div>
	</div>

	<script>
		function f_gen(){
					location.replace("/member/join_gen.jsp");
		}
			
		function f_ins(){
					location.replace("/member/join_ins.jsp");
		}
			
	</script>
</body>
</html>