<%@page import="donate.vo.DonateVO"%>
<%@page import="funding.vo.FundingVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
	FundingVO fundingDetail = (FundingVO)request.getAttribute("detail");
	FundingVO param = (FundingVO) request.getAttribute("param");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>후원 상세내역</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/funding.css">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
 	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
</head>
<body>
	<%@ include file="../header.jsp"%>
    <div class="container">
        <h1 class="f_title">후원 상세정보
			<p>FUNDING</p>
		</h1>
        <div class="row">
        	<%
        	// 기관 화면
       		if( "2".equals( param.getMemGb() ) ){
       	    %>
       	    <%-- 기관형식에서 수정 --%>
        	<form id="fundingForm" action="<%=request.getContextPath() %>/funding/Update.do" method="post">
        		<input type="hidden" id="fundingId" name="fundingId" value="<%= fundingDetail.getFundingId() %>">
		     	<%-- <input type="hidden" id="memId" name="memId" value="<%= fundingDetail.getMemId() %>">  --%>
					
				<table class="col-sm-6 fdetail_tb thum">
					<tr>
						<td>
							<img src="<%=request.getContextPath() %><%=fundingDetail.getFundingThumbnail() %>" alt="" style="width:400px"><%-- 
		     				<input type="hidden" name="isChange" value="<%=fundingDetail.getFundingThumbnail() %>">
		     				<input class="form-control input-sm" style="width:80%;margin:20px auto;" type="file" name="thumbnail"> --%>
						</td>
					</tr>
				</table>
				
				<% if ( param.getMemId().equals(fundingDetail.getMemId()) ){%>
					<!-- 본인글 수정가능 -->
					<table class="col-sm-6 fdetail_tb">
	        			<tr>
			     			<td><h2 class="f_title3">후원타이틀 : </h2></td>
			     			<td>
								<input class="form-control input-lg" type="text" name="fundingTitle" value="<%= fundingDetail.getFundingTitle() %> ">
							</td>
						</tr>
						<tr>
							<td><p><span class="glyphicon glyphicon-grain">회원(기관) : </p></td>
							<td><%= fundingDetail.getMemId() %></td>
						</tr>
						<tr>
							<td><p><span class="glyphicon glyphicon-bullhorn"></span>&nbsp;&nbsp;목표금액 : </p></td>
							<td>
								<input type="text" class="form-control"  name="targetAmount" value="<%= fundingDetail.getTargetAmount() %>">
							</td>
						</tr>
						<!-- <tr>
							<td><p><span class="glyphicon glyphicon-bullhorn"></span>&nbsp;&nbsp;현재금액 : <%= fundingDetail.getRecentAmount() %></p></td>
						</tr> -->
						<tr>
							<td><p><span class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;후원 시작 날짜 :</td>
							<td><input type="date"  class="form-control" id="fundingStartDate" name="fundingStartDate" value="<%= fundingDetail.getFundingStartDate() %>" required></td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;후원 마감 날짜:</td>
	                        <td><input type="date" class="form-control" id="fundingEndDate" name="fundingEndDate" value="<%= fundingDetail.getFundingEndDate() %>" required></td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-piggy-bank"></span>&nbsp;&nbsp;계좌번호:</td>
							<td><input type="text" class="form-control"  name="fundingAccount" value="<%= fundingDetail.getFundingAccount() %> "></td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-piggy-bank"></span>&nbsp;&nbsp;예금주:</td>
							<td><input type="text" class="form-control"  name="fundingAccountHolder" value="<%= fundingDetail.getFundingAccountHolder() %> "></td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-piggy-bank"></span>&nbsp;&nbsp;은행명:</td>
							<td><input type="text" class="form-control"  name="fundingBankName" value="<%= fundingDetail.getFundingBankName() %> "></td>
						</tr>
					</table>
					<div style="clear:both">
						<p>후원상세내용 : </p>
						<textarea id="summernote" name="fundingDetail"><%= fundingDetail.getFundingDetail() %></textarea>
					</div>
					<input class="btn btn-success" onclick="fnUpdateFunding();" value="수정하기">
				<%} else { %>
					<!-- 남의글 수정 불가 -->
					<table class="col-sm-6 fdetail_tb">
	        			<tr>
			     			<td><h2 class="f_title3">후원타이틀 : </h2></td>
			     			<td><h2 class="f_title3"><%= fundingDetail.getFundingTitle() %></h2></td>
						</tr>
						<tr>
							<td><p><span class="glyphicon glyphicon-grain">회원(기관) : </p></td>
							<td><%= fundingDetail.getMemId() %></td>
						</tr>
						<tr>
							<td><p><span class="glyphicon glyphicon-bullhorn"></span>&nbsp;&nbsp;목표금액 : </p></td>
							<td><%= fundingDetail.getTargetAmount() %></td>
						</tr>
						<tr>
							<td><p><span class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;후원 시작 날짜 : </td>
							<td><%= fundingDetail.getFundingStartDate() %></td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;후원 마감 날짜:</td>
	                        <td><%= fundingDetail.getFundingEndDate() %></td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-piggy-bank"></span>&nbsp;&nbsp;계좌번호:</td>
							<td><%= fundingDetail.getFundingAccount() %></td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-piggy-bank"></span>&nbsp;&nbsp;예금주:</td>
							<td><%= fundingDetail.getFundingAccountHolder() %></td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-piggy-bank"></span>&nbsp;&nbsp;은행명:</td>
							<td><%= fundingDetail.getFundingBankName() %></td>
						</tr>
					</table>
					<div style="clear:both">
						<p>후원상세내용 : </p>
						<p><%= fundingDetail.getFundingDetail() %></p>
					</div>
				<%}%>
		     </form>
		     <%
		  		// 일반 회원
        		} else if( "1".equals( param.getMemGb() ) ) {
		     %>
		     
		     <%-- 일반 회원 --%>
		     <form id="donateForm" action="<%=request.getContextPath() %>/donate/Donate.do" method="post">
		     	 <input type="hidden" id="fundingId" name="fundingId" value="<%= fundingDetail.getFundingId() %>">
		     	 <input type="hidden" id="memId" name="memId" value="<%= fundingDetail.getMemId() %>">
		     	 <table class="col-sm-6 fdetail_tb thum">
					<tr>
						<td>
							<img src="<%= fundingDetail.getFundingThumbnail() %>" class="thumb_img_normal" alt="" style="width:400px">
						</td>
					</tr>
				 </table>
        		 <table class="col-sm-6 fdetail_tb">
        		 	<tr>
        		 		 <td><h2 class="f_title2">후원명 : <%= fundingDetail.getFundingTitle() %></h2></td>
        		 	</tr>
					<tr>
						<td><p style="color:#ccc">후원자아이디 : <%= fundingDetail.getMemId() %></p></td>
					</tr>
					<tr>
						<td><p><span class="glyphicon glyphicon-bullhorn"></span>&nbsp;&nbsp;목표금액 : <%= fundingDetail.getTargetAmount() %></p></td>
					</tr>
					<tr>
						<td><p><span class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;후원기간 :&nbsp;&nbsp;<%= fundingDetail.getFundingStartDate() %>부터  <%= fundingDetail.getFundingEndDate() %>까지</p></td>
					</tr>
					<tr>
						<td colspan="2"><span class="glyphicon glyphicon-piggy-bank"></span>&nbsp;&nbsp;계좌번호: <input type="text" class="form-control" id="donateAccount" name="donateAccount" value=""></td>
					</tr>
					<tr>
						<td colspan="2"><span class="glyphicon glyphicon-piggy-bank"></span>&nbsp;&nbsp;예금주: <input type="text" class="form-control"  id="donateAccountHolder" name="donateAccountHolder" value=""></td>
					</tr>
					<tr>
						<td colspan="2"><span class="glyphicon glyphicon-piggy-bank"></span>&nbsp;&nbsp;은행명: <input type="text" class="form-control" id="donateBankName" name="donateBankName" value=""></td>
					</tr>
					<tr>
						<td colspan="2" style="padding:50px 0">
							<input type="text" class="form-control-lg" name="donateAmount" id="donateAmount" value="" />원 
	        				<input id="final-support-submit" onclick="fn_direct_pay()" type="button" class="btn btn-success" value="후원하기">
	        			</td>
					</tr>
				 </table>
				 <div class="col-sm-12 editorview">
					<%= fundingDetail.getFundingDetail() %>
				<div>
					
				</div>
		        </div>
		     </form>
		     <%
		     }
		     %>
		     <a href="/funding/List.do" class="btn btn-success" style="float:right;margin:2% 0;width:150px">목록</a>
        		
        </div><!-- row End -->
    </div><!-- container End -->
    
