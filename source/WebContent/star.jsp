<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
.star {
  position: relative;
  font-size: 2rem;
  color: #ddd;
}

.star input {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  opacity: 10;
  cursor: pointer;
}

.star span {
  width: 0;
  position: absolute; 
  left: 0;
  color: red;
  overflow: hidden;
  pointer-events: none;
}
</style>
<script>
	var num = $('#range').value*10;
	function drag(){
		$('#real').css('width', num);
	}
	</script>
<body>
<span class="star">
  ★★★★★
  <span id="real">★★★★★</span>
  <input id="range" type="range" oninput="drag()" value="1" step="1" min="0" max="10">
</span>
</body>
</html>