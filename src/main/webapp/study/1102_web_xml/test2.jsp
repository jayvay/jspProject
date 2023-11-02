<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test2.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>JSP/Servlet LifeCycle 연습(확인)</h2>
		<form method="post" action="${ctp}/j1102/test2Ok">
			<div><input type="text" name="content" value="간단한 소개입니다." class="form-control mt-3 mb-3" /></div>
			<div><textarea rows="5" name="introduce" class="form-control mb-3">자기소개를 자세히 기록하세요.</textarea></div>
			<div><input type="submit" value="전송하기1" class="btn btn-info form-control" /></div>
		</form>
	</div>
<p><br/></p>
</body>
</html>