package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.Actionforward;
import kr.or.bit.dao.MvcRegisterDao;
import kr.or.bit.dto.MvcRegister;
import kr.or.bit.service.LoginProcessAction;
import kr.or.bit.service.MemberWriteAction;

//@WebServlet({"/Register.do" }) >> command
//실제로 들어오는 주소는 같아요
//Register.do?cmd=register 회원가입
//Register.do?cmd=registerlist 회원목록

//URL 방식 > 주소가 고정되면 안되요 !!
// "*.do" > a.do, b.do  


@WebServlet({"*.do" })
public class RegisterFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RegisterFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//1. 요청받기
    	//String command = request.getParameter("cmd")
    	//URL 방식은 cmd 
    	
    	//주소값
    	//register.do
    	//registerok.do
    	
    	//추가코드
    	Actionforward forward = null; //redirect와 path 정보 갖는 클래스
    	Action action = null;
    	
    	

    	//주소 요청의 판단 근거 (함수)
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String uri_Command = requestURI.substring(contextPath.length());
    	
    	//requsetURI : /WebServlet_7_Member_Model2_Mvc_Url/Register.do
    	//contextPath:  /WebServlet_7_Member_Model2_Mvc_Url
    	//uri_Command:	 /Register.do
    	
    	System.out.println("requestURI : " + requestURI);
    	System.out.println("contextPath : " + contextPath);
    	System.out.println("uri_Command : " + uri_Command);
    	
    	//2. 요청 판단 처리 
    	String viewpage = "";
    	if(uri_Command.equals("/Register.do")) { //회원가입 페이지 전달
    		forward = new Actionforward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/Register/Register.jsp");
    		
    		
    	}else if(uri_Command.equals("/ok.do")) { //회원가입 처리
    		action = new MemberWriteAction(); //다형성
    		forward = action.excute(request, response);
    		
    		//controller -> service 객체 처리
    		//dao, dto 처리
    		
    		
    		//3. 결과 저장하기
    		

    	}else if(uri_Command.equals("/login.do")) {
    		forward = new Actionforward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/Register/login.jsp");
    	}else if(uri_Command.equals("/loginok.do")) {
    		action = new LoginProcessAction(); //다형성
    		forward = action.excute(request, response);
    	}
    	
    	if(forward != null) {
    		if(forward.isRedirect()) {
    			response.sendRedirect(forward.getPath());
    		}else {
    			RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
    			dis.forward(request, response);
    		}
    	}

    }
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
