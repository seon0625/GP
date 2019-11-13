<%@page import="com.exam.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<%-- head area --%>
	<jsp:include page="../include/common_head.jsp"/>
	<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<header>
		
</header>
<body>
	<div id="wrap">
		<%-- header 영역 --%>
		<jsp:include page="../include/header.jsp" />
	<%
		request.setCharacterEncoding("utf-8");
		// 쿠키값 가져오기
		Cookie[] cookies = request.getCookies();
		//세션값 없으면 loginForm.jsp 이동
		if (cookies == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		String id = (String)session.getAttribute("id");
	%>	
		<h1 id="company"><div>회 원 탈 퇴</div></h1>
		<article>
		<form name="frm" action="deleteProcess.jsp" method="post" id="id_delete">
		<div id="join_button">
		아이디 <input type="text" name="id" value="<%=id %>" readonly /><br><br>
		패스워드 <input type="password" name="passwd"/><br><br>
		<button type="submit">삭제하기</button>&emsp;&emsp;
		<button type="button" onclick="location.href='../main/main.jsp' ">처음으로</button>
		</div>
	</form>
	</article>	
        <div class="clear"></div>
        <%-- footer area --%>
		<jsp:include page="../include/footer.jsp" />
	</div>		
		<%-- common_script.jsp include --%>
    	<jsp:include page="../include/common_script.jsp"/>
	
</body>
</html>