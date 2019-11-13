<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">

	<%-- common_head.jsp include --%>
	<jsp:include page="../include/common_head.jsp"/>
	 <link href="../css/style.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div id="wrap">
	
		<%-- header 영역 --%>
		<jsp:include page="../include/header.jsp" />
   
  		<h1 id="company"><div>Login</div></h1>
 
  		<article id="login_article">
			<form action="loginProcess.jsp" method="post">
				<div id="join_button">
				<input type="text" name="id" placeholder="아이디를 입력하세요"/><br><br>
				<input type="password" name="passwd" placeholder="비밀번호를 입력하세요" /><br><br>
				<button type="submit">로그인</button> &emsp;&emsp;
				<button type="button" onclick="location.href='join.jsp'">회원가입</button><br>	
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