<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Chubby Guys</title>
    <link href="../css/reset5.css" rel="stylesheet" type="text/css">
    <link href="../css/front.css" rel="stylesheet" type="text/css">
    <link  href="../css/themes/default/default.css" rel="stylesheet" type="text/css">
    <link href="../css/nivo-slider.css" rel="stylesheet" type="text/css">
    <link href="../css/bjqs.css?ver=2" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
</head>
<body>
	<div id="wrap">
	
		<%-- header area --%>
		<jsp:include page="../include/header.jsp" />
		
		
        <div class="slider-wrapper theme-default">
            <div id="slider" class="nivoSlider">
                <img src="../imgs/ss1.jpg" width="943" height="401"> 
                <img src="../imgs/ss2.jpg" width="943" height="401"> 
                <img src="../imgs/ss3.jpg" width="943" height="401"> 
                <img src="../imgs/ss4.jpg" width="943" height="401"> 
            </div>
        </div>    
        <div class="clear"></div>
        <div id="justar">
        	<h3>just arrived</h3>
        	<figure id="slide">
        	<ul class="bjqs">
        		<li><img src="../imgs/ww1.jpg" width="161" height="125"></li>
        		<li><img src="../imgs/ww2.jpg" width="161" height="125"></li>
        		<li><img src="../imgs/ww3.jpg" width="161" height="125"></li>
        	</ul> 
        	</figure>	
        </div>
        <div id="notinews">
        	<div class="container">
            <ul class="tabs">
                <li><a href="#tab1">Notice</a></li>
                <li><a href="#tab2">News</a></li>        
            </ul>
            	<div class="tab_container">
                    <div id="tab1" class="tab_content">
                        <ul>
                            <li><a href="#">여기는 공지사항이 들어가는 곳입니다.</a></li>
                            <li><a href="#">여기는 공지사항이 들어가는 곳입니다.</a></li>
                            <li><a href="#">여기는 공지사항이 들어가는 곳입니다.</a></li>
                            <li><a href="#">여기는 공지사항이 들어가는 곳입니다.</a></li>
                            <li><a href="#">여기는 공지사항이 들어가는 곳입니다.</a></li>                        
                        </ul>
            
                    </div>
                    <div id="tab2" class="tab_content">
                         <ul>
                            <li><a href="#">여기는 뉴스가 들어가는 곳입니다.</a></li>
                            <li><a href="#">여기는 뉴스가 들어가는 곳입니다.</a></li>
                            <li><a href="#">여기는 뉴스가 들어가는 곳입니다.</a></li>
                            <li><a href="#">여기는 뉴스가 들어가는 곳입니다.</a></li>
                            <li><a href="#">여기는 뉴스가 들어가는 곳입니다.</a></li>                        
                        </ul>
                    </div>        
            	</div>
       		</div>
        </div>
        
		<div id="social">
        <h3>social network</h3>
            <ul>
                <li><a href="#"><img src="../imgs/icon1.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../imgs/icon2.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../imgs/icon3.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../imgs/icon4.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../imgs/icon5.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../imgs/icon6.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../imgs/icon7.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../imgs/icon8.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../imgs/icon9.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../imgs/icon10.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../imgs/icon11.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../imgs/icon12.png" width="33" height="32"></a></li>
            </ul>
        </div>    
        <div class="clear"></div>
        <%-- footer area --%>
		<jsp:include page="../include/footer.jsp" />
</div>


    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="../scripts/jquery.nivo.slider.js"></script>
    <script type="text/javascript" src="../scripts/bjqs-1.3.min.js"></script>
    <script type="text/javascript">
   $(window).load(function() {
        $('#slider').nivoSlider();
    });
	// 아래는 tab 메뉴 
	$(document).ready(function() {
	//Default Action
		$(".tab_content").hide(); //Hide all content
		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content	
		//On Click Event
		$("ul.tabs li").click(function() {
			$("ul.tabs li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content
			var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active content
			return false;
		});
	});
	//
      $(document).ready(function() {
        
        $('#slide').bjqs({
          'animtype' : 'slide',
          showcontrols : false,
          showmarkers : false,
          'width' : 165,
          'height' : 130
        });
        
      });

    </script>
</body>
</html>