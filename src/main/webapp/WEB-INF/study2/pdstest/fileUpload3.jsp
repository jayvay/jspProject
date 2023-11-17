<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>fileUpload3.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
 	<script>
 		'use strict';
 		
 		function fCheck() {
			let fName1 = document.getElementById("file1").value;
			let ext1 = fName1.substring(fName1.lastIndexOf(".")+1).toLowerCase(); // 확장자
			let maxSize = 1024 * 1024 * 10; //10MB (1KByte=1024Byte=10^3Byte=2^10Byte / 1MByte=2^20Byte=10^6Byte / 1GByte=2^30Byte=10^9Byte / 1TByte=2^40Byte=10^12Byte)
			
			if(fName1.trim() == "") {
				alert("업로드할 파일을 선택하세요.");
				return false;
			}
			
			let fileSize = document.getElementById("file1").files[0].size;	//파일이 있어야 사이즈 체크가 됨
			
			if(ext1 != 'jpg' && ext1 != 'gif' && ext1 != 'png' && ext1 != 'zip' && ext1 != 'hwp' && ext1 != 'ppt' && ext1 != 'pptx' && ext1 != 'xlsx') {
				alert("파일은 'jpg/gif/png/zip/hwp/ppt/pptx/xlsx'만 업로드 가능합니다.");
			}
			else if(fileSize > maxSize) {
				alert("업로드할 파일의 용량은 최대 10MByte까지 가능합니다.");
			}
			else {
				myform.submit();
			}
 		}
 		
 		let cnt = 1;
 		//파일 박스 추가하기
 		function fileBoxAppend() {
 			cnt++;
			let fileBox = '';
			fileBox += '<div id="fBox'+ cnt +'">';
			fileBox += '<input type="file" name="fName'+ cnt +'" id="file'+ cnt +'" class="form-control-file mb-2 border" style="float:left; width:85%;" />';
			fileBox += '<input type="button" value="삭제" onclick="deleteBox('+ cnt +')" class="btn btn-warning mb-2 ml-2" style="width:10%;"/>';
			fileBox += '</div>';
			$("#fileBox").append(fileBox);
		}
 		
 		//파일 박스 삭제
	 function deleteBox(cnt) {
			$("#fBox" + cnt).remove();
		}
 	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
	<div class="container">
		<h2>파일 업로드 연습(멀티파일처리)</h2>
		<div>COS라이브러리를 이용한 파일 업로드</div>
		<div>(http://www.servlets.com/cos/)</div>
		<hr/>
		<form name="myform" method="post" action="fileUpload3Ok.st" enctype="multipart/form-data">
			파일명 : 
			<div>
				<input type="button" value="파일박스추가" onclick="fileBoxAppend()" class="btn btn-primary mb-2" />
				<input type="file" name="fName1" id="file1" class="form-control-file mb-2 border" />
			</div>
			<div id="fileBox"></div>				
				<input type="button" value="전송" onclick="fCheck()" class="btn btn-warning form-control" />
		</form>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>