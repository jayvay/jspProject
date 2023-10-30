<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test8.jsp</title>
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
  	'use strict';
  	
  	function fCheck() {
			let name = myform.name.value;
			let age = document.getElementById("age").value;
			
			if(name.trim() == "") {
				alert("성명을 입력하세요");
				myform.name.focus();
			}
			else if(age.trim() == "" || age < 20) {
				alert("20세 이상만 가입 가능합니다.");
				document.getElementById("age").focus();
			}
			else {
				myform.submit();
			}
		}
  </script>
  <style>
  	.cont {
  		margin-bottom: 5px;
  	}
  </style>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>값 전송 연습</h2>
		<form name="myform" method="post" action="<%=request.getContextPath()%>/j1026/Test8Ok">
			<div class="cont">성명
				<input type="text" name="name" class="form-control mb-3" autofocus />
			</div>
			<div class="cont">나이
				<input type="number" name="age" id="age" class="form-control mb-3" />
			</div>
			<div class="cont">성별
				<input type="radio" name="gender" value="남자" />남자
				<input type="radio" name="gender" value="여자" checked />여자
			</div>
			<div class="cont">취미
				<input type="checkbox" name="hobby" value="그림" />그림 &nbsp;
				<input type="checkbox" name="hobby" value="수영" />수영 &nbsp;
				<input type="checkbox" name="hobby" value="배드민턴" />배드민턴 &nbsp;
				<input type="checkbox" name="hobby" value="낚시" />낚시 &nbsp;
				<input type="checkbox" name="hobby" value="등산" />등산 &nbsp;
				<input type="checkbox" name="hobby" value="싸이클" />싸이클
			</div>
			<div class="cont">직업
				<select name="job" class="form-control mb-3"/>
					<option>선택</option>
					<option>프로그래머</option>
					<option>변호사</option>
					<option>교사</option>
					<option>의사</option>
					<option>셰프</option>
			</div>
			<div class="cont">
				<input type="button" value="전송(button)" onclick="fCheck()" class="form-control btn-primary" />
			</div>
		</form>
	</div>
<p><br/></p>
</body>
</html>