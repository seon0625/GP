<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.exam.vo.PBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.exam.dao.PBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="../css/reset5.css" rel="stylesheet" type="text/css">
	<link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css"> 
	<link href="../css/style.css" rel="stylesheet" type="text/css">
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
    <link href="../css/front.css" rel="stylesheet" type="text/css">
    <link  href="../css/themes/default/default.css" rel="stylesheet" type="text/css">
    <link href="../css/nivo-slider.css" rel="stylesheet" type="text/css">
    <link href="../css/bjqs.css?ver=2" rel="stylesheet" type="text/css">
	
	<style>
	ul{
		list-style:none;
		padding-left: 1px;
	}
	</style>

</head>
			<%
			
			String strPageNum = request.getParameter("pageNum");
			if(strPageNum == null){
				strPageNum = "1";
			}
			
			//페이지번호
			int pageNum = Integer.parseInt(strPageNum);
			//DAO객체 준비
			PBoardDao pBoardDao = PBoardDao.getInstance();
			//한 페이지(화면)에 보여줄 글 개수
			int pageSize = 10;
			//시작행 번호 구하기
			int startRow =(pageNum-1)*pageSize + 1;
			//글내용 리스트로 된 배열 메소드 호출
			List<PBoardVO> PBoardList = pBoardDao.getBoards(startRow, pageSize,"winter");
			//board테이블 전체글 개수 가져오기 메소드 호출
			int count = pBoardDao.getBoardCount("winter");
			

			//세션값 가져오기
			String id = (String) session.getAttribute("id");
			
			%>
			
			
<body>
	<div id="wrap">
	
		<%-- header area --%>
		<jsp:include page="../include/header.jsp" />
   
  		<h1 id="community"><div>Styling - Winter</div></h1>
  		
  		<article>
  			
	  				
  			<article id="gallery">
<%
	  		if(count > 0){
	  			%>
	  			<%
	  			for(PBoardVO pboardVO : PBoardList){
  	  			%>
  				<%if(pboardVO.getFiletype().equals("I")){
  					%>
  					<article>
  					<figure class="pimg">
  						<img src="../upload/<%=pboardVO.getFilename()%>">
  					</figure>
  					<%
  				 } 
  				 %>
 				
  				
  				<section>
  				<ul>
  				<li>글 제목 : <%=pboardVO.getSubject()%></li>
  				<br>
  				<li>작성자 : <%=pboardVO.getUsername() %></li>
  				<br>
  				<li>계절 : <%=pboardVO.getType() %></li>
  				<br>
  				<li>추천수: &ensp;<img src="good.png"  style="cursor:pointer" onclick="location.href='Chuchun.jsp?num=<%=pboardVO.getNum()%>&pageNum=<%=strPageNum%>';"/><%=pboardVO.getReadcount()%></li>			
  				<br>
  				</ul>
  	  			</section>
  	  			
				</article>
  	  		<%
  	  		} // for
  	  		%>
  	  	
  	  		<%
  			} else {
  				%>
  				<article class="phone">
  				<section>
  				<ul>
  				<li>게시판 글이 없습니다.</li>  				
  				</ul>

  				</section>
  				</article>
  				<%

  			}
  	  			%>
			</article>
			<div class="clear"></div>		
			

			
			
			
			
			<div id="page">
				<ul class="paging">
<%
	if (count > 0) {
		// 총 페이지 개수 구하기
		//  전체 글개수 / 한페이지당 글개수 (+ 1 : 나머지 있을때)
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		
		// 페이지블록 수 설정
		int pageBlock = 5;
		
		// 시작페이지번호 startPage 구하기
		// pageNum값이 1~5 사이면 -> 시작페이지는 항상 1이 나와야 함
		
		// ((1 - 1) / 5) * 5 + 1 -> 1
		// ((2 - 1) / 5) * 5 + 1 -> 1
		// ((3 - 1) / 5) * 5 + 1 -> 1
		// ((4 - 1) / 5) * 5 + 1 -> 1
		// ((5 - 1) / 5) * 5 + 1 -> 1
		
		// ((6 - 1) / 5) * 5 + 1 -> 6
		// ((7 - 1) / 5) * 5 + 1 -> 6
		// ((8 - 1) / 5) * 5 + 1 -> 6
		// ((9 - 1) / 5) * 5 + 1 -> 6
		// ((10- 1) / 5) * 5 + 1 -> 6
		int startPage = ((pageNum - 1) / pageBlock) * pageBlock + 1;
		
		// 끝페이지번호 endPage 구하기
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		// [이전] 출력
		if (startPage > pageBlock) {
			%>
			<a href="community.jsp?pageNum=<%=startPage-pageBlock %>">[이전]</a>
			<%
		}
		
		// 페이지블록 페이지5개 출력
		for (int i = startPage; i<=endPage; i++) {
			%>
			<a href="community.jsp?pageNum=<%=i %>">
			<%
			if (i == pageNum) {
				%><span style="font-weight: bold;">[<%=i %>]</span><%
			} else {
				%><%=i %><%
			}
			%>
			</a>
			<%
		} // for
		
		// [다음] 출력
		if (endPage < pageCount) {
			%>
			<a href="community.jsp?pageNum=<%=startPage+pageBlock %>">[다음]</a>
			<%
		}
		
	} // if
	%>
				</ul>		
			</div>		
		
		<div id="table_search">
			<%
      	 	if (id != null) {
      	 		%>
	      	 	<input type="button" value="글쓰기" class="btn" onclick="location.href='photo_upload.jsp';">
				<input type ="button" value="목록보기" class="btn" onclick="location.href='community.jsp'">
				<%
      	 	} else {
      	 		%>
      	 		<input type="button" value="글쓰기" class="btn" onclick="script:alert('로그인 후 이용하세요');">
    			<input type ="button" value="목록보기" class="btn" onclick="location.href='community.jsp'">
    	 <%
      	 	 } 
      	 %>
      	 
      	 	</div>


  		</article>
		

  		<%-- sidebar_community.jsp include --%>
  		<jsp:include page="../include/sidebar_community.jsp"/>


        <div class="clear"></div>
        <%-- footer area --%>
		<jsp:include page="../include/footer.jsp" />
	</div>


    <%-- common_script.jsp include --%>
    <jsp:include page="../include/common_script.jsp"/>
</body>
</html>