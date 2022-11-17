<%@page import="member.vo.InsVO"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>


<%
	MemberVO mv = (MemberVO)request.getAttribute("mv");
	InsVO iv = (InsVO)request.getAttribute("iv");
%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript"></script>
<style>
div {
	border: 1px solid olivedrab;
}

#side, #content {
	float: left;
	height: 85vh;
}

#side {
	width: 25%;
}

#content {
	width: 74%;
}
</style>
</head>
<body>
	<h1>온(溫:ON)</h1>
	<div id="side">
		<div id="memDetail" class="memDetail">
			<a href="/mypage/memdetail.do">회원정보</a>
		</div>
		<div id=class="">
			<a href="/">봉사내역</a>
		</div>
		<div id=class="">
			<a href="/">재능기부현황</a>
		</div>
		<div id=class="">
			<a href="/">후원내역</a>
		</div>
		<div id=class="">
			<a href="/">공지사항</a>
		</div>
		<div id=class="">
			<a href="/">Q&A</a>
		</div>
	</div>

	<div id="content">
		<form action="/mypage/memUpdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="memId" value="<%=mv.getMemId() %>">
		<%
			if (iv != null) {
		%>
		
		<input type="hidden" name="atchFile" value="<%=iv.getAtchCourse()%>">
		
		<%
			}
		%>
			
		<div >
			<div>ID</div> 
			<div><%=mv.getMemId()%></div> 
		</div>

			<div >
				<label for="pass">비밀번호</label>
				<div >
					<input type="text" id="pass" name="memPass" placeholder="8자 이상(대ㆍ소문자,숫자,특수문자)" required
						   pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{8,}"
						   value="<%=mv.getMemPass()%>">
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

		<%
			if (iv != null) {
		%>
			<div>
				<label for="ins_name">기관명</label> <span class="sp"></span>
				<div >
					<input type="text" id="ins_name" name="insName" required 
							parttern="[가-힣][A-Z]{1,8}"
							value="<%=iv.getInstName()%>">
				</div>
			</div>
			<div style="text-align: left;">
				<input type="file" id="upload" name="atchFile"
					   value="<%=iv.getAtchCourse()%>">
			</div>
		<%
			}
		%>
			
			<div>
				<label for="name">이름</label> <span class="sp"></span>
				<div>
					<input type="text" id="name" name="memName" required 
						   parttern="[가-힣a-zA-z0-9]{2,8}"
						   value="<%=mv.getMemName()%>">
				</div>
			</div>

			<div>
				<label for="reg1">주민번호</label>
				<div>
					<input type="text" id="reg_no1" name="regno1" maxlength="6" required
						   value="<%=mv.getRegno1()%>"> 
					<span class="sp"></span>
				</div>
				<label>ㅡ</label>
				<div>
					<input type="text" id="reg_no2" name="regno2" maxlength="1" required
						   value="<%=mv.getRegno2()%>"> 
					<span class="sp"></span>
				</div>
				<div style="text-align: left;">
					<span id="reg"></span>
				</div>
			</div>

			<div>
				<label for="hp">연락처</label>
				<div >
					<input type="text" id="hp" name="memTel" placeholder="010-0000-0000"
							pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"
							value="<%=mv.getMemTel() %>">
				</div>
				<span class="sp"></span>
			</div>

			<div>
				<label for="mail">이메일</label>
				<div>
					<input type="email" id="mail" name="mail"
							pattern="[0-9a-zA-z]+@[0-9a-zA-Z]+(\.[a-z]+){1,2}"
							value="<%=mv.getMail()%>">
				</div>
				<span class="sp"></span>
			</div>

			<div>
				<label for="add1">우편번호</label>
				<div >
					<input type="text"  id="postAddr" name="memZip" required
							value="<%=mv.getMemZip()%>">
				</div>
				<div>
					<button type="button" id="addrBtn">주소검색</button>
				</div>
			</div>

			<div>
				<label for="add1">주소</label>
				<div>
					<input type="text" id="addr1" name="memAddr1" required
					  		value="<%=mv.getMemAddr1()%>">
				</div>
			</div>

			<div >
				<label for="add2" >상세주소</label>
				<div>
					<input type="text"id="addr2" name="memAddr2" required
							value="<%=mv.getMemAddr2()%>">
				</div>
				<div>
					<button >완료</button>
					<span id="btn"></span>
				</div>
			</div>
		</form>
	</div>

</body>