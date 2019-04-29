<%@page import="kr.or.bit.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/*  
Ex03_MemberEdit.jsp?id=hong
sql>select * from koreamember where id=?
결과를 화면 출력 :  
	출력(수정(x)):<td>rs.getString("name")</td>
     출력(수정(0))<td><input type="text" value='rs.getString("name")'></td>
     출력(다른 페이지 전송(0))<td><input type="text" name="" value='rs.getString("name")' readonly></td> 
		
Ex03_MemberEditok.jsp?	
sql> update emp set ename=? , job=? , sal=? where empno=?		

*/
//권한 처리 
if(session.getAttribute("userid")== null || !session.getAttribute("userid").equals("admin")){
	//강제로 다른 페이지 이동
	 out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
}
    String id = request.getParameter("id");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		conn = Singleton_Helper.getConnection("oracle");
	 	String sql = "select id, pwd , name, age ,trim(gender),email from koreamember where id=?";
	 	pstmt = conn.prepareStatement(sql);
	 	
	 	pstmt.setString(1, id);
	 	
	 	rs = pstmt.executeQuery();
		
	 	rs.next();
%>
    
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
		<h2 style="text-align: center;">회원정보 수정</h2>
	<jsp:include page="/common/Top.jsp"></jsp:include>
	
    <div class="content">
      <div class="container-fluid">
         <!-- your content here -->
  <div class="card">
  <div class="card-body">
    <form action="Ex03_MemberEditok.jsp" method="post" name="joinForm" id="joinForm">
      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="">ID</label>
          <input type="text" class="form-control" id="id" name="id" placeholder="아이디" value="<%=rs.getString("id") %>" readonly>
        </div>
        <div class="form-group col-md-6">
          <label for="">Password</label>
          <input type="text" class="form-control" id="pwd" name="pwd" placeholder="비밀번호" value="<%=rs.getString("pwd") %>" readonly>
        </div>
        <div class="form-group col-md-6">
          <label for=>Name</label>
          <input type="text" class="form-control" id="name" name="name" placeholder="이름" value="<%=rs.getString("name") %>"  style="background-color: gray">
        </div>
        <div class="form-group col-md-6">
          <label for="">Age</label>
          <input type="text" class="form-control" id="age" name="age" maxlength="3" placeholder="나이" value="<%=rs.getString("age") %>" style="background-color: gray">      
        </div>
      </div>

      <div class="form-row">
        <div class="form-group col-md-12">
          <label for="">Email</label>
          <input type="email" class="form-control" id="email" name="email" placeholder="이메일" value="<%=rs.getString("email")%>" style="background-color: gray">
        </div></div>
        
        <div class="form-row">
        <div class="form-group col-md-12">
          <label for="form-check-label">Gender</label><br>
			  <div class="form-check form-check-radio form-check-inline">
			      <label class="form-check-label">
			        <input class="form-check-input" type="radio" name="gender" id="gender" value="남자" <%if (rs.getString(5).equals("남자")) {%>checked<%}%>> 남자
			        <span class="form-check-sign"></span>
			      </label> </div>
			        <div class="form-check form-check-radio form-check-inline">
			      <label class="form-check-label">
			        <input class="form-check-input" type="radio" name="gender" id="gender" value="여자" <%if (rs.getString(5).equals("여자")) {%>checked<%}%>> 여자
			        <span class="form-check-sign"></span>
			      </label> </div>
        </div>
      </div>
	<br>

      <button class="btn btn-primary animation-on-hover" type="submit">수정하기</button>
      <button class="btn btn-primary btn-simple" type="button" onclick="location.href='Ex03_Memberlist.jsp'">리스트 보기</button>
    </form>
  </div>
</div>

      </div>
    </div>		
    <%	
	}catch(Exception e){
 			e.printStackTrace();
 		}finally{
 		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
 	}
%>

    <!-- wrapper, main-panel end -->
  </div>
</div>
      
   
    <!-- footer -->
 	<jsp:include page="/common/Bottom.jsp"></jsp:include>
   



</body>
</html>