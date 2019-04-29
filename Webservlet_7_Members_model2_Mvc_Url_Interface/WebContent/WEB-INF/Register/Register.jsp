<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/ok.do" method="post">
		ID:<input type="number" name="id" placeholder="ID입력"><br><br>
		PWD:<input type="password" name="password" placeholder="pwd입력"><br><br>
		EMAIL:<input type="email" name="email" placeholder="email입력"><br><br>
		<input type="submit" value="회원가입"><br><br>
	</form>
</body>
</html>