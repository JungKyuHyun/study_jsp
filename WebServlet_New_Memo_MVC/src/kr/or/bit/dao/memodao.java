package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.bit.dto.memo;

public class memodao {
	DataSource ds; //DataSource라는 객체를 커넥션풀을 관리하는 목적으로 사용되는 객체
	Connection conn;
	Context context;
	
	public memodao() {
		conn = null;	
		try {
			context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("memodao.java -> 기본생성자 오류");
		}
	}
	
	//Read One
	public memo getMemoListById(String id) {
		memo memoObj = new memo();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql = "select id,email,content from memo where=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			memoObj = new memo();
			memoObj.setId(rs.getString("id"));
			memoObj.setId(rs.getString("email"));
			memoObj.setId(rs.getString("content"));
		}catch(Exception e) {
			System.out.println("getMemoListById() 오류 발생1" + e.getMessage());
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			}catch(Exception e) {
				System.out.println("getMemoListById() 오류 발생2" + e.getMessage());
			}
		}
		return memoObj;
	}
	
	//Read list
	public List<memo> getMemoList() {
		String sql = "select id,email,content from memo";
		List<memo> memolist = new ArrayList<>();
		try(
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			){
			while(rs.next()) {
				memo m = new memo();
				m.setId(rs.getString("id"));
				m.setEmail(rs.getString("email"));
				m.setContent(rs.getString("content"));
				memolist.add(m);
			}
		}catch(Exception e) {
			System.out.println("getMemoList() 오류발생1" + e.getMessage());
		}
		return memolist;
	}
	
	//Update
	public int insertMemo(String id, String email, String content)  {
		int resultrow=0;
		PreparedStatement pstmt = null;
		try {
		    String sql="insert into memo(id,email,content) values(?,?,?)";
			conn = ds.getConnection();
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, id);
		    pstmt.setString(2, email);
		    pstmt.setString(3, content);
		    resultrow = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("insertMemo() 오류발생 :" + e.getMessage());
		}finally {
			try {
				if(conn!=null) {conn.close();}
				if(pstmt!=null) {pstmt.close();}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return resultrow;
	}
	
	public int updateMemo(memo m) {
		//update memo set email=? , content=? where id=?
		return 0;
	}
	
	
	public int deleteMemo(String id) {
		//delete from memo where id=?
		return 0;
	}
	
	
	//추가함수 (비동기 통해서 ID 유무)
	public String isCheckById(String id) {
		String ismemoid= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select id from memo where id=?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ismemoid = "false";
			}else {
				ismemoid = "true";
			}
		}catch (Exception e) {
			System.out.println("isCheckById() 오류발생 : " + e.getMessage());
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(rs!=null) {rs.close();}
				if(conn!=null) {conn.close();}
			} catch (SQLException e) {
				System.out.println("isCheckById : " + e.getMessage());
			}
		}
		return ismemoid;
	}

}