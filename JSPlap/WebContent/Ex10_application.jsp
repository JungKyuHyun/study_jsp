<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int sum=0; /* 유효범위 : Page: Ex10_Application.jsp */
	/*
	WAS(컨테이너) : 여러 개의 웹 어플리케이션을 서비스 할 수 있다.
	WAS : webJSP 웹 어플리케이션을 가지고 있다.
	webJSP(가상디렉토리) -> 실경로(실소스):webContent 폴더(default 폴더)
	
	>> context root -> webContent
	webcontent 안에 있는 모든 페이지가 공유할 수 있는 자원은 없을까
	웹 어플리케이션은 하나의 설정파일을 가지고 있다 ( 웹 사이트 설정 정보)
	web.xml (웹 어플리케이션 전반에 관련된 환경 설정 파일 )
	>> 사이트를 실행하면 >> web.xml 가장 먼저 실행 
	webContent >> WEB-INF >> web.xml 
	**WEB-INF (보안폴더 ): 클라이언트가 접속할 수 없는 경로 
	**실 프로젝트 >> WEB-INF >> views >> member 안에서 JSP rhksfl 
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//application.getInitParameter>> web.xml 가세 >> email
	String param = application.getInitParameter("email");
	out.print("<h3>" + param + "<h3>");
	
	String param1 = application.getInitParameter("Filepath");
	out.print("<h3>" + param1 + "<h3>");
	%>
</body>
</html>