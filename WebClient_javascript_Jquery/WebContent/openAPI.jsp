<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		let URL="https://openapi.naver.com/v1/search/movie.json?";
		
		$.ajax({
			type:"get",
			url: URL,
			dataType:"json",
			data :{"query":$("#search").val()},
			beforeSend : xhr=>{
				xhr.setRequestHeader("X-Naver-Client-Id","HJt3cXxXLVZv7M9KTfny");
				xhr.setRequestHeader("X-Naver-Client-Secret","OPPsUrzs_G");
				xhr.setRequestHeader("Access-Control-Allow-Origin","https://openapi.naver.com/");
			},
			success : (data, textStatus, xhr)=>{
				console.log(data);
			},
			error : (xhr, status, err)=>{
				alert(err);
			}
		})
	});

</script>
</head>
<body>
	<input type="text" id="search">
	<input type="button" value="검색하기" id=btn>
	<hr>
 	<div id="display"></div>
 	
</body>
</html>