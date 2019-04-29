package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.ResponseWrapper;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.memodao;


public class memoIdAction implements Action {

	@Override
	@ResponseWrapper
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) {
    		String id = request.getParameter("id");
    		memodao dao = new memodao();
    		String resultdata = "";
 
    		if(dao.isCheckById(id).equals("true")) {
    			resultdata = "true";
    		}else{
    			resultdata = "false";
    			
    		}

    	request.setAttribute("data", resultdata);
    	ActionForward forward = new ActionForward();
    	forward.setRedirect(false);
    	forward.setPath("/WEB-INF/memo/memo.jsp"); //memo.do 결과는 같음.
    	return forward;

	}
}
