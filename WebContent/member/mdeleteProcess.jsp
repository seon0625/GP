<%@page import="com.exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
   request.setCharacterEncoding("utf-8");
   //세션값 배열로 가져오기
   
   
   String[] ids = request.getParameterValues("del");
   
   MemberDao memberDao = MemberDao.getInstance();
   for(int i=0; i < ids.length; i++) {
   String id = ids[i] ;
   memberDao.deleteMember(id);
   }
%>

<script>
   alert('회원삭제가 성공했습니다.');
   location.href='admin.jsp';
</script>