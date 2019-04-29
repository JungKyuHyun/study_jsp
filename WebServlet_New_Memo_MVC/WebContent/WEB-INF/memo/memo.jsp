<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>메모 쓰기</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/memo.js" type="text/javascript"></script>
</head>

<body>
<div style="margin-top:70px;"></div> 
<!--  html 파일  action="MemoServlet"  -->
<form name="f" action="memoWrite.do" method="get"> 
 <div align="center"> 
    <table width="600" border="0" cellpadding="7" > 
        <tr align="center" bgcolor="gold" height="50"> 
            <td colspan="2"> 
                <font size="4" color="#0033CC" face="굴림체"> 
                <b> 
                   Servlet Memo
                </b> 
                </font> 
            </td> 
        </tr> 
        <tr> 
            <td width="25%" align="center" > 
                <b>ID</b> 
            </td> 
            <td> 
                <input type="text" size="40" id="id" name="id" maxlength="10" >
                <input type="button" value="ID확인" id="message">  
            </td> 
        </tr>     
        <tr> 
            <td width="25%" align="center"> 
                <b>EMAIL</b> 
            </td> 
            <td> 
                <input type="text" size="40" id="email" name="email" maxlength="60" > 
            </td> 
        </tr> 
        <tr> 
            <td width="25%" align="center"> 
                <b>MEMO</b> 
            </td> 
            <td> 
                <textarea name="memo" cols="50" class="box2"></textarea> 
            </td> 
        </tr> 
        <tr bgcolor="gold"> 
            <td colspan="2" align="center" class="c2"> 
                <input type="submit" value="전송" >
                <input type="reset" value="취소"> 
            </td> 
        </tr> 
     
    </table> 
  
  
 </div>
</form>
<hr>
<a href="memoList.do">목록보기</a> 
 
</body>
</html>