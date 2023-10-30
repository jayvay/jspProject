<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test5.jsp</title>
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
			else if(age.trim() == "") {
				alert("나이를 입력하세요");
				document.getElementById("age").focus();
			}
			else {
				//alert("정상처리 되었습니다.");
				/* location.href = `test2Ok.jsp?name=${name}&age=${age}`; 백틱 사용 안 됨*/
				//location.href = "test2Ok.jsp?name=" + name + "&age=" + age; //이렇게 넘기면 hidden은 안 넘어 감..예:idx 같은 건 뷰에 보이지 않아도 됨
				myform.submit(); //최종적으로 전송하는 건 form의 이름으로 전송한다. hidden도 넘어감 
			}
		}
  </script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>값의 전송(GET/POST) - servlet으로 전송하기</h2>
		<form name="myform" method="post" action="<%=request.getContextPath() %>/j1026/Test5"> 
		
			<div>성명
				<input type="text" name="name" class="form-control mb-3" autofocus />
			</div>
			<div>나이
				<input type="number" name="age" id="age" class="form-control mb-3" /> <!-- name이 없으면 값을 넘길 수 없다 -->
			</div>
			<div>
				<input type="button" value="전송(button)" onclick="fCheck()" class="form-control btn-primary" /> <%-- action에 있는 걸 submit 함 --%>
			</div>
			<input type="hidden" name="flag" value="OK"/>
		</form>
	</div>
<p><br/></p>
</body>
</html>