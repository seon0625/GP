<%@page import="com.exam.vo.AttachVO"%>
<%@page import="java.util.List"%>
<%@page import="com.exam.dao.AttachDao"%>
<%@page import="com.exam.vo.BoardVO"%>
<%@page import="com.exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>

<%
	// 파라미터값 가져오기  num, pageNum
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	// DAO 객체 준비
	BoardDao boardDao = BoardDao.getInstance();
	// 수정할 글 가져오기
	BoardVO boardVO = boardDao.getBoard(num);
%>

<%-- 세션값 가져오기 --%>
<%
	String id = (String) session.getAttribute("id");
%>
<%!public boolean hasNotAuth(String id, BoardVO boardVO) {
		Boolean result = id == null && boardVO.getPasswd() == null || id != null && boardVO.getPasswd() != null
				|| id != null && !id.equals(boardVO.getUsername());
		return result;
	}%>

<%
	// *비로그인 사용자가 로그인한 사용자 글을 수정하는 경우 1
	// *로그인 사용자가 로그인 안한 사용자 글을 수정하는 경우 2
	// *로그인 사용자의 경우, 세션값 id가 게시글 작성자명과 다른 경우 3
	// "수정권한없음" 알림 후 글목록 페이지로 강제이동
	if (id == null && boardVO.getPasswd() == null // AND로 묶인 문장이 한문장이라고 생각하면 된다.
			// if (hasNotAuth(id, boardVO)) { 위에 if문 대신에 이렇게 써도 된다.
			|| id != null && boardVO.getPasswd() != null // OR은 별개로 생각 (AND가 OR보다 우선순위 높다)
			|| id != null && !id.equals(boardVO.getUsername())) { // 로그인한 회원의 유저네임을 가지고 와서 비교
		//response.sendRedirect("notice.jsp?pageNum=" + pageNum);
%>
<script>
		alert('수정 권한이 없습니다.');
		//location.href = 'content.jsp?num=<%=num%>&pageNum=<%=pageNum%>';
		history.back();
	</script>
<%
	return;
	}
%>
<head>
<meta charset="utf-8">
<title>Gony company</title>
<%--CSS링크 --%>
<jsp:include page="../include/common_head.jsp"></jsp:include>
<link href="../css/subpage.css" rel="stylesheet" type="text/css"
	media="all">
</head>

<body>
	<div id="wrap">
		<%-- header area --%>
		<jsp:include page="../include/header.jsp" />

		<div class="clear"></div>
		
		<article id="content_size" >
			<h1>게시글 수정</h1>
			
			<%-- onsubmit="함수()" 리턴되는 값을 전달 --%>
			<form action="fupdateProcess.jsp" method="post" name="frm"
				onsubmit="return check();" enctype="multipart/form-data">
				<%-- 수정할 글번호는 눈에 안보이는 hidden 타입 입력요소 사용 --%>
				<input type="hidden" name="pageNum" value="<%=pageNum%>">
				<%-- key, value 쌍이다 --%>
				<input type="hidden" name="num" value="<%=num%>">
	
	    <table id="cbbs">
	    	<tr>
	    	<th class="twrite" width="50">아이디</th>
	    	<td class="left" width="300">
	    	<input type="text" name ="username" value="<%=id %>"readonly></td>
	    	</tr>
	    	   	
	    	<tr>
	    	<th class="twrite" width="50">제목</th>
	    	<td class="left">
	    	<input type ="text" name="subject"></td>
	    	</tr>
	    	
	    	<tr>
	    	<th class="twrite" width="50">내용</th>
	    	<td class="left">
	    	<textarea name="content" rows="13" cols="40"><%=boardVO.getContent() %></textarea>
	    	</td>
	    	</tr>
	        </table>

				<div id="table_search">
					<input type="submit" value="글수정" class="btn"> 
					<input type="reset" value="다시작성" class="btn"> 
					<input type="button" value="목록보기" class="btn" onclick="location.href='customer.jsp?';">
				</div>
			</form>

		</article>
		<div class="clear"></div>

		<!-- 푸터 영역 -->
		<jsp:include page="../include/footer.jsp" />
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
	
function check() {
	// 로그인 안한 사용자일 경우 패스워드 입력여부 확인
	var objPasswd = document.frm.passwd;
	if (objPasswd != null) {
		if (objPasswd.value.length == 0) {
			alert('게시글 패스워드는 필수 입력사항입니다.');
			objPasswd.focus();
			return false;
		}
	}
	// 글수정 의도 확인
	var result = confirm('<%=num%>번 글을 정말로 수정하시겠습니까?');
			if (result == false) {
				return false;
			}
		} // function check

		// id가 btn인 버튼에 클릭 이벤트 연결
		// let는 코드안에서만 적용되는 변수(지역변수),cosnt 상수
		const btn = document.getElementById('btn');
		let num = 1;
		btn.onclick = function() { // 익명함수 => 값을 onclick에 저장하기 때문에 세미콜론 
			let str = '<input type="file" name="newFile' + num + '"><br>';
			let container = document.getElementById('newFilesContainer');
			container.innerHTML += str; // 뒤에 추가
			num++;
		};

		// class명이 del인 span태그에 클릭 이벤트 연결하기
		// querySelectoAll로 리턴되는 객체는 NodeList타입임

		var delList = document.querySelectorAll('span.del');
		for (let i = 0; i < delList.length; i++) {
			var spanElem = delList.item(i);
			// span요소에 이벤트 연결하기
			spanElem.onclick = function(event) {
				// 이벤트객체의 target은 이벤트가 발생된 객체를 의미함.
				// closest()는 가장 가까운 상위요소 한개 가져오기
				var liElem = event.target.closest('li');
				// childeNodes는 현재 요소의 자식요소들을 NodeList 타입으로 가져옴.
				var ndList = liElem.childNodes;

				var divElem = ndList.item(1);
				var inputElem = ndList.item(3);

				//inputElem.setAttribute('name', 'delFiles'); // name 속성값 바꾸기
				divElem.remove(); // 삭제
			};
		} // for
	</script>
</body>
</html>