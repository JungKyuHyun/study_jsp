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
         안녕하세요. 고갱님,<br>현재 페이지 수정 작업 중에 있습니다. 빠른 시일 내로 복구하겠습니다.<br><br>감사합니다.

      </div>
    </div>
    
    <!-- footer -->
 	<jsp:include page="/common/Bottom.jsp"></jsp:include>
    
    <!-- wrapper, main-panel end -->
  </div>
</div>


</body>
</html>