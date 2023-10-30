<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test1.jsp</title>
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>값의 전송(GET/POST)</h2>
		<!-- <form name="myform" method="get" action="test1Ok.jsp"> get방식-->	
		<form name="myform" method="post" action="test1Ok.jsp">	<!-- post방식 -->
			<div>성명
				<input type="text" name="name" class="form-control mb-3" autofocus />
			</div>
			<div>나이
				<input type="number" name="age" class="form-control mb-3" />
			</div>
			<div>
				<input type="submit" value="전송(submit)" class="form-control btn-success mb-3" /> <%-- action에 있는 걸 submit 함 / submit은 엔터키만 쳐도 넘어감--%>
				<input type="button" value="전송(button)" onclick="location.href='test1Ok.jsp?name=홍길동&age=25';" class="form-control btn-primary" /> <%-- 엔터키로 안 넘어감 --%>
			</div>
		</form>
	</div>
<p><br/></p>
</body>
</html>