package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.MvcRegisterDao;
import kr.or.bit.dto.MvcRegister;

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
    		viewpage = "/WEB-INF/Register/Register.jsp";
    	}else if(uri_Command.equals("/ok.do")) { //회원가입 처리
    		int id = Integer.parseInt(request.getParameter("id"));
    		String pwd = request.getParameter("pwd");
    		String email = request.getParameter("email");
    		
    		//controller -> service 객체 처리
    		//dao, dto 처리
    		
    		MvcRegister dto = new MvcRegister();
    		dto.setId(id);
    		dto.setPwd(pwd);
    		dto.setEmail(email);
    		MvcRegisterDao dao = new MvcRegisterDao();
    		int result = dao.writeOk(dto);
    		
    		String resultdata="";
    		if(result >0) {
    			resultdata = "wecome to bit " + dto.getId() + "님";
    		}else {
    			resultdata = "Insert Fail retry";
    		}
    		
    		//3. 결과 저장하기
    		request.setAttribute("data", resultdata);
    		viewpage = "/WEB-INF/Register/Register_welcome.jsp";
    	}
    		//4. 뷰 지정하기
    		RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    		
    		//5. forward(request 객체의 주소값을 공유)
    		dis.forward(request, response);
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
