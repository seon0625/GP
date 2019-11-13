<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Hello Gony</title>
    <link href="../css/reset5.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css"> 
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
	
	
</head>

<body>
	<div id="wrap">
		
		<%
			//세션값 가져오기
			String id =(String)session.getAttribute("id");
		%>
		
		<%-- header area --%>
		<jsp:include page="../include/header.jsp" />

  		<h1 id="community"><div>community</div></h1>
		<article>
  	
        <h2>Styling</h2>
	
  	    <form action="photo_upload_process.jsp" method="post" name="frm" enctype="multipart/form-data">
    	
    	<table id="cbbs">
		
			<tr>
			<th class="twirte" style="width: 20px;">이름</th>
			<td class="left" width="300">
			<input type="text" name="username" value="<%=id%>"readonly>
			</td>
			</tr>
		
		<tr>
		<th class="twrite">계절</th>
		<td class="left">
		<select name ="type">
		<option value="sf">봄가을</option>
		<option value="summer">여름</option>
		<option value="winter">겨울</option>
		<option value="free">Free</option>
		</select>
		</td>
		</tr>
		
		<tr>
		<th class="twrite">제목</th>
		<td class="left">
		<input type="text" name="subject">
		</td>
		</tr>
	
		<tr>
		<th class="twrite">파일</th>
		<td class="left">
		<div id = "file_container">
		<input type="file" name="filename">
		</div>
		</td>
		</tr>
		
		<tr>
		<th class="twrite">내용</th>
		<td class="left">
		<textarea name="content" rows="13" cols="40"></textarea>
		</td>
		</tr>
		
		</table>
		
		<div id = "table_search">
		 <input type ="submit" value="글쓰기" class="btn2">
		 <input type="reset" value="다시작성" class="btn2">
		 <input type ="button" value="목록보기" class="btn" onclick="location.href='community.jsp'">
		</div>
		
		
		
		
		
		</form>
		</article>
		
		
  		<%-- sidebar_community.jsp include --%>
  		<jsp:include page="../include/sidebar_community.jsp"/>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript"> 
		
		
		//$('#imgFile').prop('files', files);
		var fileElem = document.getElementById('imgFile');
		fileElem.files = files; // 파일리스트를 파일요소에 설정
		
	
		file = files[0]; 
		readFileSize += file.size;
		console.log(file.size + 'bytes');
	
		// Only process image files. 
		var imageType = /image.*/; 

		if (!file.type.match(imageType)) { 
			return; 
		} 
		
		var reader = new FileReader(); 
	
		reader.onerror = function(e) { 
			alert('Error code: ' + e.target.error); 
		}; 

		reader.onload = function (evt) {
			// evt.target 은 FileReader
			console.log(evt.target);
			console.log(evt.target.result);
			dropbox.src = evt.target.result;
		}

		// Read in the image file as a data url. 
		reader.readAsDataURL(file); 
	} 
</script>


        <div class="clear"></div>
        <%-- footer area --%>
		<jsp:include page="../include/footer.jsp" />
</div>


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
</body>
</html>
