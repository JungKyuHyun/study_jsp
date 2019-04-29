<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	/*
		요청에 대한 흐름제어 (forward ...)
		
		include
		forward 같이 비교 
		
		공통점 : request객체 공유 가능
		차이점 : include 제어권을 돌려 받는다.
			   forward 제어권을 넘겨 준다.
			   (요청 주소는 동일한데 : 각각 다른 page의 서비스를 받는다)
			   WHY: 처음 요청했던 page 버퍼(buffer)를 그대로 사용
			   localhost : 8090/webJSP/login.jsp
			   받는페이지 내용은 : A.jsp, B.jsp, C.jsp를 받을 수 있다.
	*/
	String code = request.getParameter("code");
	String viewURI = null;
	
	if(code.equals("A")){
		viewURI = "/forward/A.jsp";
	}else if(code.equals("B")){
		viewURI = "/forward/B.jsp";
	}else if(code.equals("C")){
		viewURI = "/forward/C.jsp";
	}
%>
	<jsp:forward page="<%=viewURI %>"></jsp:forward>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>