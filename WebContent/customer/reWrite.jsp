<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%--CSS링크 --%>
    <link href="../css/reset5.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css"> 
    <link href="../css/style.css?v=1" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
</head>
<body>
	<div id="wrap">
 		<%--헤더링크 --%>
		<jsp:include page="../include/header.jsp"></jsp:include>
	
		<%--세션값가져오기 --%>
		<% String id = (String) session.getAttribute("id");%>

		<%
		//파라미터값 가져오기
		String reRef = request.getParameter("reRef");
		String reLev = request.getParameter("reLev");
		String reSeq = request.getParameter("reSeq");
		%>
		
		<article >
				<h2>답글쓰기</h2>
				
			<form action="reWriteProcess.jsp" method="post" name="frm">
				<input type="hidden" name="re_Ref" value="<%=reRef%>" />
				<input type="hidden" name="re_Lev" value="<%=reLev %>" />
				<input type="hidden" name="re_Seq" value="<%=reSeq %>" />
				
		<table id="cbbs">
			<tr>
		    	<th class="twrite" width="50">아이디</th>
		    	<td class="left" width="300">
		    	<input type="text" name ="username" value="<%=id %>"readonly></td>
	    	</tr>
			<tr>
				<th>제목</th>
				<td class="left">
				<input type="text" name="subject" /><%-- value="댓글:" --%> 
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td class="left">
				<textarea name="content" rows="13" cols="40"></textarea>
				</td>
			</tr>
		</table>
				
				
				<div style="margin-left: 270px; margin-top: 5px;">
					<input type="submit" value="답글쓰기"/>
					<input type="reset" value="다시작성"/>
					<input type="button" value="목록보기" onclick="location.href='customer.jsp';"/>
					
				</div>
		</form>
		</article>
		
		<%--aside 영역 --%>
		<jsp:include page ="../include/sidebar_customer.jsp"/>
		<div class="clear"></div>
		<%--푸터  --%>
    	<jsp:include page="../include/footer.jsp"></jsp:include>
		<%--스크립트 링크 --%>
   		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	    <script type="text/javascript" src="../scripts/jquery.fancybox.pack.js"></script>
	    <script type="text/javascript" src="../scripts/prettify.packed.js"></script>
	  	<script type="text/javascript">
	  		$(document).ready(function() {
				$(".fancybox").fancybox({
					openEffect	: 'none',
					closeEffect	: 'none'
				});
			});
  	</script>
	
	</div>
	
    
    
	
</body>
</html>