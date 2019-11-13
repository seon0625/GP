<%@page import="com.exam.dao.MemberDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");

MemberDao memberDao = MemberDao.getInstance();

boolean isIdDup = memberDao.isIdDuplicated(id);

// String passwd = request.getParameter("passwd");
// String passwd2 = request.getParameter("passwd2");

// boolean isSamePwd = true;

// if (passwd == passwd2) {
// 	isSamePwd = true;
// } else {
// 	isSamePwd = false;
// }
%>
<%=isIdDup %>
<%-- <%=isSamePwd %> --%>