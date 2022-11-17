<%@page import="funding.vo.FundingVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
	List<FundingVO> fundingList = (List<FundingVO>) request.getAttribute("list");
	FundingVO param = (FundingVO) request.getAttribute("param");
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
  <!-- header -->
	<header>
		<div class="hd_wrap">
			<h1 class="logo">
				<a href="index.html">온(ON:溫)</a>
			</h1>
			<nav class="gnb">
				<ul class="gnbmenu">
					<li>소개</li>
					<li>봉사</li>
					<li>후원</li>
					<li>재능기부</li>
					<li>커뮤니티</li>
					<li>마이페이지</li>
				</ul>
				<a href="#" class="loginbt">로그아웃</a>
			</nav>
		</div>
	</header>
	<!-- //header -->
	<!-- inside -->
	<div class="menu_wrap">
		<ul>
			<li><a href="">메뉴1</a> <a href="">메뉴1</a> <a href="">메뉴1</a></li>
			<li><a href="">메뉴2</a> <a href="">메뉴1</a> <a href="">메뉴1</a></li>
			<li><a href="">메뉴3</a> <a href="">메뉴1</a> <a href="">메뉴1</a></li>
			<li><a href="">메뉴1</a> <a href="">메뉴1</a> <a href="">메뉴1</a></li>
			<li><a href="">메뉴1</a> <a href="">메뉴1</a> <a href="">메뉴1</a></li>
			<li><a href="">메뉴1</a> <a href="">메뉴1</a> <a href="">메뉴1</a></li>
		</ul>
	</div>
  
  
  	<!-- 중앙 화면  -->
 	<div class="bigWrap">
      <div class="container">
      	<form id="listForm" method="post">
      		<input type="hidden" id="stopFundingId" name="stopFundingId" value="" />
      		<input type="hidden" id="cancelDonateId" name="cancelDonateId" value="" />
      		<input type="hidden" id="detailFundingId" name="detailFundingId" value="" />
      		
    	<h1>후원목록</h1>
        <%
        // 기관 사용자 인 경우 
        if( "2".equals( param.getMemGb() ) ){
        %>
        <a href="insertView.do" class="btn btn-success" style="float:right;">신규 후원글 등록</a>
        <%  } %>
        <%
        
        if(fundingList.size() > 0){
        	for(int i=0; i<fundingList.size(); i++ ){
        %>
        <div class="row" style="clear:both;margin-top:10%">
          <div class="col-sm-4">
            <a href="#"><img src="" style="width:200px;height:200px;border:1px solid red"></a>
          </div>
          <div class="col-sm-6">
            <p>후원코드 : <%= fundingList.get(i).getFundingId() %></p>
            <h2>후원명 : <%= fundingList.get(i).getFundingTitle() %></h2>
            <p>후원기관 : <%= fundingList.get(i).getMemId() %></p>
            <p>목표금액 : <%= fundingList.get(i).getTargetAmount() %></p>
            <p>현재금액 : <%= fundingList.get(i).getRecentAmount() %></p>
            <p>후원기간 : <%= fundingList.get(i).getFundingStartDate() %> -  <%= fundingList.get(i).getFundingEndDate() %></p>
            <p>후원상세내용 : <%= fundingList.get(i).getFundingDetail() %></p>
          </div>
          <div class="col-sm-2">
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
        <%--
        <c:set var="currentPage" value="${requestScope.cPage}"/>
		<c:set var="endPage" value="${requestScope.ePage}"/>
		현재페이지 : <c:out value="${currentPage}" />
		<div id="pagelist">
			<ul class="pager">
				<li><a class="prev" href="#">Prev</a></li>
			</ul>
			<ul class="pagination pager">
				<c:forEach var ="i" begin="${requestScope.sPage}" end="${requestScope.ePage}">
					<c:if test="${currentPage==i}">
						<li class="active"><a class="paging" href="#">${i}</a></li>
					</c:if>
					<c:if test="${currentPage!=i}">
						<li><a class="paging" href="#">${i}</a></li>
					</c:if>
				</c:forEach>
			</ul>
			<ul class="pager">
				<li><a class="next" href="#">Next</a></li>
			</ul>
		</div>
		 --%>
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

// 후원 취소
function fnCancelDonateClick( strId ){
	// strId -> 펀딩Id 취소 대상
	if( confirm("후원을 취소하시겠습니까?") ){
		$('#cancelDonateId').val(strId);
		$("#listForm").attr("action", "Cancel.do");
		$("#listForm").submit();
	}else{
		return false;
	}
}

// 상세보기 
function fnDetail( strId ){
	$('#detailFundingId').val(strId);
	$("#listForm").attr("action", "Detail.do");
	$("#listForm").submit();
	// javascript 방식
	// document.forms["listForm"].submit();
}


// Detail

</script>
