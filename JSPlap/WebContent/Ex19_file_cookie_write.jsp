<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--
1. 메모리 쿠키(브라우저 쿠키)
   :Client가 강제로 지우지 않는 한 또는 브라우저를 닫기 전까지는 쿠키 값을 유지한다.

2. 파일 쿠키(소멸 시간을 가지고 있어요)
:Client 강제로 지우지 않는 한 정해진 만료 시간까지 쿠키 값을 유지한다.
setMaxage(60) // 60초 
ex) 30일 유지해라 !! -> 30*24*60*60 일*시*분*초
  -->
<%
Cookie co = new Cookie("bit", "kim");
co.setMaxAge(30*24*60*60);

response.addCookie(co);

%>
</body>
</html>