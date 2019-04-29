<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
/*
	쿠키값(사용자(ID)이 존재하면 UID input value 속성을 그 값을 출력)
	쿠키값을 read 해서 쿠키 변수명이 UID라면 ... 그 값을 
*/
String userid="1004";
%>
</head>
<body>
	<form action="Ex20_Loginok.jsp" method="get">
		ID:<input type="text" name="UID" value=<%=userid %>><br>
		PWD:<input type="password" name="PWD"><br>
		<hr>
		ID값 유지하기<input type="checkbox" name="chk">
		<hr>
		<input type="submit" value="로그인">
		<input type="reset" value="취소">
	</form>
</body>
</html>