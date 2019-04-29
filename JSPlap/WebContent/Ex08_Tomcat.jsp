<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
out 객체 : 서버쪽 구현 편해요
단점 : 클라이언트쪽 구현이 어려워요.
  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tomcat(WAS) 내장객체(out)</title>
</head>
<body>
<%
	boolean b = true;
	if(10>5){
%>
	IF(false):<font color="blue"><%=b%></font>
<%
}
%>
<h3>out ê°ì²´(ìë²ì½ë ììì´ í¸í´ì)</h3>
<%
	boolean b2 = true;
	if(10>5){
		out.print("IF(true):<font color="red">"+b2+"</font>");
		}else{
		out.print("IF(false):<font color="blue">"+b2+"</font>");
		}
%>
</body>
</html>