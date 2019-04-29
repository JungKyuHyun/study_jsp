<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<%
/*

JSTL 사용
<c:set        : 변수 생성, 값을 저장
<c:remove	  : 변수 삭제
<c:if		  : 조건문(test="조건식") // else if 구문이 없다!! 츄즈를 잘 사용함.
<c:chose	  : 여러가지 조건에 따른 처리가능(if보다 활용도 높다.)
<c:foreach	  : 반복문(개선된 for) 
<c:forTokens  : 토큰값(split, for문 결합)
<c:out		  : JSTL 출력구문(out보다 ${}이 사용빈도가 높다.)
<c:catch	  : 예외처리 
*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL parameter 받기</title>
</head>
<body>
	<h1>EL parameter 받기(c:set)</h1>
		<!-- jsp?id=hong&pwd=1004 -->
		${param.id } - ${param.pwd } <br>
	<hr>
	
	<h1>EL & JSTL 혼합(의도 : scope 강제)</h1>
		<c:set var="userid" value="${param.id }" scope="request"/>
		<c:set var="userpwd" value="${param.pwd }" scope="request"/>
		<h3>변수 사용</h3>
		id: ${userid }<br>
		pwd: ${userpwd }<br>
		<p>scope="request"을 적으면 다른 곳에서도 사용할 수있다.</p>
	<hr>
	
	<h1>JSTL 조건문(if)</h1>
	암호가 없을 경우에만 나옴 >> c:if test="${empty userpwd }" : 
	<c:if test="${empty userpwd }">
		<h3>암호가 없쪄용</h3>
	</c:if>
	
	<hr>
	<h1>Not empty userpwd</h1>
	<c:if test="$(userpwd == '1004')">
		<h3>welcome Admin page</h3>
	</c:if>
	
	
	
	
	
	
	
	
	
	
</body>
</html>