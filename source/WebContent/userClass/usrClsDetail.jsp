<%@page import="userClass.vo.ReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="userClass.vo.UsrClsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
UsrClsVO usrClsVO = (UsrClsVO)request.getAttribute("usrClsVO");
List<ReplyVO> replyList = (List<ReplyVO>)request.getAttribute("replyList");

String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg"); // 세션은 계속 유지되니 속성값 삭제
%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>상세페이지</h1>
	<table border="1">
		<tr>
			<th>1</th>
			<th>2</th>
			<th>3</th>
			<th>4</th>
			<th>5</th>
		</tr>
		<tr>
			<td><%=usrClsVO.getClassId()%></td>
			<td><%=usrClsVO.getClassTitle()%></td>
			<td><%=usrClsVO.getMemId()%></td>
			<td><%=usrClsVO.getClassContent()%></td>
			<td><%=usrClsVO.getClassViews()%></td>
		</tr>
	</table>

	<div>
		<button onclick="f_list()">목록</button>
		<button>댓글</button>
	</div>

	<!--     session 로그인시 보이는 버튼 -->
	<div>
		<!-- Trigger the modal with a button -->
		<!-- data-backdrop="false", true, static -->
		<button type="button" class="btn btn-info btn-sm test"
			data-toggle="modal" data-target="#myModal" data-backdrop="true">삭제
			모달 버튼</button>
		<button onclick="f_update()">수정</button>
	</div>

	<!-- Modal -->
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

	<!-- --------------------댓글-------------------------------- -->
	<h4>Leave a Comment:</h4>
	<form action="UsrClsDetail.do" role="form" method="post" >
		<div class="form-group">
			<input type="hidden" name="classId" value="<%=usrClsVO.getClassId()%>">
			<input type="hidden" name="depth" value="1">
			<textarea name="replyContent" class="form-control" rows="3" required></textarea>
		</div>
		<button class="btn btn-success" id="btn_replySubmit">Submit</button>
	</form>
	<br>
	<br>
	
	<p>
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
	          <img src="../images/default/wallpaper.jpg" class="img-circle" height="65" width="65" alt="Avatar">
	        </div>
			<div class="col-sm-10">
				<h4><%=replyList.get(i).getMemId() %></h4>
				<p><%=replyList.get(i).getReplyContent() %></p>
				<!-- 로그인해서 자기 글인 경우 답글 가능 -->
				<div>
					<button type="button" class="btn btn-info btn-sm btnReplyDelete"
						data-toggle="modal" data-target="#deleteReply" data-backdrop="true" 
						data-id="<%=replyList.get(i).getReplyId()%>">삭제모달 버튼</button>
					<button type="button" class="btn btn-info btn-sm btnReply" id="btnRd"
						data-toggle="modal" data-target="#secondReply" data-backdrop="true" 
						data-id="<%=replyList.get(i).getReplyId()%>">답글모달 버튼</button>
				</div>
				<br>
				<!-- 댓글 2층 -->
				<%
				while(i+1 <replyList.size() && replyList.get(i+1).getDepth()==2){			
					i++;
				%>
				<div id="id_<%=replyList.get(i).getReplyId() %>">
					<div class="row">
						<div class="col-sm-2 text-center">
			          		<img src="../images/default/wallpaper.jpg" class="img-circle" height="65" width="65" alt="Avatar">
			        	</div>
						<div class="col-xs-10">
							<h4><%=replyList.get(i).getMemId() %></h4>
							<p><%=replyList.get(i).getReplyContent()%></p>
							<div>
								<button type="button" class="btn btn-info btn-sm btnReplyDelete"
									data-toggle="modal" data-target="#deleteReply" data-backdrop="true" 
									data-id="<%=replyList.get(i).getReplyId()%>">삭제모달 버튼</button>
							</div>
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

	<script>
    function f_list(){
    	location.href= "/UsrClsList.do";
    };
    
    function f_update(){
    	location.href="<%=request.getContextPath()%>/UsrClsUpdate.do?classId=<%=usrClsVO.getClassId()%>";
    };
    
    // 게시글 삭제
    $('.delete').on('click',function(){
    	location.href= "<%=request.getContextPath()%>/UsrClsDelete.do?classId=<%=usrClsVO.getClassId()%>";
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

    
    
    <%if (msg.equals("성공")) {%>
		alert("정상적으로 처리되었습니다");
	<%}%>
    </script>
</body>
</html>
