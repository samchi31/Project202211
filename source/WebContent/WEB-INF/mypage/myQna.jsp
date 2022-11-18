<%@page import="qna.vo.QnaVO"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String memId = ((MemberVO) session.getAttribute("loginUser")).getMemId();
	List<QnaVO> adminQnaList = (List<QnaVO>) request.getAttribute("adminQnaList"); //겟파라미터는: 담아놓은 걸 꺼낼때

	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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

.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

.row.content {
	height: 450px
}

.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

.pager {
	float: left;
}

.p1 {
	display: flex;
	justify-content: space-between;
	padding: 15px;
}

.btn {
	float: right;
}

.container {
	width: 100%;
}

.row {
	width: 90%;
	margin: 0 auto;
}

.f_title {
	font-weight: bold;
	font-family: 'GmarketSansMedium', sans-serif;
	font-weight: bold;
}

.f_title p {
	position: absolute;
	opacity: 0.1;
	font-size: 100px;
	top: -5%;
	color: #ccc
}

#pagelist {
	display: flex;
	justify-content: center;
}

.container {
	margin-top: 70px;
}
</style>
</head>
<body>
	<h1>온(溫:ON)</h1>
	<div id="side">
		<div id="memDetail" class="memDetail">
			<a href="/mypage/memDetail.do">회원정보</a>
		</div>
		<div id=class="">
			<a href="/myVolReserv.do">봉사 내역</a>
		</div>
		<div id=class="">
			<a href="/volWish.do">관심 봉사</a>
		</div>
		<div id=class="">
			<a href="/approve.do">봉사 승인</a>
		</div>
		<div id=class="">
			<a href="/myVolList.do">봉사글 작성 내역</a>
		</div>
		<div id=class="">
			<a href="/myUserClass.do">재능기부 현황</a>
		</div>
		<div id=class="">
			<a href="/myDonate.do">후원 내역</a>
		</div>
		<div id=class="">
			<a href="/myQna.do">Q&A</a>
		</div>
		<div id=class="">
			<a href="/myNotice.do">공지사항</a>
		</div>
	</div>

	<div id="content">
		<div class="container">
			<div class="row">
				<table class="table table-hover notice_table">
					<thead>
						<tr>
							<th width="50%">제 목</th>
							<th style="text-align: center" width="15%">작성ID</th>
							<th style="text-align: center" width="15%">문의날짜</th>
							<th style="text-align: center" width="20%">답변날짜</th>


						</tr>
					</thead>
					<tbody>

						<%
							int memSize = adminQnaList.size(); //꺼내기
						if (memSize > 0) {
							for (int i = 0; i < memSize; i++) {
						%>
						<tr>
							<td><a
								href="DetailQnaController.do?inquiryId=<%=adminQnaList.get(i).getInquiryId()%>"><%=adminQnaList.get(i).getInquiryTitle()%></a></td>
							<td style="text-align: center"><%=adminQnaList.get(i).getMemId()%></td>
							<td style="text-align: center"><%=adminQnaList.get(i).getInquiryDate()%></td>
							<%
								if (adminQnaList.get(i).getAnswerContent() == null) {
							%>
							<th style="text-align: center" width="20%">미응답</th>
							<%
								} else {
							%>
							<td style="text-align: center"><%=adminQnaList.get(i).getAnswerDate()%></td>
							<%
								}
							%>
						</tr>
						<%
							}

						} else {
						%>
						<tr>
							<td colspan="4">조회된 데이터가 없습니다.</td>
						</tr>
						<%
							}
						%>

					</tbody>
				</table>


				<%
					if (msg.equals("성공")) { //msg가 성공이 맞다면 만들어지는 구조
				%>


				<%
					}
				%>
			</div>
		</div>



		<%-- PAGINATION --%>
		<c:set var="currentPage" value="${requestScope.cPage}"></c:set>
		<%-- 현재페이지: <c:out value="${currentPage}" /> --%>
		<div id="pagelist">
			<ul class="pager" style="float: center;">
				<li><a class="prev" href="#">Prev</a></li>
			</ul>
			<ul class="pagination" style="float: center;">
				<c:forEach var="i" begin="${requestScope.sPage}"
					end="${requestScope.ePage}">

					<c:if test="${currentPage == i}">
						<li class="active"><a class="paging" href="#">${i}</a></li>
					</c:if>
					<c:if test="${currentPage != i}">
						<li><a class="paging" href="#">${i}</a></li>
					</c:if>
				</c:forEach>
			</ul>
			<ul class="pager" style="float: left;">
				<li><a class="next" href="#">Next</a></li>
			</ul>
		</div>

	</div>
	<script>

	$(".paging").on('click',function(){
		location.href="/ListQnaController.do?pageNo=" + $(this).text();
		
	});
	
	
//이전버튼 클릭 이벤트
	let currentPage;
	
	$(".prev").on('click',function(){
		if(${currentPage} == 1){
			currentPage = ${currentPage};
		} else {
			currentPage = ${currentPage} - 1;
		}
		location.href="/ListQnaController.do?pageNo=" + currentPage;
	});
	
//다음버튼 클릭 이벤트
	$(".next").on('click',function(){
		if(${currentPage} == ${requestScope.ttPage}) {
			currentPage = ${currentPage};
		} else {
			currentPage = ${currentPage} + 1;
		}
		location.href="/ListQnaController.do?pageNo=" + currentPage;
	});
	<%-- PAGINATION --%>	
	
	
	$(document).ready(function(){
		$('.menu_wrap').hide();
		$('.gnbmenu').mouseover(function(){s
			$('.menu_wrap').slideDown();
		});
		$('.menu_wrap').mouseout(function(){
			$('.menu_wrap').hide();
		});
	});		
	
</script>
</body>