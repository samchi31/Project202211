<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
i{
font-size:3rem; color: red; cursor: pointer;
}
</style>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<body>

<button id="heart"><i id="heart1" class ="bi-heart"></i></button>

<script>
var yon = "y";

$('#heart').on('click',function(){
	if(yon == "n"){
		$('i').attr('class','bi-heart');
        $('#isWished').val('y');
	} else if(yon == "y") {
		$('i').attr('class','bi-heart-fill');
        $('#isWished').val('n');
	}
});
</script>
</body>
</html>