package kr.or.bit.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.memodao;
import kr.or.bit.dto.memo;

public class MemoListService implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) {
    	ActionForward forward = null;
		try {
    		memodao dao = new memodao();
    		List<memo> memolist = dao.getMemoList();
    		
    		//요청결과 저장
    		request.setAttribute("memolist", memolist);
    		
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/memolist.jsp");
    	}catch(Exception e){
    		System.out.println(e.getMessage());
    	}
    	
		return null;
	}

}
