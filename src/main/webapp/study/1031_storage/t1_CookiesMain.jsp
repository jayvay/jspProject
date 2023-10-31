<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>t1_CookiesMain.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>쿠키 연습 메인 메뉴</h2>
		<hr/>
		<div class="row">
			<div class="col"><a href="t1_CookiesSave.jsp" class="form-control btn btn-success">쿠키 저장</a></div>
			<div class="col"><a href="t1_CookiesCheck.jsp" class="form-control btn btn-warning">쿠키 확인</a></div>
			<div class="col"><a href="t1_CookiesDelete.jsp" class="form-control btn btn-danger">쿠키 전체 삭제</a></div>
			<div class="col"><a href="t1_CookiesPwdDelete.jsp" class="form-control btn btn-primary">비번 쿠키 삭제</a></div>
		</div>
	</div>
<p><br/></p>
</body>
</html>