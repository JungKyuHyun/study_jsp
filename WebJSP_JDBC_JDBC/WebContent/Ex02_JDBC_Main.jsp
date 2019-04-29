<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/common/Head.jsp"></jsp:include>
  
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
			<%
				String id = null;
				id = (String)session.getAttribute("userid");
				if(id != null){
					out.print(id+ " 회원님 방가 ^^<br>");
					if(id.equals("admin")){
						out.print("<a href='Ex03_Memberlist.jsp'>회원관리</a>");
					}
				}else{
					//로그인하지 않은 사용자
					//강제로 페이지 이동
					out.print("<script> location.href='Ex02_Login.jsp'</script>");
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