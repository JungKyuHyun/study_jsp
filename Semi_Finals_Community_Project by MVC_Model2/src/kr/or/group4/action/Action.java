package kr.or.group4.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	public Actionforward excute(HttpServletRequest request, HttpServletResponse response);
}
