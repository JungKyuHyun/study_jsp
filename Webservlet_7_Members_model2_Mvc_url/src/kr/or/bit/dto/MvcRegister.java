package kr.or.bit.dto;
/*
 create table mvcregister(
 id number constraint pk_mvcregister_id primary key,
 pwd varchar2(20) not null,
 email varchar2(20) not null
); 
 
 */
public class MvcRegister {
	private int id;
	private String pwd;
	private	String email;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "MvcRegister [id=" + id + ", pwd=" + pwd + ", email=" + email + "]";
	}
	
	
	
}
