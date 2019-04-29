<%@page import="kr.or.bit.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/*
이 페이지는 admin만 접근가능 ...

1.회원목록 출력
2. 관리자만 접근 가능(userid == admin)
3. 로그인한 일반 사용자 주소값을 외워서 접근 불가... >> 로그인 페이지 이동 
4. 고려사항 (권한 처리 코드가 여러 페이지에 사용된다면 유지보수)
	별도의 page 구성(include ... : sessionCheck.jsp)
*/

if(session.getAttribute("userid")==null || !session.getAttribute("userid").equals("admin")){
	// 강제로 다른 페이지 이동 
	out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
}

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
			<%
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try{
				conn = Singleton_Helper.getConnection("oracle");
				String sql = "select id,ip from koreamember";
				pstmt = conn.prepareStatement(sql);
/* 				pstmt.setString(1,id); */
				rs = pstmt.executeQuery();
			%>
			<h2>회원 리스트</h2>
<table class="table table-hover ">
	
    <thead>
        <tr>
            <th class="text-center">#</th> 
            <th class="text-center">ID</th>
            <th class="text-center">IP Adress</th>
            <th class="text-center">Actions</th>
        </tr>
    </thead>
    <tbody>
    <%
    int i=0;
    while(rs.next()){
    %>
    	<tr>
            <td class="text-center"><%=++i %></td>
            <td class="text-center"><%=rs.getString("id") %></td>
            <td class="text-center"><%=rs.getString("ip") %></td>
            <td class="td-actions text-center">
                <button type="button" rel="tooltip" class="btn btn-info btn-sm btn-icon"
                		onclick='location.href="Ex03_MemberDetail.jsp?id=<%=rs.getString("id")%>"' title="프로필 보기">
                    <i class="fas fa-user"></i>
                </button>&nbsp;&nbsp;
                <button type="button" rel="tooltip" class="btn btn-success btn-sm btn-icon"
                		onclick='location.href="Ex03_MemberEdit.jsp?id=<%=rs.getString("id")%>"' title="프로필 수정">
                    <i class="fas fa-user-cog"></i>
                </button>&nbsp;&nbsp;
                <button type="button" rel="tooltip" class="btn btn-danger btn-sm btn-icon"
                		onclick='location.href="Ex03_MemberDelete.jsp?id=<%=rs.getString("id")%>"' title="프로필 삭제">
                    <i class="fas fa-user-slash"></i>
                </button>
            </td>
        </tr>
    <%	
    }
    %>
  
    				</tbody>
				</table>
				<hr>
					<form action="Ex03_MemberSearch.jsp" method="post">
					
					<p class="text-primary">
                    회원 이름 검색 : <input type="text" name="search" style="background-color: #e3e3e3;">
                    	<button class="btn btn-primary btn-fab btn-icon btn-round"> 
						  <i class="fas fa-search"></i>
						</button>
                    </p>	
					</form>
				
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