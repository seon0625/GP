<%@page import="com.exam.dao.MemberDao"%>
<%@page import="com.exam.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%-- head area --%>
	<jsp:include page="../include/common_head.jsp"/>
	<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	
	
	<%
	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("id");
	MemberDao memberDao = MemberDao.getInstance();
	MemberVO memberVO = memberDao.getMember(id);
	%>
	<div id="wrap">
		<%-- header area --%>
		<jsp:include page="../include/header.jsp"/>
	  	<h1 id="company"><div>member info</div></h1>
  		<article>
  			<h2>회 원 정 보 수 정</h2>
  			<form name="frm" id="join" action="infoUpdateProcess.jsp" method="post" onsubmit="return check();">
  				<fieldset>
					<legend>필수정보</legend>
					<label>아이디</label> <input name="id" type="text" class="id" id="id" autofocus="autofocus" value="<%=memberVO.getId() %>" readonly><br>
					<label>비밀번호</label> <input name="passwd" type="password" class="pass"><br>
					<label>이름</label> <input name="name" type="text" class="nick" value="<%=memberVO.getName() %>" readonly><br>
					<%
						String email = memberVO.getEmail();
						if  (email != null) {
						%>
						<label>E-Mail</label> <input name="email" type="email" class="email" value="<%=memberVO.getEmail() %>" ><br>
						<%
						} else {
						%>
						<label>E-Mail</label> <input name="email" type="email" class="email" ><br>
						<%	
						}
						%><br>
						<label>나이</label> <input name="age" type="number" class="age" value="<%=memberVO.getAge() %>"><br>
						<%
							String gender = memberVO.getGender();
							if(gender!=null){
								if (gender.equals("여")) {
									%>
									<label>성별</label><input type="radio" name="gender" value="남"/>남자<input type="radio" name="gender" value="여" checked="checked">여자<br>
									<%
									} else if (memberVO.getGender().equals("남")) {
									%>
									<label>성별</label><input type="radio" name="gender" value="남" checked="checked"/>남자<input type="radio" name="gender" value="여"/>여자<br>
									<%	
									} 
							} else {
								%>					
								<label>성별</label><input type="radio" name="gender" value="남"/>남자<input type="radio" name="gender" value="여"/>여자<br>
								<%
								}
								%>
				</fieldset>
  				<fieldset>
					<legend>세부정보</legend>
						<%
						String address = memberVO.getAddress();
						if  (address != null) {
						%>
						<label>주소</label> <input name="address" type="text" class="address" value="<%=memberVO.getAddress() %>"><br>
						<%
						} else {
						%>
						<label>주소</label> <input name="address" type="text" class="address"><br>
						<%
						}
						%>
						<%
						String mtel = memberVO.getMtel();
						if  (mtel != null) {
						%>
						<label>핸드폰번호</label> <input name="mtel" type="tel" class="mobile" value="<%=memberVO.getMtel() %>"><br>
						<%
						} else {
						%>
						<label>핸드폰번호</label> <input name="mtel" type="tel" class="mobile"><br>
						<%
						}
						%>
				</fieldset>
				<input type="submit" value="정보수정" class="submit">
				<input type="reset" value="초기화" class="cancel">
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
	
