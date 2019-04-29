<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/common/Head_top.jsp"></jsp:include>
<jsp:include page="/common/Header_top.jsp"></jsp:include>
<jsp:include page="/common/Sidebar_Left.jsp"></jsp:include>
<%=application.getContextPath()%>/template/dist/assets/js/app.min.js

<!-- 컨텐츠 영역  -->
<div id="content" class="app-content">
  <!-- BEGIN breadcrumb -->
  <ul class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">LAYOUT</a></li>
    <li class="breadcrumb-item active">STARTER PAGE</li>
  </ul>
  <!-- END breadcrumb -->
  <!-- BEGIN page-header -->
  <h1 class="page-header">
    Starter Page <small>page header description goes here...</small>
  </h1>
  <!-- END page-header -->
  <p>
    Start build your page here
  </p>
</div>

<!-- 컨텐츠 영역 끝 -->

<jsp:include page="/common/Footer_bottom.jsp"></jsp:include>