<%@page import="com.exam.vo.AttachVO"%>
<%@page import="java.util.List"%>
<%@page import="com.exam.dao.AttachDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.exam.dao.BoardDao"%>
<%@page import="com.exam.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%--CSS링크 --%>
<jsp:include page="../include/common_head.jsp"></jsp:include>
<%--스크립트 링크 --%>
<jsp:include page="../include/common_script.jsp"></jsp:include>

<title>자유게시판</title>
</head>
<% 
		// 페이지 번호  파라미터값가져오기
		String pageNum = request.getParameter("pageNum");
		//글번호 num파라미터값 가져오기
		int num = Integer.parseInt(request.getParameter("num"));
		//dao객체준비 
		BoardDao boardDao = BoardDao.getInstance();
		// 조회수 1증가 시키는 메소드 호출
		boardDao.updateReadcount(num);
		// 글번호에 해당하는 레코드 한개 가져오기
		BoardVO boardVO = boardDao.getBoard(num);
		// 글작성 날짜 형식 "yyyy년dd일hh시mm분ss초"
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년dd일hh시mm분ss초");
		//세션값 가져오기
		String id = (String) session.getAttribute("id");
		
%>
<body>
	<div id="wrap">

		<%--헤더링크 --%>
		<jsp:include page="../include/header.jsp"></jsp:include>

		<article id="content_size">
			<h1>고객문의사항</h1>
			<table id="cbbs">
				<tr>
					<th><label>글번호</label></th>
					<td style="width: 220px;"><%=boardVO.getNum() %></td>
					<th><label>조회수</label></th>
					<td><%=boardVO.getReadcount() %></td>
				</tr>
				<tr>
					<th><label>작성자명</label></th>
					<td><%=boardVO.getUsername() %></td>
					<th><label>작성일자</label></th>
					<td><%=sdf.format(boardVO.getRegDate()) %></td>
				</tr>
				<tr>
					<th><label>글제목</label></th>
					<td colspan="3"><%=boardVO.getSubject() %></td>
				</tr>
				<tr>
					<th><label>글내용</label></th>
					<td colspan="3">
					<pre style="background-color: white; font-family: inherit;; font-size: x-large; min-height: 50vh"><%=boardVO.getContent() %></pre>
					</td>
				</tr>
			</table>

			
			<div style="margin-right: 300px; margin-top: 5px;">
				<%
				if (id != null) {
				%>
				<input type="button" value="글수정" class="btn" onclick="location.href='fupdate.jsp?num=<%=boardVO.getNum() %>&pageNum=<%=pageNum %>';" />
				<input type="button" value="글삭제" class="btn" onclick="checkDelete();" />
				<input type="button" value="답글쓰기" class="btn" onclick="location.href='reWrite.jsp?reRef=<%=boardVO.getRe_Ref() %>&reLev=<%=boardVO.getRe_Lev() %>&reSeq=<%= boardVO.getRe_Seq()%>';" />
				<input type="button" value="목록보기" class="btn" onclick="location.href='customer.jsp?pagenum=<%=pageNum %>';" />
				<%
				} else {
				%>
				<input type="button" value="글수정" class="btn" onclick="script:alert('권한이 없습니다.');"/>
				<input type="button" value="글삭제" class="btn" onclick="script:alert('권한이 없습니다.');" />
				<input type="button" value="답글쓰기" class="btn" onclick="script:alert('로그인 후 이용하세요');" />
				<input type="button" value="목록보기" class="btn" onclick="location.href='customer.jsp?pagenum=<%=pageNum %>';" />
				<%
				}
				%>
				
			</div>

		</article>

	</div>
        <div class="clear"></div>
	<%--푸터  --%>
	<jsp:include page="../include/footer.jsp"/>

	<script>
		function checkDelete() {
			var result =confirm('<%= boardVO.getNum()%> 번글을 정말 삭제할건가?');
			
			if(result == true){
				location.href ='delete.jsp?num=<%=boardVO.getNum()%>&pageNum=<%=pageNum%>';
			}
		}
		</script>


</body>
</html>


