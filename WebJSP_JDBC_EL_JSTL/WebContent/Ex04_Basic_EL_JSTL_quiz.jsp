<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = request.getParameter("ID");
	if(id.equals("hong")){
%>
		<%=id %><br>
		 <img src="images/1.ico" alt="이미지" style="width: 100px; height:100px">
		 <hr>
<%
	}
%>    
<!--  
param     요청 파라미터의  값을 String으로, request.getParameter()의 결과와 동일
paramValue     요청 파라미터의  값을 String[]으로, request.getParameterValues()의 결과와 동일
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL과 JSTL</h3>
	<c:if test="${param.ID =='hong'}">  <!--test안에 들어가는게 조건식!!(el로표현해서 넣어줌  -->
		<img src="images/1.ico" alt="이미지" style="width: 100px; height:100px">
	</c:if>
	${param.ID}
	<!--  
		문제 : Client에서 ?age=100 값을 받아서 age 값이 20보다 큰값이면 그 값을 출력하는 El & JSTL 구문을 작성하세요.
	-->
	<h1>나이 문제</h1>
	<p>
	<c:if test="${param.age >20 }" var="result">
		20살보다 크면 표시되요 : ${param.age }<br>
	</c:if>
	</p>
	<br>
	if구문의 조건 결과값을 저장(var라는 것에 값을 담으면!!) : ${result}<br>
</body>
</html>