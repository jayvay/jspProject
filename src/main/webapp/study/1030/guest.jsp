<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>guest.jsp</title>
 	<%@ include file="../../include/bs4.jsp" %>
</head>
<body>
<!-- header영역(로고/메뉴/Top Image 등) -->
<div id="header" class="text-center" style="background-color:skyblue">
	<%@ include file="nav.jsp" %>
</div>
<p><br/></p>
	<div class="container" style="text-align:center">
		<h2>이곳은 방명록(Guest) 입니다.</h2>
		<p><img src="../../images/5.jpg" width="500px" /></p>
		<hr/>
	</div>
<p><br/></p>
<!-- footer영역(Copyright/Email Address/사업자등록증/Image 등) -->
<div id="footer" class="text-center">
	<%@ include file="footer.jsp" %>
</div>
</body>
</html>