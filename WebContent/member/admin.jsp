<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.exam.vo.MemberVO"%>
<%@page import="com.exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<jsp:useBean id="memberVO" class="com.exam.vo.MemberVO"/>
<jsp:setProperty property="*" name="memberVO"/>
<%
	String strPageNum = request.getParameter("pageNum");
	if (strPageNum == null) {
		strPageNum = "1";
	}
	// DAO 객체 준비
		MemberDao memberDao = MemberDao.getInstance();
	// 페이지 번호
	int pageNum = Integer.parseInt(strPageNum);
	// 한페이지(화면)에 보여줄 회원 개수
	int pageSize = 10;
	// 시작행번호 구하기
	int startRow = (pageNum - 1) * pageSize + 1;
	//전체회원정보 가져오기 메소드 호출
	List<MemberVO> memberList = memberDao.getMembers();
%>
	<jsp:include page="../include/common_head.jsp"/>
</head>
<body>
	<div id="wrap">
	
		<%-- header 영역 --%>
		<jsp:include page="../include/header.jsp" />
	<h1 style="font-size: large; text-align: center;">관리자용 전체 회원정보 조회</h1>
	<br>
	<form action="mdeleteProcess.jsp" method="post" onsubmit="return membersDeleteCheck();" style="text-align: center;" >
	<table id="cbbs">
		<tr>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th>나이</th>
			<th>성별</th>
			<th>휴대폰</th>
			<th>이메일</th>
			<th>가입날짜</th>
			<th>삭제</th>
		</tr>
		<%
		if(memberList.size()>0){
			for(MemberVO member :memberList){
				%>
				<tr>
					<td><%=member.getId() %></td>
					<td><%=member.getPasswd() %></td>
					<td><%=member.getName()%></td>
					<td><%=member.getAge()%></td>
					<td><%=member.getGender()%></td>
					<td><%=member.getMtel()%></td>
					<td><%=member.getEmail()%></td>
					<td><%=member.getRegDate()%></td>
					<td><input type="checkbox" name="del" value="<%=member.getId() %>" /></td>
				</tr>
				
				<%
			}
		} else {
			%>
				<tr>
					<td>회원정보가 없습니다</td>
				</tr>
			
			<%
		}
		%>
	</table>
	<div style="text-align: center;">
	<%
		if(memberList.size()>0){
			int pageCount = memberList.size() / pageSize + (memberList.size() % pageSize == 0 ? 0 :1);
			
			//페이지 블록수 설정
			int pageBlock = 1;
			
			int startPage = ((pageNum - 1)/ pageBlock) * pageBlock+1;
			
			// 끝페이지 번호 endPage구하기
			int endPage = startPage + pageBlock - 1;
			if(endPage > pageCount){
				endPage = pageCount;
			}
			// 이전 버튼 출력
			if(startPage>pageBlock){
				%>
				<a href="admin.jsp?pageNum=<%=startPage-pageBlock %>">[이전]</a>
				<%
			}
			// 페이지 블록 
			for(int i= startPage; i<=endPage; i++){
				%>
				<a href="admin.jsp?pageNum<%=i %>">
				<%
				if(i == pageNum){
					%> <span style="font-weight: bold;">[<%=i %>]</span><%
				}else{
					%><%=i %><% 
				}
				%>
				</a>
				<%
			}
			// 다음 버튼 출력
			if(startPage < pageBlock){
				%>
				<a href="admin.jsp?pageNum=<%=startPage+pageBlock %>">[다음]</a>
				<%
			}
		}//if
	%>
	</div>
	<br><br>
	
	<button class="BB" type="button" onclick="location.href='../main/main.jsp'">메인화면</button>
	<button class="BB" type="submit">일괄삭제</button>
	</form>
 	
	
	
	
	
 	<%--푸터  --%>
    <jsp:include page="../include/footer.jsp"></jsp:include>
    </div>
</body>
<script>
	function membersDeleteCheck() {
		//글수정 의도 확인하기
		var result = confirm('정말로 삭제하시겠습니까?');
		if(result == false){
			return false;
		}
	}
</script>
</html>