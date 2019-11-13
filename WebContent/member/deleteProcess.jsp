<%@page import="com.exam.dao.MemberDao"%>
<%@page import="com.exam.vo.MemberVO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
// 세션값 가져오기
String id = (String)session.getAttribute("id");
MemberDao memberDao = MemberDao.getInstance();
MemberVO member = memberDao.getMember(id); 
// 세션값 없으면 loginFrom.jsp 이동
if (id == null ) {
    response.sendRedirect("login.jsp");
    return;
}
// post 파라미터값 한글처리
request.setCharacterEncoding("utf-8");
%>
<%-- 액션태그 userBean 자바빈 객체생성 --%>
<jsp:useBean id="memberVO" class="com.exam.vo.MemberVO" />
<%-- 액션태그 estProperty 폼 -> 자바빈 필드에 저장 --%>
<jsp:setProperty property="*" name="memberVO" />
<%
// 회원정보 수정하기 method 호출
int result = memberDao.deleteMember(id); // deleteMember사용
// result == 1 수정성공. main,jsp이동
// result == 0 패스워드 틀림. 뒤로이동
    if (result == 1) {
        // 삭제할 레코드를 가져오기
        MemberVO deleteMemberVO = memberDao.getMember(memberVO.getId());
        // 세션값 회원정보 수정
        session.setAttribute("id", deleteMemberVO);
    %>
        <script>
            alert('회원정보가 삭제되었습니다.');
            location.href = '../main/main.jsp';
        </script>
    <% 
    } else { // result == 0
    %>
        <script>
            alert('비밀번호가 틀립니다.');
            history.back();
        </script>
    <%
    }
    %>