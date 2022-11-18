<%@page import="donate.vo.DonateVO"%>
<%@page import="funding.vo.FundingVO"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String memId = ((MemberVO) session.getAttribute("loginUser")).getMemId();
	List<DonateVO> donateList = (List<DonateVO>) request.getAttribute("donateList");
	DonateVO param = (DonateVO) request.getAttribute("param");
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
		<form id="donateForm" method="post">
			<input type="hidden" id="detailFundingId" name="detailFundingId"
				value="" />
			<!-- 중앙 화면  -->
			<div class="bigWrap" style="scrollbar: auto">
				<div class="container">
					<%
        if(donateList.size() > 0){
        	for(int i=0; i<donateList.size(); i++ ){
        %>
					<div class="row" style="clear: both;">
						<div class="col-sm-6">
							기부코드 :
							<%= donateList.get(i).getFundingId() %>
							기부명 :
							<%= donateList.get(i).getFundingTitle() %>
							기부금액 :
							<%= donateList.get(i).getDonateAmount() %>
							환불 받을 계좌 :
							<%= donateList.get(i).getDonateAccount() %>
							환불 받을 계좌 예금주 :
							<%= donateList.get(i).getDonateAccountHolder() %>
							환불 받을 계좌 은행 :
							<%= donateList.get(i).getDonateBankName() %>
							후원일시 :
							<%= donateList.get(i).getDonateDate() %>
							<a href="#" id="morebt" class="btn btn-success"
								onClick="fnDetail('<%=donateList.get(i).getFundingId() %>')">상세
								보기</a>

							<button
								onclick="fnDetail('<%=donateList.get(i).getFundingId() %>')">테스트
								버튼 클릭</button>
						</div>
					</div>
					<%
        	}
        }
        %>
				</div>
			</div>
		</form>
	</div>
</body>
<script>
$(document).ready(function(){
	$(document).ready(function(){
		$('.menu_wrap').hide();
		$('.gnbmenu').mouseover(function(){
			$('.menu_wrap').slideDown();
		});
		$('.bigWrap').mouseover(function(){
			$('.menu_wrap').hide();
		});
	});

	//상세보기 
	function fnDetail( strId ){
		$('#detailFundingId').val(strId);
		$("#donateForm").attr("action", "/funding/Detail.do");
		$("#donateForm").submit();
	};
}
</script>
</html>