<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test6(경로(static:정적)연습).jsp</title>
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <link rel="stylesheet" type="text/css" href="../../css/test.css" > -->
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/test.css" >
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>경로(static:정적)연습 : 그림/ js/ css 등</h2>
		<p>소스코드와는 독립적으로 종류별로 폴더를 만들어 관리한다.(webapp 폴더 아래 각각의 폴더로 관리)</p>
		<hr/>
		<p>
<!-- 	<img src="8.jpg" width="200px" />  (X)  -->
			<img src="../../images/8.jpg" width="200px" />(O)
		</p>
		<p><img src="<%=request.getContextPath() %>/images/1.jpg" width="200px" />(O)</p> 
		<p><img src="<%=request.getContextPath() %>/images/2.jpg" width="200px" />(O)</p> 
		<p><img src="<%=request.getContextPath() %>/images/3.jpg" width="200px" />(O)</p>
		<hr/>
		<p>
			<%
				for(int i=1; i<=5; i++) {
					out.print("<img src='" + request.getContextPath() + "/images/" + i + ".jpg' width='200px' /><br/>");
				}
			%>
		</p> 
	</div>
<p><br/></p>
</body>
</html>