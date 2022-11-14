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
    <link rel="stylesheet" href="/ONProject/css/funding.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
 	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
    <style>
    </style>
</head>
<body>
    <div class="container">
        <h1 class="f_title">후원 상세정보
			<p>FUNDING</p>
		</h1>
        <div class="row">
        	<%
       		if( "2".equals( param.getMemGb() ) ){
       	    %>
       	    <%-- 기관형식에서 수정 --%>
        	<form id="fundingForm" action="<%=request.getContextPath() %>/funding/Update.do" method="post">
        		<input type="hidden" id="fundingId" name="fundingId" value="<%= fundingDetail.getFundingId() %>">
		     	<input type="hidden" id="memId" name="memId" value="<%= fundingDetail.getMemId() %>">
        		<table class="col-sm-4">
        			<tr>
		     			<td>
		     				<img src="http://localhost:8889/<%=request.getContextPath() %>/WebContent/images/thumbnail/br5.jpg" alt="">
		     				<input class="form-control input-sm" style="width:80%;margin:20px auto;" type="file" name="atchFile">
		     			</td>
					</tr>
		     		</tr>
				</table>
        		<table class="col-sm-8">
        			<tr>
		     			<td><h2 class="f_title2">후원타이틀 : </h2></td>
		     			<td>
							<input class="form-control input-lg" type="text" name="fundingTitle" value="<%= fundingDetail.getFundingTitle() %> ">
						</td>
					</td>
					<tr>
						<td><p><span class="glyphicon glyphicon-grain">후원기관 : <%= fundingDetail.getMemId() %></p></td>
					</tr>
					<tr>
						<td><p><span class="glyphicon glyphicon-bullhorn"></span>&nbsp;&nbsp;목표금액 : </p></td>
						<td>
							<input type="text" class="form-control"  name="targetAmount" value="<%= fundingDetail.getTargetAmount() %> ">
						</td>
					</tr>
					<tr>
						<td><p><span class="glyphicon glyphicon-bullhorn"></span>&nbsp;&nbsp;현재금액 : <%= fundingDetail.getRecentAmount() %></p></td>
					</tr>
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
					<tr>
						<td><p>후원상세내용 : </p></td>
						<td>
							<textarea id="summernote" name="fundingDetail"><%= fundingDetail.getFundingDetail() %></textarea>
						</td>
					</tr>
				</table>
				<input class="btn btn-success" onclick="fnUpdateFunding();" value="수정하기">
		     </form>
		     <%
        		} else {
		     %>
		     
		     <%-- 일반 회원 --%>
		     <form id="donateForm" action="<%=request.getContextPath() %>/donate/Donate.do" method="post">
		     	 <input type="hidden" id="fundingId" name="fundingId" value="<%= fundingDetail.getFundingId() %>">
		     	 <input type="hidden" id="memId" name="memId" value="<%= fundingDetail.getMemId() %>">
		     	 <input type="hidden" id="donateAccount" name="fundintId" value="<%= fundingDetail.getFundingId() %>">
		     	 <input type="hidden" id="donateAccountHolder" name="fundintId" value="<%= fundingDetail.getFundingId() %>">
		     	 <input type="hidden" id="donateBankName" name="fundintId" value="<%= fundingDetail.getFundingId() %>">
      			 <table>
					<tr>
						<td><h2 class="f_title2">후원명 : <%= fundingDetail.getFundingTitle() %></h2></td>
					</tr>
        			<tr>
        				<td><img src="<%= fundingDetail.getFundingId() %>"></td>
        			</tr>
					<tr>
						<td><p>후원자아이디 : <%= fundingDetail.getMemId() %></p></td>
					</tr>
					<tr>
						<td><p>목표금액 : <%= fundingDetail.getTargetAmount() %></p></td>
					</tr>
					<tr>
						<td><p>현재금액 : <%= fundingDetail.getRecentAmount() %></p></td>
					</tr>
					<tr>
						<td>
							<input type="textarea" class="form-control input-lg" name="donateAmount" id="donateAmount" value="금액 입력" />원
	        				<input type="submit" class="btn btn-success" value="후원하기">
	        			</td>
					</tr>
					<tr>
						<td><p><span class="glyphicon glyphicon-calendar">후원기간 : <%= fundingDetail.getFundingStartDate() %> -  <%= fundingDetail.getFundingEndDate() %></p></td>
					</tr>
					<tr>
						<td colspan="2"><p>후원상세내용 : <%= fundingDetail.getFundingDetail() %></p></td>
					</tr>
				</table>
		        </div>
		     </form>
		     <%
		     }
		     %>
        		
        </div>
        <a href="<%=request.getContextPath() %>/funding/List.do" class="btn btn-success">목록가기</a>
    </div>
</body>

<script>
//펀딩 내역 에디터
$(document).ready(function() {
	$('#summernote').summernote();
});







// 펀딩 내역 수정
function fnUpdateFunding(){
	if( confirm("수정하시겠습니까?") ){
		$("#fundingForm").submit();
	}else{
		return false;
	}
}




</script>
</html>