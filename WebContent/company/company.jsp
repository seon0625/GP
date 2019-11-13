<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="../css/reset5.css" rel="stylesheet" type="text/css">
	<link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css"> 
	<link href="../css/style.css" rel="stylesheet" type="text/css">
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
    <link href="../css/front.css" rel="stylesheet" type="text/css">
    <link  href="../css/themes/default/default.css" rel="stylesheet" type="text/css">
    <link href="../css/nivo-slider.css" rel="stylesheet" type="text/css">
    <link href="../css/bjqs.css?ver=2" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
	
		<%-- header area --%>
		<jsp:include page="../include/header.jsp" />
   
  		<h1 id="company"><div>company</div></h1>
  		<article>
  			<h2>관리자 인사말</h2>
  			 <figure> 
				<img src="../imgs/ceo.jpg" alt="ceo">
				<figcaption>KIM SEONU</figcaption> 
  			</figure>
  			<p>
  				안녕하세요 반갑습니다. Chubby Guy 관리자 김선우라고 합니다.<br> 
  				통통한 남자들! 표준사이즈 옷으로 코디하기 참 어려웠죠?<br> 
  				어떤식의 옷을 조합해서 입어야할지, 늘 고민이라구요?<br>
  				사계절, 상황에 맞는 코디등 다양한 스타일의 코디방법을 공유하기 위해<br>
  				이 사이트를 만들게 되었습니다.<br>
  				저희 Chubby Guy는 방문해주신 유저 여러분들과 함께 만들어가나는<br>
  				공생형 커뮤니티 사이트입니다 자기만의 스타일 혹은 <br>
  				무난한 코디방법을 코디가 어려워 옷입는게 두려운 분들에게 나눠주세요!<br>
  				부족한게 너무나 많은 관리자지만, 너그러운 마음으로 이해 부탁드리겠습니다
  			</p>
  		</article>
		
		
  		<%-- sidebar_company.jsp include --%>
  		<jsp:include page="../include/sidebar_company.jsp"/>


        <div class="clear"></div>
        <%-- footer area --%>
		<jsp:include page="../include/footer.jsp" />
	</div>


    <%-- common_script.jsp include --%>
    <jsp:include page="../include/common_script.jsp"/>
</body>
</html>