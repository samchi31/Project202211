<%@page import="notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
	NoticeVO nv = (NoticeVO)request.getAttribute("nv");

// 	List<AtchFileVO> atchFileList = (List<AtchFileVO>) request.getAttribute("atchFileList");
%>
    
    
    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 변경</title>
</head>
<body>
	<form action="/UpdateNoticeController.do" method="post" >
	<input type="hidden" name="noticeId" value="<%=nv.getNoticeId() %>">
	<input type="hidden" name="memId" value="<%=nv.getMemId() %>">
	<input type="hidden" name="noticeDate" value="<%=nv.getNoticeDate() %>">
	
<%-- 	<input type="hidden" name="atchFileId" value="<%=mv.getAtchFileId() %>"> --%>
		<table>
			<tr>
				<td>제 목</td>
				<td><input type="text" name="noticeTitle" value="<%=nv.getNoticeTitle()%>"></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><input type="text" name="noticeContent" value="<%=nv.getNoticeContent()%>"></td>
			</tr>

			
<%--			<tr>
				<td>기존 첨부파일:</td>
				<td>
				<%
					if(atchFileList != null) {
						for(AtchFileVO fileVO : atchFileList) {
				%>	
					<div><a href="<%=request.getContextPath() %>/download.do?atchFileId=<%=fileVO.getAtchFileId() %>&fileSn=<%=fileVO.getFileSn() %>"><%=fileVO.getOrignlFileNm() %></a></div>
				<%
						}
					}
				%>
				
				</td>
			</tr> 
		
		<tr>
			<td>새로운 첨부파일</td>
			<td><input type="file" name="atchFile" multiple="multiple"></td>
		</tr>
--%>			
			
			
		</table>
		<input type="submit" value="글 수정">

	</form>
</body>
</html>