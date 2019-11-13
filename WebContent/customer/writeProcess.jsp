<%@page import="com.exam.dao.BoardDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%--post 파라미텉값 한글처리--%>
    <% request.setCharacterEncoding("utf-8");%>
    
    <%--액션태그로 자바빈 객체 생성--%>
    <jsp:useBean id="boardVO" class="com.exam.vo.BoardVO"/>
    
    <%--액션태그로 파라미터 값을 자바빈에 저장--%>
    <jsp:setProperty property="*" name="boardVO"/>
    
    <%--글 등록날짜, IP주소 값 저장--%>
    <%
    boardVO.setRegDate(new Timestamp(System.currentTimeMillis()));
    boardVO.setIp(request.getRemoteAddr());
    %>
    
    <%--BoardDao 객체준비--%>
    <%BoardDao boardDao = BoardDao.getInstance();%>
    
    <%
    //게시글 번호 생성하는 메소드 호출
    int num = boardDao.nextBoardNum();
    //생성된 번호를 자바빈 글번호 필드에 설정
    boardVO.setNum(num);
    //주글일 경우
    boardVO.setRe_Ref(num);//주 글쓰기에서 [글 그룹 번호]는 글 번호와 동일함
    boardVO.setRe_Lev(0); // 주글은[들여쓰기 레벨]0
    boardVO.setRe_seq(0); // 주글은[글그룹 안에서의 순서]0
    boardVO.setReadcount(0); // 조회수 0
    
    %>
    
    <%--게시글 한개 등록하는 메소드 호출 insertBoard(boardVO)--%>
    <% boardDao.insertBoard(boardVO);%>
    
    <%--이동 customer.jsp로 이동--%>
    <% response.sendRedirect("customer.jsp");%>
    
    
    
    