package kr.or.bit.action;

public class ActionForward {
	private boolean isRedirect;
	private String path; 
	
	ActionForward(){
		isRedirect = false;
		path = null;
	}

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
	
}
