package com.exam.dao;

import java.sql.*;
import java.util.*;

import com.exam.vo.MemberVO;

public class MemberDao {
	private static MemberDao instance = new MemberDao();
	public static MemberDao getInstance() {
		return instance;
	}
	private MemberDao() {
	}
	public int insertMember(MemberVO vo) {
	// 여기서 con과 pstmt를 필드에 두게되면 동시에 건드릴 수 있게되어
	// 문제가 발생함.
	Connection con = null;
	PreparedStatement pstmt = null;
	int rowCount = 0;
	
	try {
		con = DBManager.getConnection();
		// 3단계: sql문 준비해서 실행
		String sql = "INSERT INTO member(id, passwd, name, age, gender, email, address, mtel, reg_date)";
		sql += " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		pstmt =con.prepareStatement(sql);
		pstmt.setString(1, vo.getId());
		pstmt.setString(2, vo.getPasswd());
		pstmt.setString(3, vo.getName());
		pstmt.setInt(4, vo.getAge());
		pstmt.setString(5, vo.getGender());
		pstmt.setString(6, vo.getEmail());
		pstmt.setString(7, vo.getAddress());
		pstmt.setString(8, vo.getMtel());
		pstmt.setTimestamp(9, vo.getRegDate());
		// 4단계: sql문 실행
		rowCount = pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		DBManager.close(con, pstmt);
	}
	return rowCount;

} // insertMember method

	public MemberVO userCheck(String id, String passwd) {
	// int check = -1; // -1 아이디 불일치. 0 패스워드 불일치. 1 일치함
	MemberVO memberVO = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		con = DBManager.getConnection();
		// 3단계: sql문 준비해서 실행
		String sql = "SELECT * FROM member WHERE id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		// 4단계: sql문 실행
		rs = pstmt.executeQuery();
		// 5단계: rs데이터 사용
		if (rs.next()) {
		// 아이디 있음
			if(passwd.equals(rs.getString("passwd"))) {
				memberVO = new MemberVO();
				memberVO.setId(rs.getString("id"));
				memberVO.setPasswd(rs.getString("passwd"));
				memberVO.setName(rs.getString("name"));
			} else {
				memberVO = null;
			}
		} else { // 아이디 없음
			memberVO = null;
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		DBManager.close(con, pstmt, rs);
	}
		return memberVO;
	}
	
	
public boolean isIdDuplicated(String id) {
        boolean isIdDuplicated = false;
        int count = 0; // id값이 일치하는 행의 개수
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql= "";
        try {
            con = DBManager.getConnection();
            sql = "SELECT COUNT(*) AS cnt FROM member WHERE id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            rs.next(); // 커서 옮기기
            count = rs.getInt(1);
            if (count == 1) {
                isIdDuplicated = true; // 중복이다
            } else { // count == 0
                isIdDuplicated = false; // 중복이아니다
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }
        return isIdDuplicated;
    }// userCheck method
	
	
	
	

	public static List<MemberVO>  getMembers() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			con = DBManager.getConnection();
			sql = "SELECT * FROM member ORDER BY id ASC";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MemberVO memberVO = new MemberVO();
				memberVO.setId(rs.getString("id"));
				memberVO.setPasswd(rs.getString("passwd"));
				memberVO.setName(rs.getString("name"));
				memberVO.setGender(rs.getString("gender"));
				memberVO.setAddress(rs.getString("address"));
				memberVO.setEmail(rs.getString("email"));
				memberVO.setRegDate(rs.getTimestamp("reg_date"));
				String age = rs.getString("age");
				if(age == null) {
					age = "0";
					memberVO.setAge(Integer.parseInt(age));
				} else {
					memberVO.setAge(Integer.parseInt(age));
				}
				memberVO.setMtel(rs.getString("mtel"));
				list.add(memberVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, stmt, rs);
		}
		return list;
	} // getMembers method

	
	
	
	
	public static MemberVO getMember(String id) {
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql = "SELECT * FROM member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				memberVO = new MemberVO();
				
				memberVO.setId(rs.getString("id"));
				memberVO.setPasswd(rs.getString("passwd"));
				memberVO.setName(rs.getString("name"));
				memberVO.setGender(rs.getString("gender"));
				memberVO.setAddress(rs.getString("address"));
				memberVO.setEmail(rs.getString("email"));
				memberVO.setRegDate(rs.getTimestamp("reg_date"));
				String age = rs.getString("age");
				if(age == null) {
					age = "0";
					memberVO.setAge(Integer.parseInt(age));
				} else {
					memberVO.setAge(Integer.parseInt(age));
				}
				memberVO.setMtel(rs.getString("mtel"));
			 } 
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return memberVO;
	} // getMember method
	
	public int updateMember(MemberVO memberVO) {
		int rowCount = 0; 
		int result = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql = "SELECT passwd FROM member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberVO.getId());
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				if (memberVO.getPasswd().contentEquals(rs.getString("passwd"))) {
					pstmt.close();
				sql = "UPDATE member SET passwd=?, gender=?, email=?, age=?, address=?, mtel=? WHERE id = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, memberVO.getPasswd());
				pstmt.setString(2, memberVO.getGender());
				pstmt.setString(3, memberVO.getEmail());
				pstmt.setInt(4, memberVO.getAge());
				pstmt.setString(5, memberVO.getAddress());
				pstmt.setString(6, memberVO.getMtel());
				pstmt.setString(7, memberVO.getId());
				// 4단계: sql문 실행
				pstmt.executeUpdate();
				
				result = 1;
				} else {
				result = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
		return result;
	} // updateMember method	

	
	   public int deleteMember(String id) {
		      int rowCount = 0; // 삭제된 행의 개수
		      // JDBC 참조변수 준비
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      String sql = "";
		      
		      try {
		         con = DBManager.getConnection();
		         sql = "DELETE FROM member WHERE id=?";
		         pstmt = con.prepareStatement(sql);
		         pstmt.setString(1, id);
		         rowCount = pstmt.executeUpdate();
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         DBManager.close(con,pstmt);
		      }
		      return rowCount;
		   } // deleteMember method

	
	
	
	
	
	
} // class
