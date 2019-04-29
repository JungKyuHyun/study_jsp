<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Cookie cookie = new Cookie("name", URLEncoder.encode("정규현","UTF-8"));
	response.addCookie(cookie);
	
	Cookie cookie2 = new Cookie("name2", URLEncoder.encode("신선하","UTF-8"));
	response.addCookie(cookie2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키생성</title>
</head>
<body>
<%=cookie.getName() %> 쿠키의 값 = "<%=cookie.getValue() %>"
<br>
<%=cookie2.getName() %> 쿠키의 값 = "<%=cookie2.getValue() %>"
</body>
</html>