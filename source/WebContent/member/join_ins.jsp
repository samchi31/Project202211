<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%-- 다음주소API --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="col-sm-8">
		<h1>온(溫:ON)</h1>
		<hr>
		<form action="Insert.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="gbn" value="02">
		
			<div >
				<label for="id" >아이디</label> <span class="disp"></span>
				<div >
					<input type="text" id="id" placeholder="4자 이상(대ㆍ소문자,숫자)" name="memId" required
						pattern="[a-zA-Z][a-zA-Z0-9]{4,}">
				</div>
				<div style="text-align: left;">
					<button type="button" id="idChk">중복검사</button>
					<span id="disp"></span>
				</div>
			</div>

			<div >
				<label for="pass">비밀번호</label>
				<div >
					<input type="text" id="pass" name="memPass" placeholder="8자 이상(대ㆍ소문자,숫자,특수문자)" required
						   pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{8,}">
				</div>
			</div>

			<div>
				<label for="pass">비밀번호 확인</label>
				<%-- 	      임의문자(.)를 대상으로 최소 갯수(*?)의 패턴을 찾음 --%>
				<div >
					<input type="text" id="pass_chk" required
					    	pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{8,}">
				</div>
				<div style="text-align: left;">
					<div id="pwChk"></div>
					<span id="pw"></span>
				</div>
			</div>

			<div>
				<label for="ins_name">기관명</label> <span class="sp"></span>
				<div >
					<input type="text" id="ins_name" name="insName"
						   required parttern="[가-힣][A-Z]{1,8}">
				</div>
			</div>
			<div style="text-align: left;">
				<input type="file" id="upload" name="atchFile">
			</div>

			<div>
				<label for="name">이름</label> <span class="sp"></span>
				<div>
					<input type="text" id="name" name="memName"
						   required parttern="[가-힣a-zA-z0-9]{2,8}">
				</div>
			</div>

			<div>
				<label for="reg1">주민번호</label>
				<div>
					<input type="text" id="reg_no1" name="regno1" maxlength="6" required> 
					<span class="sp"></span>
				</div>
				<label for="reg2">ㅡ</label>
				<div>
					<input type="text" id="reg_no2" name="regno2" maxlength="1" required> 
					<span class="sp"></span>
				</div>
				<div style="text-align: left;">
					<div id="regchk"></div>
					<span id="reg"></span>
				</div>
			</div>

			<div>
				<label for="hp">연락처</label>
				<div >
					<input type="text" id="hp" name="memTel" placeholder="010-0000-0000"
							pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}">
				</div>
				<span class="sp"></span>
			</div>

			<div>
				<label for="mail">이메일</label>
				<div>
					<input type="email" id="mail" name="mail"
							pattern="[0-9a-zA-z]+@[0-9a-zA-Z]+(\.[a-z]+){1,2}">
				</div>
				<span class="sp"></span>
			</div>

			<div>
				<label for="add1">우편번호</label>
				<div >
					<input type="text"  id="postAddr" name="memZip" required>
				</div>
				<div>
					<button type="button" id="addrBtn">주소검색</button>
				</div>
			</div>

			<div>
				<label for="add1">주소</label>
				<div>
					<input type="text" id="addr1" name="memAddr1"
						required>
				</div>
			</div>

			<div >
				<label for="add2" >상세주소</label>
				<div>
					<input type="text"id="addr2" name="memAddr2" required>
				</div>
			</div>

			<div>
				<div>
					<button >가입하기</button>
					<span id="joinspan"></span>
				</div>
			</div>
		</form>
	</div>

<script>

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
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
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