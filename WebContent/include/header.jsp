<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<%
		String id = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
		for (Cookie cookie : cookies){
		if (cookie.getName().equals("id")) {
		id = cookie.getValue();
		// 세션에 쿠키값을 저장
		session.setAttribute("id", id);
				}
			}
		}
		// 세션값 가져오기 "id"
		id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
	%>

	
	<div id="logo">

		<a href="../main/main.jsp">
		<img src="../imgs/logo.png" />
		</a> 
		
	</div>

	<div id="hlink">
			<%
		if (id == null) { // 세션값 없음
	%>
		<div class="login">
		<a href="../member/login.jsp">로그인</a>
		<a href="../member/join.jsp">회원가입</a>
		</div>
	<%
		} else { // id != null 세션값 있음
	
			if (id.equals("admin")) { 
		%>
			<div class="welcome"><%=name %>
			<a href="../member/logout.jsp">로그아웃</a>	
			<a href="../member/admin.jsp">회원관리</a>
			</div>
		<%	
			} else {
		%>
			<div class="welcome"><%=name %>님
			<a href="../member/logout.jsp">로그아웃</a>	
			<a href="../member/infoUpdate.jsp">정보수정</a>
			<a href="../member/delete.jsp">회원탈퇴</a>	
			</div>
		<%
			}
		}
	%>
	</div>
         
  <nav id="hmenu">
		<ul>
			<li class="n1"><a href="../company/company.jsp">관리자 소개</a></li>
			<li class="n3"><a href="../community/community.jsp">추천 코디</a></li>
			<li class="n4"><a href="../customer/customer.jsp">질의 응답</a></li>
		</ul>
	</nav>
</header>