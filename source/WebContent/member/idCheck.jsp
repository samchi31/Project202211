<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	
	String rst = (String) request.getAttribute("rst");

	if(rst.equals("ok")){
		// 결과가 조회되자않았을 때 id사용가능
%>

		{"code" : "ok",
		 "msg" : "사용가능"}
		 
<%	
	}else{
		// 결과가 조회되었을 때 사용불가
%>	

		{"code" : "no",
		 "msg" : "사용불가"}
		 
<%	
	}
%>