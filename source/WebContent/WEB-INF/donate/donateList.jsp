<%@page import="donate.vo.DonateVO"%>
<%@page import="funding.vo.FundingVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
	List<DonateVO> donateList = (List<DonateVO>) request.getAttribute("DonateList");
	DonateVO param = (DonateVO) request.getAttribute("param");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>후원 목록</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<form id="donateForm" method="post">
		<input type="hidden" id="detailFundingId" name="detailFundingId" value="" />
  	<!-- 중앙 화면  -->
 	<div class="bigWrap">
      <div class="container">
      	<div id="donatelist">
      	      		
    	<h1>내가 기부한 내역</h1>
       <%
        if(donateList.size() > 0){
        	for(int i=0; i<donateList.size(); i++ ){
        %>
        <div class="row" style="clear:both;margin-top:10%">
          <div class="col-sm-6">
            <p>기부코드 : <%= donateList.get(i).getFundingId() %></p>
            <h2>기부명 : <%= donateList.get(i).getFundingTitle() %></h2>
            <p>기부금액 : <%= donateList.get(i).getDonateAmount() %></p>
            <p>환불 받을 계좌 : <%= donateList.get(i).getDonateAccount() %></p>
            <p>환불 받을 계좌 예금주 : <%= donateList.get(i).getDonateAccountHolder() %></p>
            <p>환불 받을 계좌 은행 : <%= donateList.get(i).getDonateBankName() %></p>
            <p>후원일시 : <%= donateList.get(i).getDonateDate() %></p>
	           	<a href="#" id="morebt" class="btn btn-success" onClick="fnDetail('<%=donateList.get(i).getFundingId() %>')" >상세 보기</a>
            	
            	<button onclick="fnDetail('<%=donateList.get(i).getFundingId() %>')">테스트 버튼 클릭 </button>
          </div>
        </div>
        <%
        	}
        }
        %>
        </form>
        		</div>
        	</div>
        </div>
	</body>
</html>
<script>
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
</script>
