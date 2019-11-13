<%@page import="com.exam.dao.PBoardDao"%>
<%@page import="com.exam.vo.PBoardVO"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.List"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
    
  	<%
	 // COS 라이브러리를 이용한 파일업로드
	 // MultipartRequest 생성자 호출시에 파일업로드가 완료됨
	
	 // 필요한 매개값 5개
	 // 1 request
	
	 // 2 saveDirectory (업로드할경로)
	 	String realPath = application.getRealPath("/upload");
	  	System.out.println("realPath: " + realPath);
	  	
	 // 3 최대 업로드 파일크기
	 	int maxSize = 1024 * 1024 * 10;
	 
	 // 4  파일이름 한글처리  	
	 // 5  파일이름 중복처리
	 // 6  파일 업로드 수행완료
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
	 
	 
	 //=============게시판 글 등록 처리 시작====================== 
	 // 자바빈 pBoardVO 객체 생성
	 PBoardVO pBoardVO = new PBoardVO();
	 
	 //파라미터값 찾아서 자바빈에 저장
	 pBoardVO.setUsername(multi.getParameter("username"));
	 pBoardVO.setSubject(multi.getParameter("subject"));
	 pBoardVO.setType(multi.getParameter("type"));
	 pBoardVO.setSf(multi.getParameter("sf"));
	 pBoardVO.setSummer(multi.getParameter("summer"));
	 pBoardVO.setWinter(multi.getParameter("winter"));
	 pBoardVO.setFree(multi.getParameter("free"));
	 
	 
	 //PBoardDao 객체준비
	 PBoardDao pBoardDao = PBoardDao.getInstance();
	 
	 //게시글 번호 생성하는 메소드 호출
	 int num = pBoardDao.nextBoardNum();
	 //생성된 번호를 자바빈 글번호 필드에 설정
	 pBoardVO.setNum(num);
	 
	
 	
 
 //==============첨부파일 등록 처리 시작==========================

 		//파라미터 이름으로 실제로 업로드된 파일이름 구하기
 		//해당 파라미터 이름을 업로드에 사용 안했으면 null이 리턴됨
 		String realFileName = multi.getFilesystemName("filename");
 		
 		
 		boolean isExeption = false;
 		//파일 업로드 여부확인, 업로드 했으면
 		if(realFileName != null) {
 			pBoardVO.setFilename(realFileName);
 			pBoardVO.setNum(num);
 		
 		// 이미지 파일여부 확인
 		File file = new File(realPath, realFileName);
 		String contentType = Files.probeContentType(file.toPath());
 		boolean isImage = contentType.startsWith("image");
 		if (isImage) {
 				pBoardVO.setFiletype("I"); // Image File
 		} else {
 				pBoardVO.setFiletype("O"); // Other
 				isExeption = true;
 		}
 		
 		if (isExeption) {
 			// 파일 삭제 메소드
 			if(file.exists()){
 				file.delete();
 			}
 			%>
 			<script>
 			alert('이미지 파일이 아닙니다');
 			history.back();
 			</script>
 			<%
 			return;
 		}
 		
 		
	}
 		
 	//게시글 한개 등록하는 메소드 호출
 	pBoardDao.insertPboard(pBoardVO);
	
 	//===========첨부파일 등록처리 종료===============
 	response.sendRedirect("../community/community.jsp");
 
 %>
<%--  <script>
 	location.href='../community/community_<%=multi.getParameter("type") %>.jsp'; 
 </script> --%>
    
    
    
