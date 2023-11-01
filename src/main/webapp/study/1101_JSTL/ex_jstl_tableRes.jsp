<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- 
<% 
	String flag = request.getParameter("flag")==null ? "" : request.getParameter("flag"); 
	pageContext.setAttribute("flag", flag);
%>
 --%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ex_jstl_tableRes.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
	<div class="container">
		<table class="table table-hover text-center">
			<tr class="table-dark text-dark">
				<th>성명</th>
				<th>나이</th>
				<th>성별</th>
				<th>직업</th>
				<th>주소</th>
			</tr>
			<%-- <c:if test="${flag} == name"> --%>
				<tr>
					<td>${vos.name}</td>
					<td>${vos.age}</td>
					<td>${vos.gender}</td>
					<td>${vos.job}</td>
					<td>${vos.address}</td>
				</tr>
			<%-- </c:if> --%>
			<%-- 
			<c:if test="${flag} == gender">
				<c:forEach var="i" begin="0" end="${fn:length(vos)-1}" varStatus="st">
					<tr>
						<td>${vos[i].name}</td>
						<td>${vos[i].age}</td>
						<td>${vos[i].gender}</td>
						<td>${vos[i].job}</td>
						<td>${vos[i].address}</td>
					</tr>
				</c:forEach>
			</c:if>				
			 --%>
			<tr><td colspan="5" class="m-0 p-0"></td></tr>
		</table>		
		<hr/>
		<p><a href="${ctp}/study/1101_JSTL/ex_jstl_table.jsp" class="btn btn-outline-info">돌아가기</a></p>
	</div>
<p><br/></p>
</body>
</html>