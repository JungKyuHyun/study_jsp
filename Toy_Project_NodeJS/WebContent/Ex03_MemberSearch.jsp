<%@page import="kr.or.bit.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/common/Head.jsp"></jsp:include>
<%
	if(session.getAttribute("userid")== null || !session.getAttribute("userid").equals("admin")){
	//강제로 다른 페이지 이동
	 	out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
	}
%>      
  <body>
  
  
<div class="wrapper ">
  <!-- left_side_menu  -->
  <jsp:include page="/common/Left.jsp"></jsp:include>
  
  <div class="main-panel">
    <!-- Navbar -->
	<jsp:include page="/common/Top.jsp"></jsp:include>
	
    <div class="content">
      <div class="container-fluid">
         <!-- your content here -->
         
         <!--  조회된 내용 UI 구성 
			        조회된 데이터 총 몇건
			        데이터 집합 ....
			 -->
			 <%
			 	String name = request.getParameter("search");
			    Connection conn = null;
			    PreparedStatement pstmt = null;
			    ResultSet rs = null;
			    
			    //where name=?
			    //where name like ? >> pstmt.setString(1,'%' + name + '%')
			    //where name like '%" + name + "%'"
			    conn = Singleton_Helper.getConnection("oracle");
			 	String sql="select count(*) from koreamember where name like ?";
			 	String sql2="select id, name,email from koreamember where name like '%" + name + "%'";
			 
			 	pstmt = conn.prepareStatement(sql);
			 	pstmt.setString(1, '%' + name + '%');
			 	rs = pstmt.executeQuery();
			 	rs.next();
			 	int count = rs.getInt(1);
			 %>
			 <div class="alert alert-primary" role="alert">
				  <!-- 텍스트 입력가능 -->
				  <i class="fas fa-search"></i>&nbsp;&nbsp;&nbsp;
				  <a href="#" class="alert-link">[<%= name %>]</a> 
				  님 검색결과 총 <%=count %>명을 찾았습니다.
			 </div>
			 <table class="table table-hover ">
	
			    <thead>
			        <tr>
			            <th class="text-center">#</th> 
			            <th class="text-center">ID</th>
			            <th class="text-center">NAME</th>
			            <th class="text-center">EMAIL</th>
			            <th class="text-center">Actions</th>
			        </tr>
			    </thead>
			    <tbody>
			    <%
			    int i=0;
			    pstmt = conn.prepareStatement(sql2);
				rs = pstmt.executeQuery();
			    while(rs.next()){
			    %>
			    	<tr>
			            <td class="text-center"><%=++i %></td>
			            <td class="text-center"><%=rs.getString(1) %></td>
			            <td class="text-center"><%=rs.getString(2) %></td>
			            <td class="text-center"><%=rs.getString(3) %></td>
			            <td class="td-actions text-center">
			                <button type="button" rel="tooltip" class="btn btn-info btn-sm btn-icon"
			                		onclick='location.href="Ex03_MemberDetail.jsp?id=<%=rs.getString(1)%>"' title="프로필 보기">
			                    <i class="fas fa-user"></i>
			                </button>&nbsp;&nbsp;
			                <button type="button" rel="tooltip" class="btn btn-success btn-sm btn-icon"
			                		onclick='location.href="Ex03_MemberEdit.jsp?id=<%=rs.getString(2)%>"' title="프로필 수정">
			                    <i class="fas fa-user-cog"></i>
			                </button>&nbsp;&nbsp;
			                <button type="button" rel="tooltip" class="btn btn-danger btn-sm btn-icon"
			                		onclick='location.href="Ex03_MemberDelete.jsp?id=<%=rs.getString(3)%>"' title="프로필 삭제">
			                    <i class="fas fa-user-slash"></i>
			                </button>
			            </td>
			        </tr>
			    <%	
			    }
	 			Singleton_Helper.close(pstmt);
	 			Singleton_Helper.close(rs);
			    %>
        		 </tbody>
				</table>
         <button class="btn btn-primary btn-simple" type="button" onclick="location.href='Ex03_Memberlist.jsp'">전체 리스트 보기</button>
         
         
         
         
         
         
         
         

      </div>
    </div>
    
    <!-- footer -->
 	<jsp:include page="/common/Bottom.jsp"></jsp:include>
    
    <!-- wrapper, main-panel end -->
  </div>
</div>


</body>
</html>