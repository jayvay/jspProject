<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>t2_SessionMain.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
 	<style>
 		div {margin: 20px;}
 	</style>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>세션 연습 메인 메뉴</h2>
		<hr/>
		<form name="myform" method="post" action="t2_SessionSave.jsp">
			<div>아이디 : 
				<input type="text" name="mid" value="${sMid}" autofocus class="form-control" />
			</div>
			<div>닉네임 : 
				<input type="text" name="nickName" value="${sNickName}" class="form-control" />
			</div>
			<div>성명 : 
				<input type="text" name="name" value="${sName}" class="form-control" />
			</div>
			<div>세션 ID : <%=session.getId() %></div>
			<hr/>
			<div class="row">
				<div class="col"><button type="submit" class="form-control btn btn-success">세션 저장</a></div>
				<div class="col"><a href="t2_SessionNameCheck.jsp" class="form-control btn btn-info">세션명 확인</a></div>
				<div class="col"><a href="t2_SessionCheck.jsp" class="form-control btn btn-warning">세션값 확인</a></div>
				<div class="col"><a href="t2_SessionDelete.jsp" class="form-control btn btn-danger">세션 전체 삭제</a></div>
				<div class="col"><a href="t2_SessionMidDelete.jsp" class="form-control btn btn-primary">ID 세션 삭제</a></div>
			</div>
		</form>
	</div>
<p><br/></p>
</body>
</html>