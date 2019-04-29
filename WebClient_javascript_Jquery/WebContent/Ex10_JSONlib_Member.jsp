<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="kr.or.bit.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	Member member = new Member();
    	//String jsonstr = "{" + "username:" +memer.getName() ....
    	JSONObject obj = JSONObject.fromObject(member);
    	
    %>
    
    <%= obj %>
    <%
    List<Member> memberlist = new ArrayList<>();
    memberlist.add(new Member("hong", "1004","서울시 강남구", "0"));
    memberlist.add(new Member("sun", "1005","서울시 도봉구", "1"));
    memberlist.add(new Member("ha", "1006","서울시 관악구", "2"));
    
    JSONArray objarray = JSONArray.fromObject(memberlist);
    
    
    
    %>