<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메모 리스트</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/memolist.css" />
</head>
<body>
<c:set var="memolist" value="${requestScope.memolist}"/>

<div id="main-container" >
<hr>
<h2> Line Memo List </h2>
<hr>
<table> 
	 <tr>
	 	<th>Writer</th> 
	 	<th>Email</th>
	 	<th>MemoContent</th>
	 </tr>

	 	<c:forEach var="memo" items="${memolist }">
	 	<tr>
	 		<td>${memo.id }</td>
	 		<td>${memo.email }</td>
	 		<td>${memo.content }</td>
	 	</tr>
	 	</c:forEach>
	 	  
</table>
</div>
<a href='memo.do'>글쓰기</a>
</body>
</html>