<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>guestInput.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
	<div class="container">
		<h2>방명록 작성하기</h2>
		<form name="myform">
		<table class="table table-borderless">
			<tr>
				<td>작성자 : </td>
				<td></td>
			</tr>
			<tr>
				<td><textarea rows="6" class="form-control"></textarea></td>
			</tr>
		</table>
		</form>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>