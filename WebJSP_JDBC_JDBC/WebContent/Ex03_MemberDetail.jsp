<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.bit.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
if(session.getAttribute("userid")==null || !session.getAttribute("userid").equals("admin")){
	// 강제로 다른 페이지 이동 
	out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
}

/*
회원 상세 페이지
1. 권한 검사
2. id 값 받기(where id=hong)(id 컬럼 PK) >> request.getParameter("id")
3. select id, pwd, name, age, gender, email from koreamember where id=?
4. id primary key (데이터 한 건 : 하나의 row)
5. 화면 구성()
*/
%>

<jsp:include page="/common/Head.jsp"></jsp:include>
  
  <body>
  
  
<div class="wrapper ">
  <!-- left_side_menu  -->
  <jsp:include page="/common/Left.jsp"></jsp:include>
  
  <div class="main-panel">
    <!-- Navbar -->
	<jsp:include page="/common/Top.jsp"></jsp:include>
	
    <div class="content" style="padding-right:20rem">
      <div class="container-fluid">
         <!-- your content here -->
         
         <%
         	String id = request.getParameter("id");
         	
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try{					
				conn = Singleton_Helper.getConnection("oracle");
				String sql = "select id, pwd, name, age, gender, email from koreamember where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				
				rs = pstmt.executeQuery();
				
			%>
			<h2 style="text-align: center;">[<%=id %>] 님의 프로필</h2>
			<table class="table table-bordered ">

	    <tbody>
	    
	    <%
	    while(rs.next()){
	    %>
        	<tr>
				<td class="text-center"><b>아이디</b></td>
				<td class="text-center"><%=rs.getString("id") %></td>
			</tr>
			<tr>
				<td class="text-center"><b>비번</b></td>
				<td class="text-center"><%=rs.getString("pwd") %></td>
			</tr>
			<tr>
				<td class="text-center"><b>이름</b></td>
				<td class="text-center"><%=rs.getString("name") %></td>
			</tr>
			<tr>
				<td class="text-center"><b>나이</b></td>
				<td class="text-center"><%=rs.getString("age") %></td>
			</tr>
			<tr>
				<td class="text-center"><b>성별</b></td>
				<td class="text-center"><%=rs.getString("gender") %></td>
			</tr>
			<tr>
				<td class="text-center"><b>이메일</b></td>
				<td class="text-center"><%=rs.getString("email") %></td>
			</tr>
    <%	
    }
    %>  
			<tr>
				<td colspan="2" class="text-center">
					<a href="Ex03_Memberlist.jsp"><b>목록가기</b></a>
				</td>
			</tr>
			</table>
				
			<%	
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				Singleton_Helper.close(rs);
				Singleton_Helper.close(pstmt);
			}
			%>
         
         
         

      </div>
    </div>
    
    <!-- footer -->
 	<jsp:include page="/common/Bottom.jsp"></jsp:include>
    
    <!-- wrapper, main-panel end -->
  </div>
</div>


</body>
</html>