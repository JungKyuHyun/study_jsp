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
		let URL="http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
		
		$.getJSON(
		URL, {
			key:"6624eeed975e2734c6dd329911451502",
			targetDt:"20190420"
			}, 
			(data, textStatus, xhr)=>{
				const dataArr = data.boxOfficeResult.dailyBoxOfficeList;
				let table = "<table>";
				table+="<tr><th>랭킹</th><th>영화제목</th><th>개봉일</th><th>누적 관객수</th><th>누적 매출액</th></tr>";
				$.each(dataArr, (i, item)=>{
					table+="<tr></td><td>"+ item.rank +"</td><td>"+item.movieNm+"</td><td>" +item.openDt +"</td><td>" +(item.audiAcc*1).toLocaleString()+"</td><td>"+(item.salesAcc*1).toLocaleString() + "</td></tr>";
					
				})
				table+="</table>";
				
				$("#display").html(table);
			});
	});

</script>
</head>
<body>
 	<div id="display"></div>
 	
</body>
</html>