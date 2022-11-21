<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
	String msg = session.getAttribute("msg") == null ? "" : session.getAttribute("msg").toString();
	session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- 다음주소API --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
@font-face {
	font-family: 'GmarketSansMedium';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}
.container {
	width: 750px;
	font-size: 14px;
	display: table;
	content: " ";
	margin-right: auto;
	margin-left: auto;
	margin-top: 100px;
   font-family:'GmarketSansMedium', sans-serif ;
}
h1 {
	text-align: center;
    font-weight: bold;  
}
form{
	margin-top: 50px;
}
.input{
	width: 100%;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
}
   input:focus {
    outline: none;
	border: 1px solid #999;
    box-shadow : 0px 0px 20px #f1f1f1;
   } 

</style>
</head>
<body>
	<div class="container">
		<h1>온(溫:ON)</h1>
		<hr>
		<form class="form-horizontal" action="Insert.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="gbn" value="01">
			<div class="form-group">
				<label for="id" class="control-label col-sm-2">아이디</label> <span
					class="sp"></span>
				<div class="col-sm-4">
					<input type="text" class="input" id="id"
						placeholder="3자 이상" name="memId" required
						pattern="[a-zA-Z0-9가-힣]{3,}">
				</div>
				<div class="col-sm-6" style="text-align: left;">
					<button type="button" class="btn btn-success btn-sm" id="idChk">중복검사</button>
					<span id="disp"></span>
				</div>
			</div>

			<div class="form-group">
				<label for="pass" class="control-label col-sm-2">비밀번호</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="pass" name="memPass"
						placeholder="8자 이상(대ㆍ소문자,숫자,특수문자)" required
						pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{8,}">
				</div>
			</div>

			<div class="form-group">
				<label for="pass" class="control-label col-sm-2">비밀번호 확인</label>
				<%-- 	      임의문자(.)를 대상으로 최소 갯수(*?)의 패턴을 찾음 --%>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="pass_chk" 
						required
						pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{8,}">
				</div>
				<div class="col-sm-6" style="text-align: left;">
					<div id="pwChk"></div>
					<span id="pw"></span>
				</div>
			</div>

			<div class="form-group">
				<label for="name" class="control-label col-sm-2">이름</label> <span
					class="sp"></span>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="name" name="memName"
						required parttern="[가-힣]{2,8}">
				</div>
			</div>

			<div class="form-group">
				<label for="reg1" class="control-label col-sm-2">주민번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="reg_no1" name="regno1" maxlength="6"
						required> <span class="sp"></span>
				</div>
				<label for="reg2" class="control-label col-sm-2">ㅡ</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="reg_no2" name="regno2" maxlength="1"
						required> <span class="sp"></span>
				</div>
				<div class="col-sm-6" style="text-align: left;">
					<div id="regchk"></div>
					<span id="reg"></span>
				</div>
			</div>

			<div class="form-group">
				<label for="hp" class="control-label col-sm-2">연락처</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="hp" name="memTel"
						placeholder="010-0000-0000"
						pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}">
				</div>
				<span class="sp"></span>
			</div>

			<div class="form-group">
				<label for="mail" class="control-label col-sm-2">이메일</label>
				<div class="col-sm-4">
					<%--     - 예시) 1004angel@a.co.kr / 1004angel@a.com --%>
					<input type="email" class="form-control" id="mail" name="mail"
						pattern="[0-9a-zA-z]+@[0-9a-zA-Z]+(\.[a-z]+){1,2}">
				</div>
				<span class="sp"></span>
			</div>

			<div class="form-group">
				<label for="add1" class="control-label col-sm-2">우편번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="postAddr"
						name="memZip" required>
				</div>
				<div class="col-sm-2">
					<button type="button" id="addrBtn" class="btn btn-info btn-sm">주소검색</button>
				</div>
			</div>

			<div class="form-group">
				<label for="add1" class="control-label col-sm-2">주소</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="addr1" name="memAddr1"
						required>
				</div>
			</div>

			<div class="form-group">
				<label for="add2" class="control-label col-sm-2">상세주소</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="addr2" name="memAddr2"
						required>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-6">
					<button class="btn btn-default" id="join">가입하기</button>
					<span id="joinsp"></span>
				</div>
			</div>
		</form>
	</div>

<script>

if("<%=msg%>" == "성공"){
	// 성공시 페이지 이동
	alert("회원가입 성공");
	location.replace("./LoginForm.jsp");
}else if("<%=msg%>" == "실패") {
	// 실패시 경고문 출력
	alert("회원가입 실패");
}
	
// 아이디 중복확인
$('#idChk').on('click',function(){ 
	var v_id = $('#id').val();
	var v_disp = $('#disp');
	
	if(v_id.length === 0){
		// 입력값 없을 때 
		v_disp.text("아이디를 입력해주세요").css('color','red');
		return;
	}
	
	$.ajax({
		type : 'post',
		url : '<%=request.getContextPath()%>/member/loginchk.do',
		data : {memId : v_id},
		dataType : 'json',
		success : function(rst){
			if(rst.code == "ok"){
				v_disp.text("사용가능한 아이디입니다.").css('color','green');
			} else{
				v_disp.text("사용중인 아이디입니다.").css('color','red');
			}
		},
		error : function(xhr){
			alert(xhr.status);
		}
	});
});


// 비밀번호 확인
$('#pass_chk').on('keyup',function(){
	var v_pw = $('#pass').val();
	var v_pwchk = $('#pass_chk').val();
	
	if(v_pw == v_pwchk){
		$('#pw').text("비밀번호 일치").css('color','green');
	} else {
		$('#pw').text("비밀번호 불일치").css('color','red');
	}
});


// 주민번호 유효성 확인
$('#reg_no2').on('keyup',function(){
	var chk1 = /\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])/
	var chk2 = /[1-4]/
	
	var v_regNo1 = $('#reg_no1').val();
	var v_regNo2 = $('#reg_no2').val();
	
	if(chk1.test(v_regNo1) == true && chk2.test(v_regNo2)== true ){
		$('#reg').text("유효성 일치").css('color','green');
	} else {
		$('#reg').text("유효성 불일치").css('color','red');
	}
});


// 주소
$('#addrBtn').on('click',function(){
    new daum.Postcode({
        oncomplete: function(data) {

            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            document.getElementById('postAddr').value = data.zonecode;
            document.getElementById("addr1").value = roadAddr;
        }
    }).open({
    	 autoClose: true
    });
});

</script>
</body>
</html>