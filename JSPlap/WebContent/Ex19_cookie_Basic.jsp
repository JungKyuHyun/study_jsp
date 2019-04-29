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
클라이언트(로컬 PC, 웹브라우저) : 서버(웹 서버 : 메모리, 파일, DB서버 )

정보(데이터:자료) 어디에 저장하고 보관할 것이냐 
고민: 소멸(일시적, 영속적), 보안요소(정보 중요성)

Client(Local PC : 웹 브라우저)
1. Cookie (메모리 쿠키, 파일 쿠키(txt: 암호화) 구분점:소멸타입
2. Local storage(브라우저 메모리 저장소) :{key:value}

>> 영속적으로 저장할 필요없고 보안적으로 문제가 없는 데이터

server(webServer : Tomcat)
1. Server memory : session 객체 (접속한 사용자 별로 하나씩) -> 임시
2. Server momory : application 객체(접속한 모든 사용자가 공유객체) ->
3. Server : log.txt 파일 기반(영속)
4. DB Server - > 영속적, 보안 
-->
<%
	Cookie mycookie = new Cookie("cname", "1007");//쿠키 객체 생성
	//내 서버에 접속한 클라이언트에게 전달(write)
	response.addCookie(mycookie);
%>
서버에서 설정한 쿠키 이름:<%=mycookie.getName() %><br>
서버에서 설정한 값:<%= mycookie.getValue() %><br>
서버에서 설정한 쿠키 소멸정보: (-1 소멸 시간이 없다.): <%=mycookie.getMaxAge() %><br>
<hr>
<!-- 서버가 클라이언트에게 Response한 cookie 객체 얻어오기  -->
<%
	Cookie[] cs = request.getCookies();
	if(cs!=null||cs.length>0){
		for(Cookie c : cs){
			out.print("c.getName(): " +c.getName()+"<br>");
			out.print("c.getValue(): "+c.getValue()+"<br>");
			out.print("c.getMaxAge(): "+c.getMaxAge()+"<br>");
		}
	}
%>




</body>
</html>