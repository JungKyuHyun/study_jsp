<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	//데이터 받기
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");
	
	System.out.println(uid + " / " + pwd);
	
	//로직처리
	//DB > select >> 회원테이블 >> ID, PWD 존재 ...
	boolean success = false;
	if(uid.equals(pwd)){
		//로그인 성공
		//session 
	}
%>

<%
	if(success == true){
		out.print("<b>로그인 성공</b>");
		String user = (String) session.getAttribute("memberid");
		out.print(user + "님 로그인 되었습니다.");
		out.print("<a href='Ex22_Session_member.jsp'>회원정용</a>");
	}else{
		%>
	}

%>
</body>
</html>