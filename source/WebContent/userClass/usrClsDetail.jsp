<%@page import="member.vo.MemberVO"%>
<%@page import="userClass.vo.ReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="userClass.vo.UsrClsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

MemberVO memberVO = (MemberVO) request.getSession().getAttribute("loginUser");

UsrClsVO usrClsVO = (UsrClsVO)request.getAttribute("usrClsVO");
List<ReplyVO> replyList = (List<ReplyVO>)request.getAttribute("replyList");

String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg"); // 세션은 계속 유지되니 속성값 삭제
%>

<!DOCTYPE html>
<html> 
<head>
<title>재능기부 상세페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/usrCls.css">

<style>
#btnList{
	display :block;
	margin-left:50%; float:right
}
.row_block{
	display :block;
}
#thumb{
	
	height:100%;
}
.text-center{
	margin-top:100px
	margin: auto;
}
.text-center * {
	justify-content : center;
}

#btn_replySubmit{
	margin-left:85%
}

table{
	margin-left:auto;
	margin-right:auto;
}

.titleMargin{
	margin-left:10%;

}


</style>

</head>


<body>
<%
if(memberVO==null){
%>
	<%@ include file="../header.jsp"%>
<%
}else{
%>
	<%@ include file="../WEB-INF/header.jsp"%>
<%
}
%>