</body>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$(document).ready(function(){
	$('.menu_wrap').hide();
	$('.gnbmenu').mouseover(function(){
		$('.menu_wrap').slideDown();
	});
	$('.container').mouseover(function(){
		$('.menu_wrap').hide();	
	});
});
// 펀딩 내역 수정
function fnUpdateFunding(){
	if( confirm("수정하시겠습니까?") ){
		$("#fundingForm").submit();
	}else{
		return false;
	}
}

// 후원하기 결제
function fn_direct_pay(){
	
	var donateAccount = $("#donateAccount").val();		// 계좌번호
	var donateAccountHolder = $("#donateAccountHolder").val();	// 예금주
	var donateBankName = $("#donateBankName").val();		// 은행명
	
	var fundingId = $("#fundingId").val();
	var donateAmount = $("#donateAmount").val();
	
	if(donateAccount == "" || donateAccount == null ){
		alert("계좌번호를 입력하세요.");
		return false;
	}
	
	if(donateAccountHolder == "" || donateAccountHolder == null ){
		alert("예금주를 입력하세요.");
		return false;
	}
	
	if(donateBankName == "" || donateBankName == null ){
		alert("은행명을 입력하세요.");
		return false;
	}
	
	// 카카오 결제 API
	var IMP = window.IMP; 
	IMP.init('imp30508232');
	IMP.request_pay({
		pg : 'kakaopay', 
		pay_method: 'card',
		merchant_uid : '', // 결제 id 중복으로 결제 방지
		name : '온프로젝트 후원',			// 이거나
		amount : donateAmount , 	// 결제 금액
		customer_uid : 'test000',	// 
		buyer_email : '',	// 우리가 없잖아 
		buyer_name : '',			// 후원 기관
		buyer_tel : '',			// 후원기관 전화번호 
		buyer_addr : '',			// 후원기관 주소
	}, function(rsp) { 
		if ( rsp.success ) {
			console.log('빌링키 발급 성공', rsp);
			alert('후원 결제가 완료되었습니다');
		} else {
			var msg = '결제에 실패하였습니다.\n';
			msg += rsp.error_msg;
			alert(msg);
			return false;
		}
		$("#donateForm").submit();
	});
}
//펀딩 내역 에디터
$(document).ready(function() {
	$('#summernote').summernote();
});

$('input[name=thumbnail]').on('click', function(){
	$('input[name=isChange]').val("click");
});

</script>
</html>