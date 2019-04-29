package kr.or.bit.service;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.memodao;
import kr.or.bit.dto.memo;

public class memoListAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) {
    	try {
    		memodao dao = new memodao();
    		List<memo> memolist = dao.getMemoList();
    		
    		//요청결과 저장
    		request.setAttribute("memolist", memolist);
    		
    		
    	}catch(Exception e){
    		System.out.println(e.getMessage());
    	}
    	
    	ActionForward forward = new ActionForward();
    	forward.setRedirect(false);
    	forward.setPath("WEB-INF/memo/memolist.jsp");
    	return forward;
		
	}
	
}
