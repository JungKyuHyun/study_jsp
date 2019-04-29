package kr.or.bit.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.memodao;

public class memoWriteAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) {
	  try {
	  request.setCharacterEncoding("UTF-8");
  	  
  	  String id = request.getParameter("id");
  	  String email = request.getParameter("email");
  	  String memo = request.getParameter("memo");
  	  
  	  response.setContentType("text/html;charset=UTF-8");
  	  PrintWriter out = response.getWriter();
  	  
  		   memodao dao = new memodao();
  		   int n = dao.insertMemo(id, email, memo);
  		   if(n>0){
  			    out.print("<script>");
  		     	out.print("alert('등록성공..');");
  		     	out.print("location.href='MemoList';"); 
  		        out.print("</script>");
  		   }else{ 
  			    out.print("<script>");
  			    out.print("alert('등록실패..');");
  			    out.print("location.href='memo.jsp';");
  			    out.print("</script>");
  		   }
  	  }catch(Exception e) {
  	  }
	  
	  	ActionForward forward = new ActionForward();
	  	forward.setRedirect(false);
	  	forward.setPath("/WEB-INF/memo/memo.jsp");
	  	return forward;
	}

}
