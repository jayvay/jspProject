<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>t1_requestGet.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
	<div class="container">
		<form name="myform" method="post" action="t1_requestGetOk.jsp">
			<h2>전송된 값과 환경을 서버에서 확인해오기</h2>
			<div class="border p-3">
				<div class="mb-3">성명 :<br/>
					<input type="text" name="name" value="홍길동" class="form-control" autofocus required />
				</div>
				<div class="mb-3">취미 : 
					<input type="checkbox" name="hobby" value="등산" />등산
					<input type="checkbox" name="hobby" value="수영" />수영
					<input type="checkbox" name="hobby" value="그림" />그림
					<input type="checkbox" name="hobby" value="음악감상" checked />음악감상
					<input type="checkbox" name="hobby" value="독서" />독서
				</div>
				<div class="text-center mb-3">
					<input type="submit" value="전송" class="btn btn-secondary" />
					<input type="reset" value="취소" class="btn btn-secondary" />
				</div>
			</div>
			<input type="hidden" name="hostIp" value="<%=request.getRemoteAddr()%>" />
		</form>
	</div>
<p><br/></p>
</body>
</html>