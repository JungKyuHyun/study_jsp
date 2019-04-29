<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        table{border: 1px solid black; border-collapse: collapse;}
        
        tr{border: 1px solid blue; background-color: white; color: black}
        
        td{border: 1px solid red; }
        
    </style>
</head>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">






<body>
<!--  
JDBC
1. 드라이버 참조(WEB > WebContent >> WEB-INF >> lib > ojdbc6.jar
2. 드라이버 메모리 로딩 class.forName("드라이버 클래스명");
3. DB연결 (연결문자열 : 서버 IP , PORT , 계정 , 비번
4. JAVA JDBC API (interface)
    Connection
    Statement
    PrepareStatement
    ResultSet
-->
    <table>
        <tr>
            <td>사번</td>
            <td>이름</td>
            <td>급여</td>
            <td>직종</td>
        </tr>
    <%
    //DB연결 >> 명령실행 >> 실행경과
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    System.out.println("오라클 드라이버 로딩");
    
    //getConnection Connection 구현한 객체의 주소값 return
    conn = DriverManager.getConnection("jdbc:oracle:thin:@172.20.10.5:1521:xe","bituser","1004");
    System.out.println(conn.isClosed()+" 정상 (False)");
    
    stmt = conn.createStatement();
    String sql="select empno, ename, sal, job from emp";
    
    rs = stmt.executeQuery(sql);
    while(rs.next()){
    %>
    <tr>
    	<td><%= rs.getInt(1) %></td>
    	<td><%= rs.getString("ename") %></td>
    	<td><%= rs.getInt(3) %></td>
    	<td><%= rs.getString("job") %></td>
    </tr>
    <% 	
    }
   	    if(rs != null)try{rs.close();}catch(Exception e){}
		if(stmt != null)try{stmt.close();}catch(Exception e){}
		if(rs != null)try{rs.close();}catch(Exception e){}
    
    
    %>
    </table>
    
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>