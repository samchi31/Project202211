<%@page import="funding.vo.FundingVO"%>
<%@page import="donate.vo.DonateVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DonateVO donateDetail = (DonateVO)request.getAttribute("detail");    
	FundingVO fundingDetail = (FundingVO)request.getAttribute("detail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<script type="text/javascript">
var donateAmount = $('#donateAmount').val();
//카카오페이
function fn_direct_pay(){
     
   // 카카오 결제 API
     var IMP = window.IMP; 
     IMP.init('imp30508232');  
     IMP.request_pay({
         pg : 'kakaopay', 
         pay_method: 'card',
         merchant_uid : '<%= donateDetail.getFundingId() %>', 
         name : '<%= fundingDetail.getFundingTitle() %>',
         amount : donateAmount, 
        
         customer_uid : '<%= donateDetail.getMemId() %>',
         buyer_email : 'iamport@siot.do',
         buyer_name : '세상에공짜는없조',
         buyer_tel : '02-1234-1234',
         buyer_addr : '서울시청담동',
     }, function(rsp) { 
         if ( rsp.success ) {
           console.log('빌링키 발급 성공', rsp)
           
           alert('예약 결제가 완료되었습니다');
         } else {
           var msg = '결제에 실패하였습니다.\n';
           msg += rsp.error_msg;
           alert(msg);
           return false;
         }
         $("#final-support-submit").submit();
     });
}
</script>
</html>