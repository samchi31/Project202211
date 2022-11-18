<%@page import="funding.vo.FundingVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
	List<FundingVO> fundingList = (List<FundingVO>) request.getAttribute("list");
	FundingVO param = (FundingVO) request.getAttribute("param");
	String isIns = (String)request.getAttribute("isIns");
	
	MemberVO memVo = (MemberVO)request.getSession().getAttribute("loginUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>후원 목록</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/funding.css">
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

</head>
<body>
	<%@ include file="../header.jsp"%>
  	<!-- 중앙 화면  -->
 	<div class="bigWrap">
      <div class="container">
      	<form id="listForm" method="post">
      		<input type="hidden" id="stopFundingId" name="stopFundingId" value="" />
      		<input type="hidden" id="cancelFundingId" name="cancelFundingId" value="" />
      		<input type="hidden" id="detailFundingId" name="detailFundingId" value="" />
      		<input type="hidden" id="pageNo" name="pageNo" value="<%=param.getPageNo()%>" />
      		<input type="hidden" id="totalPageNo" name="totalPageNo" value="<%=param.getTotalPageNo()%>" />
      		
      		<input type="hidden" id="pageTotRowCnt" name="pageTotRowCnt" value="<%=param.getPageTotRowCnt()%>" />
      		

		<h1 class="f_title">후원목록
			<p>DONATE</p>
		</h1>
        <%
        // 기관 사용자 인 경우 
        if( isIns.equals("true") ){
        %>
        <a href="InsertView.do" class="btn btn-info" style="float:right;">신규 후원글 등록</a>
        <% 
        }         
        if(fundingList.size() > 0){
        	for(int i=0; i<fundingList.size(); i++ ){
        %>
        <div class="row" data-aos="fade-up">
          <div class="col-sm-6">
            <a href="#" onClick="fnDetail('<%=fundingList.get(i).getFundingId() %>')" >
            	<!-- <img src="funding/Filedownload.do?fundingId=<%= fundingList.get(i).getFundingId() %>" class="media-object thumbnailImg"/>-->
            	<img src="<%= fundingList.get(i).getFundingThumbnail() %>" class="media-object thumbnailImg"/>
            </a>
          </div>
          <div class="col-sm-6">
           	<p><span class="glyphicon glyphicon-tag"></span>&nbsp;&nbsp;후원코드 : <%= fundingList.get(i).getFundingId() %></p>
            <h2 class="f_title2"><%= fundingList.get(i).getFundingTitle() %></h2>
            <p><span class="glyphicon glyphicon-bullhorn"></span>&nbsp;&nbsp;목표금액 : <%= fundingList.get(i).getTargetAmount() %></p>
            <p><span class="glyphicon glyphicon-bullhorn"></span>&nbsp;&nbsp;현재금액 : <%= fundingList.get(i).getRecentAmount() %></p>
            <p><span class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;후원기간 : <%= fundingList.get(i).getFundingStartDate() %> -  <%= fundingList.get(i).getFundingEndDate() %></p>
            <%--><p><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;후원상세내용 : <%= fundingList.get(i).getFundingDetail() %></p> --%>
            <%  if( "2".equals( param.getMemGb()) ){ // 기관 사용자 인 경우   상세 보기  %>
	      	<a href="#" id="morebt" class="btn btn-success" onClick="fnDetail('<%=fundingList.get(i).getFundingId() %>')" >상세 보기</a>
	      <% } else if( "1".equals( param.getMemGb()) ) { // 일반인  경우 상세보기/취소버튼 %>
	      	<a href="#" id="morebt" class="btn btn-success" onClick="fnDetail('<%=fundingList.get(i).getFundingId() %>')" >상세 보기</a>
          	<%  if( "Y".equals( fundingList.get(i).getDonateYn() ) ){ // 기관 사용자 인 경우   상세 보기  %>
          		<a href="#" id="cancelbt" class="btn btn-success" onClick="fnCancelDonateClick('<%=fundingList.get(i).getFundingId() %>')" >후원 취소</a>
          	<% } %>
	      <% } else if( "9".equals( param.getMemGb()) ) { // 관리자  후원중지  %>
	      	<a href="#" id="stopbt" class="btn btn-success" onClick="fnStopFundingClick('<%=fundingList.get(i).getFundingId() %>')" >후원 중지</a>
	      <% } %>
         </div>
        </div>
        <%
        	}
        }
        %>
		현재페이지 : <%=param.getPageNo()%>
		<div id="pagelist">
			<ul class="pager">
				<li><a class="prev" href="#" onclick="fnPrev(<%=param.getFirstPageNo() %>);">Prev</a></li>
			</ul>
			<ul class="pagination pager">
				<%for(int i=param.getFirstPageNo(); i <= param.getLastPageNo(); i++ ){ %>					
					<li><a class="paging" href="#" onclick="fnReSearch(<%=i%>);" ><%=i%></a></li>
				<%} %>
			</ul>
			<ul class="pager">
				<li><a class="next" href="#" onclick="fnNext(<%=param.getLastPageNo() %>);">Next</a></li>
			</ul>
		</div>
        </form>
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

// 이전 목록 
function fnPrev(firstPage){
	if(firstPage > 1){
		fnReSearch(firstPage - 1);
	}
}

//다음 목록
function fnNext(lastPage){
	var totPageNo = $('#totalPageNo').val();
	
	if(lastPage < totPageNo){
		fnReSearch(lastPage + 1);
	}
}


function fnReSearch(pageNo){
	$('#pageNo').val(pageNo);
	$("#listForm").attr("action", "List.do");
	$("#listForm").submit();
}

// 후원 중지 
function fnStopFundingClick( strId ){
	// strId -> 펀딩Id 취소 대상
	if( confirm("후원을 중지시키겠습니까?") ){
		$('#stopFundingId').val(strId);
		$("#listForm").attr("action", "Stop.do");
		$("#listForm").submit();
	}else{
		return false;
	}
}

// 후원 취소 (일반회원)
function fnCancelDonateClick( strId ){
	// strId -> 펀딩Id 취소 대상
	if( confirm("후원을 취소하시겠습니까?") ){
		$('#cancelFundingId').val(strId);
		$("#listForm").attr("action", "/donate/Cancel.do");
		$("#listForm").submit();
	}else{
		return false;
	}
}

// 상세보기 
function fnDetail( strId ){
	$('#detailFundingId').val(strId);
	$("#listForm").attr("action", "Detail.do?donateId=");
	$("#listForm").submit();
	// javascript 방식
	// document.forms["listForm"].submit();
}
</script>