<div class="bigWrap container">
      <div class="jumbotron f_title row_block">
        <h2><%=usrClsVO.getClassTitle()%></h1>
        <p>DETAIL</p>
      </div>
      
      	<div id="btnList" class="row_block">
			<button class="btn" onclick="f_list()" style="display :inline-block;">목록</button>
			<button class="btn moveRp"  style="display :inline-block;">댓글</button>
			<!--     session 로그인시 보이는 버튼 -->
			<%
			if(memberVO!=null&&memberVO.getMemId().equals(usrClsVO.getMemId())){
			%>
			<!-- Trigger the modal with a button -->
			<!-- data-backdrop="false", true, static -->
			<button type="button" class="btn btn-danger"
				data-toggle="modal" data-target="#myModal" data-backdrop="true">삭제</button>
			<button class="btn btn-info" onclick="f_update()">수정</button>
			<%
			}
			%>
		</div>
		<div class="row_block post_detail">
			<table>
				<tr class="title3">
					<td rowspan="3" class="text-center " style="height:200px; magin-right:10%;">
						<img id="thumb" alt="" src="<%=usrClsVO.getClassThumbnail()%>">
					</td>
					<td style="width:150px">
					<span class="glyphicon glyphicon-pencil"/>&nbsp;&nbsp;작성자:
					</td>
					<td >
					<%=usrClsVO.getMemId()%> 
					</td>
				</tr>
				<tr class="title3">
					<td style="width:150px">
					<span class="glyphicon glyphicon-calendar"/>&nbsp;&nbsp;작성날짜:
					</td>
					<td>
					<%=usrClsVO.getClassDate()%>
					</td>
				</tr>
				<tr class="title3">
					<td colspan="2" style="width:200px">
					<span class="glyphicon glyphicon-tag"/>&nbsp;<%=usrClsVO.getClsCtId()%>
					&nbsp;&nbsp;
					<span class="glyphicon glyphicon-eye-open"/>&nbsp;<%=usrClsVO.getClassViews()%>
					</td>
				</tr>
				<tr>
					<td colspan="3">
					<hr style="width:100%;margin-top:10%;text-align:center;">
					</td>
				</tr>
				
				<tr>
					<td colspan="3" style="clear:both">
					<div >
						<%=usrClsVO.getClassContent()%>					
					</div>
					</td>
				</tr>
			</table>
	
			<!-- --------------------댓글-------------------------------- -->
			<div>
				<br><br>
				<h4>Leave a Comment:</h4>
				<form action="UsrClsDetail.do" role="form" method="post" >
					<div class="form-group">
						<input type="hidden" name="classId" value="<%=usrClsVO.getClassId()%>">
						<input type="hidden" name="depth" value="1">
						<textarea name="replyContent" class="form-control" rows="3" placeholder="로그인 후 이용 가능합니다" required></textarea>
					</div>
					<%
					if(memberVO!=null){
					%>
						<button class="btn btn-success">Submit</button>
					<%
					}
					%>
				</form>
			</div>
			
			<p>
				<br><br>
				<span class="badge"><%=replyList.size() %></span> Comments:
			</p>
		
			<div class="row">
				
				<!-- 댓글 1층 -->
				<%
				for(int i = 0; i < replyList.size(); i++ ) {
					if(replyList.get(i).getDepth() == 1){
				%>
				<div id="id_<%=replyList.get(i).getReplyId() %>">
					<div class="col-sm-2 text-center">
			          <img src="<%=request.getContextPath() %>/images/default/default.jpg" class="img-circle" height="65" width="65" alt="Avatar">
			        </div>
					<div class="col-sm-10">
						<h4><%=replyList.get(i).getMemId() %></h4>
						<p><%=replyList.get(i).getReplyContent() %></p>
						<!-- 로그인해서 자기 글인 경우 답글 가능 -->
						<%
						if(memberVO!=null&&(memberVO.getMemId().equals(replyList.get(i).getMemId())||memberVO.getMemId().equals(usrClsVO.getMemId()))){
						%>
						<div>
							<button type="button" class="btn btn-warning btn-sm btnReplyDelete"
								data-toggle="modal" data-target="#deleteReply" data-backdrop="true" 
								data-id="<%=replyList.get(i).getReplyId()%>">삭제</button>
							<button type="button" class="btn btn-info btn-sm btnReply" id="btnRd"
								data-toggle="modal" data-target="#secondReply" data-backdrop="true" 
								data-id="<%=replyList.get(i).getReplyId()%>">답글</button>
						</div>
						<%
						}
						%>
						<br>
						<!-- 댓글 2층 -->
						<%
						while(i+1 <replyList.size() && replyList.get(i+1).getDepth()==2){			
							i++;
						%>
						<div id="id_<%=replyList.get(i).getReplyId() %>">
							<div class="row">
								<div class="col-sm-2 text-center">
					          		<img src="<%=request.getContextPath() %>/images/default/default.jpg" class="img-circle" height="65" width="65" alt="Avatar">
					        	</div>
								<div class="col-xs-10">
									<h4><%=replyList.get(i).getMemId() %></h4>
									<p><%=replyList.get(i).getReplyContent()%></p>
									<%
									if(memberVO!=null&&(memberVO.getMemId().equals(replyList.get(i).getMemId()))){
									%>
									<div>
										<button type="button" class="btn btn-info btn-sm btnReplyDelete"
											data-toggle="modal" data-target="#deleteReply" data-backdrop="true" 
											data-id="<%=replyList.get(i).getReplyId()%>">삭제</button>
									</div>
									<%
									}
									%>
									<br>
								</div>
							</div>
						</div>
						<%
						}	//while
						%>
					</div>
				</div>
				<%
					}	//if(replyList.get(i).getDepth()==1){
				}		//for(int i=0; i <= replyList.size(); i++ )
				%>
			</div>
		<!-- --------------------댓글끝-------------------------------- -->
		</div>
	</div>
	<!-- ---------------------------------Modal------------------------------- -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
	
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">경고</h4>
					</div>
					<div class="modal-body">
						<p>게시글을 삭제하시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default delete"
							data-dismiss="modal">삭제</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
	
			</div>
		</div>
	
	<!-- replydeleteModal -->
		<div id="deleteReply" class="modal fade" role="dialog">
			<div class="modal-dialog">
	
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">경고</h4>
					</div>
					<div class="modal-body">
						<p>답글을 삭제하시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-dismiss="modal" id="id_modalReplyDelete">삭제</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
	
			</div>
		</div>
		
		<!-- replyAddModal -->
		<div id="secondReply" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">답글</h4>
					</div>
					<div class="modal-body">
						<form action="UsrClsDetail.do" role="form" method="post" >
						  <div class="form-group">
					        	<label class="control-label col-sm-2">내용</label>
					        	<div class="col-sm-10">
					          		<textarea class="txt form-control" rows="5" cols="50" name="replyContent" required></textarea><br>
					        	</div>
					      </div>
					      <input type="hidden" name="classId" value="<%=usrClsVO.getClassId()%>">
						  <input type="hidden" name="depth" value="2">
						  <input type="hidden" name="parentId">
					      <button class="btn btn-success" id="btn_replySubmit">Submit</button>
					   </form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	<!-- ---------------------------------Modal끝------------------------------- -->
	<script>
    function f_list(){
    	location.href= "/UsrClsList.do";
    };
    
    function f_update(){
    	location.href="<%=request.getContextPath()%>/UsrClsUpdate.do?classId=<%=usrClsVO.getClassId()%>";
    };
    
    // 게시글 삭제
    $('.delete').on('click',function(){
    	<%
    	if(memberVO==null){
    	%>
    		alert("로그인 후 가능합니다")
    	<%
    	} else if(memberVO.getMemId().equals(usrClsVO.getMemId())){
    	%>
    		location.href= "<%=request.getContextPath()%>/UsrClsDelete.do?classId=<%=usrClsVO.getClassId()%>";
    	<%
    	}
    	%>
    });
    
    // 답글 삭제
    let deleteRpId;
    $('.btnReplyDelete').on('click',function(){
//     	console.log($(this).data('id'));
    	deleteRpId = $(this).data('id');
    });    
    $('#id_modalReplyDelete').on('click',function(){
    	location.href= "<%=request.getContextPath()%>/ReplyDelete.do?deleteRpId="+deleteRpId+"&classId=<%=usrClsVO.getClassId()%>";
    });
    
	// 답글 남길때 부모 댓글 id 얻기
	$('.btnReply').on('click',function(){
		let prtId = $(this).data('id');		
		$('input[name=parentId]').val(prtId);
	});
	
	$(document).ready(function(){
		$('.menu_wrap').hide();
		$('.gnbmenu').mouseover(function(){
			$('.menu_wrap').slideDown();
		});
// 		$('.menu_wrap').mouseout(function(){
// 			$('.menu_wrap').hide();
// 		});
		$('.container').mouseover(function(){
			$('.menu_wrap').hide();
		});
	});

	$(".moveRp").click(function() {
	    $('html,body').animate({
	        scrollTop: $(".badge").offset().top},
	        'slow');
	});
    
    <%if (msg.equals("성공")) {%>
		alert("정상적으로 처리되었습니다");
	<%}%>
    </script>
</body>
</html>
