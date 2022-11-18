<%@page import="funding.vo.FundingVO"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	MemberVO memVo = (MemberVO) session.getAttribute("loginUser");
	List<FundingVO> fundingList = (List<FundingVO>) request.getAttribute("list");
	FundingVO param = (FundingVO) request.getAttribute("param");
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
			<a href="/mypage/memDetail.do?memId=<%=memVo.getMemId()%>">회원정보</a>
		</div>
		<div id=class="">
			<a href="/myVolReserv.do">봉사내역</a>
		</div>
		<div id=class="">
			<a href="/myUserClass.do">재능기부현황</a>
		</div>
		<div id=class="">
			<a href="/myDonate.do">후원내역</a>
		</div>
		<div id=class="">
			<a href="/">Q&A</a>
		</div>
	</div>

	<div id="content">
	 	<!-- 중앙 화면  -->
 	<div class="bigWrap">
      <div class="container">
      	<form id="listForm" method="post">
      		<input type="hidden" id="stopFundingId" name="stopFundingId" value="" />
      		<input type="hidden" id="cancelFundingId" name="cancelFundingId" value="" />
      		<input type="hidden" id="detailFundingId" name="detailFundingId" value="" />
      		<input type="hidden" id="pageNo" name="pageNo" value="<%=param.getPageNo()%>" />
		<h1 class="f_title">후원목록
			<p>DONATE</p>
		</h1>
        <%
        // 기관 사용자 인 경우 
        if( "2".equals( param.getMemGb() ) ){
        %>
        <a href="InsertView.do" class="btn btn-info" style="float:right;">신규 후원글 등록</a>
        <%  } %>
        <%
        
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
	      <% } else if( "99".equals( param.getMemGb()) ) { // 관리자  후원중지  %>
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
				<li><a class="prev" href="#">Prev</a></li>
			</ul>
			<ul class="pagination pager">
				<%for(int i=param.getFirstPageNo(); i <= param.getLastPageNo(); i++ ){ %>					
					<li><a class="paging" href="#" onclick="fnReSearch(<%=i%>)" ><%=i%></a></li>
				<%} %>
			</ul>
			<ul class="pager">
				<li><a class="next" href="#">Next</a></li>
			</ul>
		</div>
        </form>
        </div>
	
	</div>
	</div>

</body>
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
		$('#stopbt').css({visibility:'visible'});
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
</html>