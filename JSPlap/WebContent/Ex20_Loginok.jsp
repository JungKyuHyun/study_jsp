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
UID, PWD, chk 여부
1. ID, PWD 같다면 로그인 성공(if(id.equals(pw..) true 로그인 성공)
chk이 체크되었다면 > 쿠키 생성 및 ID값을 쿠키에 담아서 + 유효시간은 24시간 
>쿠키쓰기 완료!

2. ID, PWD 같다면 로그인 성공(if(id.equals(pw..) true 로그인 성공)
chk이 체크 되어 있지 않다면
>만들었던 쿠키 삭제: setMaxAge(0)
Cookie delco = new Cookie("UID","");
delco.setMaxage(0);
response.addCookie(delco);

3. ID, PWD 같지 않다면 
response.sendRedirect() ->Ex20_login.jsp로 이동 처리 
-->
<%
String id = request.getParameter("UID");
String pwd = request.getParameter("PWD");
if(!id.equals(pwd)){
	response.sendRedirect("Ex20_login.jsp");
}else{
	out.print("로그인 성공" +"<br>");
}

String chk = request.getParameter("chk");
if(chk !=null){
	Cookie co = new Cookie("bit", "kim");
	co.setMaxAge(24*60*60);
	response.addCookie(co);
	out.print("쿠키쓰기 완료!");
}else{
	Cookie delco = new Cookie("bit", "");
	delco.setMaxAge(0);
	response.addCookie(delco);
}
%>
</body>
</html>