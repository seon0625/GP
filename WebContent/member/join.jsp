<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">

	<%-- common_head.jsp include --%>
	<jsp:include page="../include/common_head.jsp"/>
	 <link href="../css/style.css" rel="stylesheet" type="text/css">
		 <script>
		 
		// 사용자 입력값 검증
		function check() {
			if (frm.id.value.length < 3) {
				alert('아이디는 세글자 이상 사용가능합니다.');
				frm.id.select();
				return false;
			}
			if (frm.passwd.value.length == 0) {
				alert('패스워드는 필수 입력 항목입니다.');
				frm.passwd.focus();
				return false;
			}
			if (frm.name.value.length == 0) {
				alert('이름은 필수 입력 항목입니다.');
				frm.name.focus();
				return false;
			}
			if (frm.email.value.length == 0) {
				alert('이메일은 필수 입력 항목입니다.');
				frm.email.focus();
				return false;
			}
			if (document.frm.passwd.value != document.frm.passwd2.value) {
				alert('패스워드 입력값이 서로 다릅니다.');
				document.frm.passwd.select();
				return false;
			}
			return true;
		}
		
		// 새로운 브라우저를 띄우고 아이디 중복확인해주는 기능
		function winOpen() {
			//var inputId = document.getElementById('id').value
			var inputId = document.frm.id.value;
			// id입력값이 공백이면 '아이디입력하세요' 포커스주기
			if (inputId == '') { // inputId.length == 0
				alert('아이디를 입력하세요.');
				document.frm.id.focus();
				return;
			}
			// 새로운 자식창(브라우저) 열기
			// open()호출한쪽은 부모창
			// open()에 의해 새로열린 창은 자식창
			// 부모-자식 관계가 있음.
			// 자식창의 데이터를 부모창으로 가져올수 있음.
			var childWindow = window.open('joinIdDupCheck.jsp?userid=' + inputId, '', 'width=400,height=300');
			//childWindow.document.write('입력한 아이디: ' + inputId + '<br>');
		}

</script>
</head>
<body>
	<div id="wrap">
	
		<%-- header 영역 --%>
		<jsp:include page="../include/header.jsp" />
   
  		<h1 id="company"><div>member join</div></h1>
  		<article id="arcc">
  			<h2>회원 가입</h2>
  			<form name="frm" id="join" action="joinProcess.jsp" method="post" onsubmit="return check();">
  				<fieldset>
					<legend>필수정보</legend>
					<label>아이디</label> <input name="id" type="text" class="id" id="id"> <input type="button" value="ID 중복확인" class="dup" onclick="winOpen();"><span id="idMessage"></span><br>
					<label>비밀번호</label> <input name="passwd" type="password" class="pass"><br>
					<label>비밀번호 재확인</label> <input name="passwd2" type="password" class="pass" onkeyup="checkPwd()">&emsp;<span id="checkPwd">패스워드 일치여부</span><br>
					<label>이름</label> <input name="name" type="text" class="nick"><br>
					<label>E-Mail</label> <input name="email" type="email" class="email" ><br>
					<label>나이</label> <input name="age" type="text" class="age"><br>
					<label>성별</label> <input name="gender" type="radio" class="gender" value="남">남</input>	
										<input name="gender" type="radio" class="gender" value="여">여</input>
				</fieldset>
  				<fieldset>
					<legend>세부정보</legend>
					<label>주소</label> <input name="address" id="address" type="text" placeholder="주소를 입력하세요." class="address"> 
					&nbsp; 
					<a href="#" onclick="javascript:new daum.Postcode({ oncomplete: function(data) { 
						var addr = '';
						var extraAddr = '';
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
					document.getElementById('address').value = addr;
					}}).open();">[주소검색]</a><br>
					<label>핸드폰번호</label> <input name="mtel" type="tel" class="mobile"><br>
				</fieldset>
				<div id="join_button">
				<input type="submit" value="회원가입" class="submit">
				<input type="reset" value="초기화" class="cancel">
  				</div>
  			</form>
  		</article>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<!-- <script src="../scripts/jquery-3.4.1.min.js"></script> -->
		<script>
			$('#id').keyup(function () {
				var id = $(this).val();
		
				$.ajax({
					url: 'joinIdDupCheckJson.jsp',
					data: {id: id},
					success: function (data) {
					idDupMessage(data);
					}
				})
			});		
			
			/* ID 중복확인 Ajax */
			function idDupMessage(isIdDup){
				
				if (isIdDup) { 
					$('span#idMessage').html('중복된 아이디').css('color', 'red');
				} else {
					$('span#idMessage').html('사용가능 아이디').css('color', 'green');
				}	
			}	
			
			/* 비밀번호 중복확인 Ajax */
			 function checkPwd(){
				 
				  var f1 = document.forms[0];
				  
				  var pw1 = f1.passwd.value;
				  var pw2 = f1.passwd2.value;
				  
				if (pw1 == "" || pw2 == "") {
					document.getElementById('checkPwd').style.color = "black";
					document.getElementById('checkPwd').innerHTML = "암호를 입력하세요.";
				} else if (pw1 != pw2) {
					document.getElementById('checkPwd').style.color = "red";
					document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
				} else if (pw1 == pw2) {
					document.getElementById('checkPwd').style.color = "green";
					document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다.";
				}
			} 
		</script>

        <div class="clear"></div>
        <%-- footer area --%>
		<jsp:include page="../include/footer.jsp" />
	</div>

    <%-- common_script.jsp include --%>
    <jsp:include page="../include/common_script.jsp"/>
</body>
</html>