package kr.or.bit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * id검증 (사용자가 입력한 id) DB에 있는지 없는지 확인
 *  isCheckById 사용해서
 *  return "false" or "true"
 *  
 */

import kr.or.bit.dao.memodao;

@WebServlet("/Memoid")
public class Memoid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Memoid() {
        
    }
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    		memodao dao = new memodao();
    		String id = request.getParameter("id");
    		
    		if(dao.isCheckById(id).equals("true")) {
    			request.setAttribute("check", "true");
    			RequestDispatcher dis = request.getRequestDispatcher("/memo.html");
    			dis.forward(request, response);
    		}else{
    			request.setAttribute("check", "false");
    			RequestDispatcher dis = request.getRequestDispatcher("/memo.html");
    			dis.forward(request, response);
    		};
    	}catch(Exception e){
    		
    	}
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter(); 
		String id = request.getParameter("id");
		memodao dao = new memodao();
		String idCheck = dao.isCheckById(id);
		out.print("false");
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
