<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>el2_form.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
	<div class="container">
		<form name="myform" method="post" action="${pageContext.request.contextPath}/j1101/el2Ok">
			<h2>자료 전송 연습</h2>
			<div>성명 : <input type="text" name="name" value="홍길동" class="form-control" /></div>
			<div>
				<input type="checkbox" name="hobby" value="뜨개질" />뜨개질
				<input type="checkbox" name="hobby" value="음악감상" />음악감상
				<input type="checkbox" name="hobby" value="수영" />수영
				<input type="checkbox" name="hobby" value="기타" />기타
				<input type="checkbox" name="hobby" value="그림" />그림
			</div>
			<input type="submit" value="전송" class="btn btn-outline-info" />
		</form>
	</div>
<p><br/></p>
</body>
</html>