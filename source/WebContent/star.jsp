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
  opacity: 0;
  cursor: pointer;
}

.star span {
  width: 0;
  position: absolute; 
  left: 0;
  color: red;
  overflow: hidden;
  pointer-events: none;
  z-index:9999;
}
</style>
<script type="text/javascript">
	function drag2(){
		var no = (document.querySelector("#range").value)*16;
		var css = $('#real').css('width', no);
	}
</script>
<body>
<div>
<span class="star">
  ★★★★★
  <span id="real">★★★★★</span>
  <input id="range" type="range" oninput="drag2()" value="1" step="1" min="1" max="10">
</span>
</div>
</body>
</html>