<%@page import="userClass.vo.UsrClsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
UsrClsVO usrClsVO = (UsrClsVO)request.getAttribute("usrClsVO");
%>

<!DOCTYPE html>
<html>
  <head>
    <title>Insert title here</title>
    <link rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
    
    <button onclick="f_update()">수정</button>
    
    <button>댓글</button>
    
    <div class="container">
	<div class="form-group">
		<form method="post" encType = "multipart/form-data" action="">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tr>
<!-- 					<td style="border-bottom:none;" valign="middle"><br><br>세션ID?</td> -->
					<td><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "commentText"></td>
					<td><br><br><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td colspan="3"><input type="file" name="fileName"></td> -->
<!-- 				</tr> -->
			</table>
		</form>
	</div>
</div>
    
    </div>
    
    <!-- Trigger the modal with a button -->
	<!-- data-backdrop="false", true, static -->
	<button type="button" class="btn btn-info btn-sm test" data-toggle="modal"
		data-target="#myModal" data-backdrop="true">삭제 모달 버튼</button>

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
					<button type="button" class="btn btn-default delete" data-dismiss="modal">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>

		</div>
	</div>
	
<!-- 	댓글 -->
    <h4>Leave a Comment:</h4>
      <form role="form">
        <div class="form-group">
          <textarea class="form-control" rows="3" required></textarea>
        </div>
        <button type="submit" class="btn btn-success">Submit</button>
      </form>
      <br><br>
      
      <p><span class="badge">2</span> Comments:</p><br>
      
      <div class="row">
        <div class="col-sm-2 text-center">
          <img src="../images/default/wallpaper.jpg" class="img-circle" height="65" width="65" alt="Avatar">
        </div>
        <div class="col-sm-10">
          <h4>Anja <small>Sep 29, 2015, 9:12 PM</small></h4>
          <p>Keep up the GREAT work! I am cheering for you!! Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
          <br>
        </div>
        <div class="col-sm-2 text-center">
          <img src="../images/default/wallpaper.jpg" class="img-circle" height="65" width="65" alt="Avatar">
        </div>
        <div class="col-sm-10">
          <h4>John Row <small>Sep 25, 2015, 8:25 PM</small></h4>
          <p>I am so happy for you man! Finally. I am looking forward to read about your trendy life. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
          <br>
          <p><span class="badge">1</span> Comment:</p><br>
          <div class="row">
            <div class="col-sm-2 text-center">
              <img src="../images/default/wallpaper.jpg" class="img-circle" height="65" width="65" alt="Avatar">
            </div>
            <div class="col-xs-10">
              <h4>Nested Bro <small>Sep 25, 2015, 8:28 PM</small></h4>
              <p>Me too! WOW!</p>
              <br>
            </div>
          </div>
        </div>
      </div>
    
    <script>
    function f_list(){
    	location.href= "/UsrClsList.do";
    };
    $('.delete').on('click',function(){
    	location.href= "/UsrClsDelete.do?classId="+
    	"<%=usrClsVO.getClassId()%>";
    })
    </script>
  </body>
</html>
