package kr.or.bit.service;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.memodao;

//POINT 비동기 (ajax)
//동기식 처리와 같은 process
//비동기를 처리하는 view 페이지 작성

public class MemoIdCheckService implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String idCheck = null;
		
		try {
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			memodao dao = new memodao();
			idCheck = dao.isCheckById(id);
			request.setAttribute("message", idCheck);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/uservalid.jsp");
			
		} catch (NamingException e) {

		} catch(UnsupportedEncodingException e1) {
			System.out.println("인코딩 에러");
		}
	
		
		return null;
	}

}
