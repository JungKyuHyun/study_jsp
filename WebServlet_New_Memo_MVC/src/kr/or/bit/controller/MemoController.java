package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.service.memoIdAction;
import kr.or.bit.service.memoListAction;
import kr.or.bit.service.memoWriteAction;


@WebServlet("*.do")
public class MemoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemoController() {
        
    }
    
    public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  	ActionForward forward = null;
    	Action action = null;
    	request.setCharacterEncoding("UTF-8");
    	
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String uri_Command = requestURI.substring(contextPath.length());
    	System.out.println("uri_Command : " + uri_Command);
    	
    	if(uri_Command.equals("/memo.do")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/memo/memo.jsp");
    	
    	}else if(uri_Command.equals("/memoList.do")) {
    		action = new memoListAction();
    		forward = action.excute(request, response);
    		
    	}else if(uri_Command.equals("/memoWrite.do")) {
    		action = new memoWriteAction(); 
    		forward = action.excute(request, response);

    	}else if(uri_Command.equals("/memoId.do")) {
    		action = new memoIdAction();
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
