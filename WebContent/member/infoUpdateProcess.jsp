<%@page import="com.exam.vo.MemberVO"%>
<%@page import="com.exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- parameter값 한글 처리 --%>
<% request.setCharacterEncoding("utf-8"); %>

<%-- MemberVO 자바빈 객체 생성 --%>
<jsp:useBean id="MemberVO" class="com.exam.vo.MemberVO"/>

<%-- 자바빈 객체에 파라미터값 저장하기 --%>
<jsp:setProperty property="*" name="MemberVO"/>

<%
String id= (String) session.getAttribute("id");
MemberVO.setId(id);
%>

<%
MemberDao memberDao = MemberDao.getInstance();

int result = memberDao.updateMember(MemberVO);

if (result == 1) {
	%>
	<script>
		alert('수정이 완료되었습니다.');
		location.href="../main/main.jsp"
	</script>
	<%
} else {
	%>
	<script>
		alert('비밀번호가 다릅니다.');
		history.back();
	</script>
	<%
}
%>
