package com.exam.dao;

import java.sql.*;
import java.util.*;

import com.exam.vo.PBoardVO;


public class PBoardDao {
	
	private static PBoardDao instance = new PBoardDao();
	public static PBoardDao getInstance() {
		return instance;
	}
	
	private PBoardDao() {}
	
	
	// 첨부파일 정보 입력 
	public void insertPboard(PBoardVO pboardVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
	
		try {
			con = DBManager.getConnection();
			// 3단계:sql문 준비해서 실행
			String sql = " INSERT INTO pboard (num, username, passwd, subject, content, re_Ref, re_Lev, re_Seq, sf, summer, winter, free, uploadpath, filename, filetype, readcount, type) ";
			sql += " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pboardVO.getNum());
			pstmt.setString(2, pboardVO.getUsername());
			pstmt.setString(3, pboardVO.getPasswd()); 
			pstmt.setString(4, pboardVO.getSubject());
			pstmt.setString(5, pboardVO.getContent());
			pstmt.setInt(6, pboardVO.getRe_Ref());
			pstmt.setInt(7, pboardVO.getRe_Lev());
			pstmt.setInt(8, pboardVO.getRe_Seq());
			pstmt.setString(9, pboardVO.getSf());
			pstmt.setString(10, pboardVO.getSummer());
			pstmt.setString(11, pboardVO.getWinter());
			pstmt.setString(12, pboardVO.getFree());
			pstmt.setString(13, pboardVO.getUploadpath());
			pstmt.setString(14, pboardVO.getFilename());
			pstmt.setString(15, pboardVO.getFiletype());
			pstmt.setInt(16, pboardVO.getReadcount());
			pstmt.setString(17, pboardVO.getType());
			
			// 실행
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
} // insert Method
	
	
	//데이터 베이스에 insert 할때 레코드 변호 생성 메소드
		public int nextBoardNum(){
			int num = 0;
			Connection con = null;
			Statement stmt = null;
			ResultSet rs= null;
			
			try {
				con=DBManager.getConnection();
				String sql = " select max(num) from pboard ";
				stmt = con.createStatement();
				rs=stmt.executeQuery(sql);
				if(rs.next()) {
					num = rs.getInt(1) + 1;
				} else {
					num = 1;
				}
			
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(con, stmt, rs);
			}
			return num;
		}//nextBoardNum
	
	
	
	//타입에 해당하는 글 리시트로 가져오기 + 페이징
	public List<PBoardVO> getBoards(int startRow, int pageSize,String type){
		List<PBoardVO>list = new ArrayList<PBoardVO>();
		
		int endRow = startRow + pageSize -1;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT aa.* ");
		sb.append("FROM ");
		sb.append("    (SELECT ROWNUM AS rnum, a.* ");
		sb.append("    FROM ");
		sb.append("        (SELECT * ");
		sb.append("        FROM pboard");
		sb.append("        WHERE type =?");
		sb.append("        ORDER BY num DESC) a ");
		sb.append("    WHERE ROWNUM <= ?) aa ");
		sb.append("WHERE rnum >= ? ");
		
		//위에 것은 이미 한페이지당 앉힐 수 있는 페이징 메소드
		// 카운트를 걸더라도 페이지가 3으로 나온다.
		
		try {
			con=DBManager.getConnection();

			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1,type);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3,startRow);
			
			//실행
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PBoardVO pboardVO = new PBoardVO();
				
				pboardVO.setNum(rs.getInt("num"));
				pboardVO.setUsername(rs.getString("username"));
				pboardVO.setPasswd(rs.getString("passwd"));
				pboardVO.setSubject(rs.getString("subject"));
				pboardVO.setContent(rs.getString("content"));
				pboardVO.setRe_Ref(rs.getInt("re_ref"));
				pboardVO.setRe_Lev(rs.getInt("re_lev"));
				pboardVO.setRe_Seq(rs.getInt("re_seq"));
				pboardVO.setSf(rs.getString("sf"));
				pboardVO.setSummer(rs.getString("summer"));
				pboardVO.setWinter(rs.getString("winter"));
				pboardVO.setFree(rs.getString("free"));
				pboardVO.setUploadpath(rs.getString("uploadpath"));
				pboardVO.setFilename(rs.getString("filename"));
				pboardVO.setFiletype(rs.getString("filetype"));
				pboardVO.setReadcount(rs.getInt("readcount"));
				pboardVO.setType(rs.getString("type"));
				
				//리스트에 vo객체 한개 추가
				list.add(pboardVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		return list;
	}//getBoards
	

	
	public int getBoardCount(String type){
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt =  null;
		ResultSet rs = null;
		
		try {
			con = DBManager.getConnection();
			String sql = "select count(*) from pboard where type= ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, type);
			
			//실행
			rs = pstmt.executeQuery();
			rs.next(); // 커서 옮겨서 행 존재유무/ true,false 리턴
			
			count = rs.getInt(1);
			
		} catch (Exception e) {
		
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return count;
	}//getBoardCount
	
	
	//전체글 카운트
	//boardList.size()를 썻더니 한페이지 int page = 3로 설정하니까
	//전체글이 아닌 한 페이지에 들어가는 3개의 게시판만 나옴
	
	public PBoardVO getBoard(int num) {
		
		PBoardVO pboardVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DBManager.getConnection();
			String sql = "select * from pboard where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,num);
			//실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pboardVO = new PBoardVO();
				pboardVO.setNum(rs.getInt("num"));
				pboardVO.setUsername(rs.getString("username"));
				pboardVO.setPasswd(rs.getString("passwd"));
				pboardVO.setSubject(rs.getString("subject"));
				pboardVO.setContent(rs.getString("content"));
				pboardVO.setRe_Ref(rs.getInt("re_ref"));
				pboardVO.setRe_Lev(rs.getInt("re_lev"));
				pboardVO.setRe_Seq(rs.getInt("re_seq"));
				pboardVO.setSf(rs.getString("sf"));
				pboardVO.setSummer(rs.getString("summer"));
				pboardVO.setWinter(rs.getString("winter"));
				pboardVO.setFree(rs.getString("free"));
				pboardVO.setUploadpath(rs.getString("uploadpath"));
				pboardVO.setFilename(rs.getString("filename"));
				pboardVO.setFiletype(rs.getString("filetype"));
				pboardVO.setReadcount(rs.getInt("readcount"));
				pboardVO.setType(rs.getString("type"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		return pboardVO;
		
	}//getBoard
	
	//특정레코드의 조회수를 1 증가시키는 메소드
	public void updateReadcount(int num) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			con= DBManager.getConnection();
			sb.append("update pboard ");
			sb.append("set readcount = readcount +1 ");
			sb.append("where num = ?");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, num);
			//실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
		
	}//updateReadcount
	

}//Board2Dao
