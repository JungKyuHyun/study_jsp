package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.memodao;

public class MemoAddService implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward  forward = null;
		try {
		  request.setCharacterEncoding("UTF-8");
    	  
	  	  String id = request.getParameter("id");
	  	  String email = request.getParameter("email");
	  	  String content = request.getParameter("memo");
	  	  
	  	  memodao dao = new memodao();
	  	  int result = dao.insertMemo(id, email, content);
	  	  
	  	  String msg = "";
	  	  String url="";
	  	  
	  	  if(result >0) {
	  		  msg = "등록 성공";
	  		  url = "MemoList.memo";
	  	  }else { // -1 (제약, 컬럼길이 문제)
	  		  msg = "등록 실패";
	  		  url = "MemoList.html";
	  	  }
	  	  request.setAttribute("board_msg", msg);
	  	  request.setAttribute("board_url", url);
	  	  
			forward = new ActionForward();
			forward.setRedirect(false); //forward 방식
			forward.setPath("/WEB-INF/views/redirect.jsp");
	 }catch(Exception e) {
		 System.out.println(e.getMessage());
	 }
		
		return forward;
	}

}
