<%@page import="donate.vo.DonateVO"%>
<%@page import="funding.vo.FundingVO"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String memId = ((MemberVO) session.getAttribute("loginUser")).getMemId();
	List<DonateVO> donateList = (List<DonateVO>) request.getAttribute("DonateList");
	DonateVO param = (DonateVO) request.getAttribute("param");
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript"></script>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/mypage.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../header.jsp"%>
<%@ include file="side.jsp"%>
<div id="wrapper">
	<h1 class="title">후원 현황<p>Donate</p></h1>
	<ul class="wrapper_inner">
		<form id="donateForm" method="post">
			<input type="hidden" id="detailFundingId" name="detailFundingId" value="" />
	       <%
	        if(donateList.size() > 0){
	        	for(int i=0; i<donateList.size(); i++ ){
	        %>
	        <div class="mylist">
	            <p>기부코드 : <%= donateList.get(i).getFundingId() %></p>
<%-- 	            <h2>기부명 : <%= donateList.get(i).getFundingTitle() %></h2> --%>
	            <p>기부금액 : <%= donateList.get(i).getDonateAmount() %></p>
	            <p>환불 받을 계좌 : <%= donateList.get(i).getDonateAccount() %></p>
	            <p>환불 받을 계좌 예금주 : <%= donateList.get(i).getDonateAccountHolder() %></p>
	            <p>환불 받을 계좌 은행 : <%= donateList.get(i).getDonateBankName() %></p>
	            <p>후원일시 : <%= donateList.get(i).getDonateDate() %></p>
	           	<a href="#" id="morebt" class="btn btn-success" onClick="fnDetail('<%=donateList.get(i).getFundingId() %>')" >상세 보기</a>
	        </div>
	        <%
	        	}
	        }
	        %>
        </form>
    </ul>
</div>
</body>
<script>
$(document).ready(function(){
	$('.menu_wrap').hide();
	$('.gnbmenu').mouseover(function(){
		$('.menu_wrap').slideDown();
	});
	$('#wrapper').mouseover(function(){
		$('.menu_wrap').hide();
	});
});

function fnDetail( strId ){
	$('#detailFundingId').val(strId);
	$("#donateForm").attr("action", "/funding/Detail.do");
	$("#donateForm").submit();
};
</script>
</html>