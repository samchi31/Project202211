<%@page import="java.util.List"%>
<%@page import="notice.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// 	NoticeVO vo = (NoticeVO)request.getAttribute("msg");

	List<NoticeVO> noticeList = (List<NoticeVO>) request.getAttribute("noticeList"); //겟파라미터는: 담아놓은 걸 꺼낼때
	//msg를 꺼내서 담음
	
	
	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	//한번 꺼내왔으면 제거해주기
	session.removeAttribute("msg");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style>
	.btn {
		float: right;
	}
	
</style>

</head>
<body>
	<div class="container">
	 <table class="table table-hover">
    <thead>
      <tr>
        <th width="60%">제목</th>
        <th width="20%">날짜</th>
        <th width="10%">수정</th>
        <th width="10%">삭제</th>
      </tr>
    </thead>
    <tbody>

<% 
	int memSize = noticeList.size(); //꺼내기
	if(memSize > 0) {
		for(int i=0; i<memSize; i++) {
%>			
		<tr>
<%-- 			<td><%= noticeList.get(i).getMemId() %></td>
		<td><a href="detail.do?memId=<%= memList.get(i).getMemId() %>"><%= memList.get(i).getMemName() %></a></td> --%>
			<td><%=noticeList.get(i).getNoticeTitle() %></td>
<%-- 			<td><%= noticeList.get(i).getnContent() %></td> --%>
<%-- 			<td><%= noticeList.get(i).getAtchId() %></td> --%>
			<td><%=noticeList.get(i).getNoticeDate() %></td>
			<td><a href="<%=request.getContextPath()%>/UpdateNoticeController.do?noticeId=<%=noticeList.get(i).getNoticeId()%>" type="button" class="btn btn-warning">수정</a></td>
<%-- 			<td><a href="<%request.getContextPath()%>/deleteNotice.do?noticeId=<%= noticeList.get(i).getNoticeId() %>" type="button" class="btn btn-danger">삭제</a></td> --%>
			<td><a href="<%=request.getContextPath()%>/deleteNotice.do?noticeId=<%=noticeList.get(i).getNoticeId()%>" class="btn btn-danger">삭제</a></td>
		</tr>
<%
		}
		
	} else {
%>		
		<tr>
			<td colspan="5">조회된 데이터가 없습니다.</td>
		</tr>
<%
	}
%>		
		
	    </tbody>
  </table>
  
  <a href="InsertNoticeController.do" type="button" class="btn btn-default" >글 등록</a>

<%
	if(msg.equals("성공")) { //msg가 성공이 맞다면 만들어지는 구조
%>
	
<script>
	alert('정상적으로 처리되었습니다.');
</script>

<%
	}
%>
</div>
</body>
</html>