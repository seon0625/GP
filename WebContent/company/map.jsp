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
	<!-- 구글지도 라이브러리 설정 -->
	<script src="http://maps.googleapis.com/maps/api/js"></script>
	<script>
	function initialize() {
		  var LatLng = new google.maps.LatLng(35.155980, 129.059588);
		  var mapProp = {
		    center: LatLng, // 위치
		    zoom:16, // 맵 확대, 16~18 적당
		    mapTypeId:google.maps.MapTypeId.Satellite
		  };
		  var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
		  var marker = new google.maps.Marker({
			position: LatLng,
			map: map,
		  });
		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>
</head>

<body>
	<div id="wrap">
	
		<%-- header area --%>
		<jsp:include page="../include/header.jsp" />
   
  		<h1 id="company"><div>company</div></h1>
  		<article>
  		
  			<h2>관리자 거주구역</h2>
			<div id="googleMap" style="width:500px; height:400px; margin: auto;"></div>
	
			
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