<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adminComplaintList.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
 	<script>
 		'use strict';
 		
 		
 	</script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<table class="table table-hover text-center">
			<tr class="table-dark text-dark">
				<th>번호</th>
				<th>항목</th>
				<th>글번호</th>
				<th>신고자</th>
				<th>신고사유</th>
				<th>신고날짜</th>
				<th>관리</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${vo.idx}</td>
					<td>${vo.part}</td>
					<td>${vo.partIdx}</td>
					<td>${vo.cpMid}</td>
					<td>${vo.cpContent}</td>
					<td>${fn:substring(vo.cpDate,0,16)}</td>
					<td><input type="button" value="삭제" onclick="javascript:location.href='complaintDelete.ad?idx=${vo.partIdx}';" class="btn btn-dark btn-sm"/></td>
				</tr>
			</c:forEach>
		</table>
	</div>
<p><br/></p>
</body>
</html>