<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--
EL & JSTL을 사용해서 값을 받아서 받은 값을 출력하세요.
받는 값이 없는 경우는 Empty라는 문자를 출력하세요.

checkbox 다중선택
hint) request.getparametervalues("subject"); >> 표현을 EL

EL : 
param 객체(단일값)
paramvalues 객체(다중값)

  -->
  <%
  	request.getParameterValues("subject");
  
  %>
  
  <c:choose>
  	<c:when test="${not empty paramValues.subject}">
  		당신의 선택은?
  		<ul>
  			<c:forEach var="subject" items= "${paramValues.subject }" varStatus="status">
  				<li>
  					${status.index }-${subject }- ${status.count }
  				</li>
  			</c:forEach>
  		</ul>
  	</c:when>
  	<c:otherwise>
  		선택을 하세요.(Empty)<br>
  	</c:otherwise>
  </c:choose>
  
  <%
  	int year = Integer.parseInt(request.getParameter("year"));
  
  %>
  
  년도 : <input type="text" value="<%=year %>"><br>
  <h3>select Tag</h3>
  <select id="newYear" name="newYear" title="년도선택">
  	<option>년도선택</option>
  	<option value="2015">2015</option>
  	<option value="2016">2016</option>
  	<option value="2017">2017</option>
  	<option value="2018">2018</option>
  	<option value="2019">2019</option>
  </select>
  <hr>
  
  <h3>EL & JSTL</h3>
  년도 : <input type="text" value="${param.year }"><br>
  <h3>select Tag</h3>
  <select id="newYear" name="newYear" title="년도선택">
  	<option>년도선택</option>
  	<option value="2015" <c:if test="${param.year  == 2015}">selected</c:if>>2015</option>
  	<option value="2016" <c:if test="${param.year  == 2016}">selected</c:if>>2016</option>
  	<option value="2017" <c:if test="${param.year  == 2017}">selected</c:if>>2017</option>
  	<option value="2018" <c:if test="${param.year  == 2018}">selected</c:if>>2018</option>
  	<option value="2019" <c:if test="${param.year  == 2019}">selected</c:if>>2019</option>
  </select>
  
  <hr>
  <input type="checkbox" name="check" value="java" <c:if test="${param.choiceyn =='y' }">checked</c:if>>
  
  
  
  
</body>
</html>