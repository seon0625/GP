<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="loginProcess.jsp" method="post">
	ID: <input type="text" name="id" /><br>
	PASSWORD: <input type="password" name="passwd" /><br>
<button type="submit">로그인</button>
<button type="button" onclick="location.href='join.jsp'">회원가입</button>	
</form>


</body>
</html>