<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>jstl5Res.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>전체 회원 자료(ArrayList)</h2>
		<p>vos : ${vos}</p>
		<%-- 
		<p>1번 자료 : ${vos[0]}</p>
		<p>2번 자료 : ${vos[1]}</p>
		<p>3번 자료 : ${vos[2]}</p>
		<p>4번 자료 : ${vos[3]}</p>
		<p>5번 자료 : ${vos[4]}</p>
		 --%>
		<hr/>
		<c:forEach var="i" begin="0" end="4">
			<p>${i+1}번 자료 : ${vos[i]}</p>
		</c:forEach>
		
		<hr/>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<p>${st.count}.${vo}</p>
		</c:forEach>
		
		<hr/>
		<table class="table table-hover text-center">
			<tr class="table-dark text-dark">
				<th>성명</th>
				<th>나이</th>
				<th>성별</th>
				<th>직업</th>
				<th>주소</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${vo.name}</td>
					<td>${vo.age}</td>
					<td>${vo.gender}</td>
					<td>${vo.job}</td>
					<td>${vo.address}</td>
				</tr>
			</c:forEach>
			<tr><td colspan="5" class="m-0 p-0"></td></tr>
		</table>		
		<%-- 
		<p>성명 : ${vo.name}</p>
		<p>나이 : ${vo.age}</p>
		<p>성별 : ${vo.gender}</p>
		<p>직업 : ${vo.job}</p>
		<p>주소 : ${vo.address}</p>
		 --%>
		<hr/>
		<table class="table table-hover text-center">
			<tr class="table-dark text-dark">
				<th>성명</th>
				<th>나이</th>
				<th>성별</th>
				<th>직업</th>
				<th>주소</th>
			</tr>
			<c:forEach var="i" begin="0" end="${fn:length(vos)-1}" varStatus="st">
				<tr>
					<td>${vos[i].name}</td>
					<td>${vos[i].age}</td>
					<td>${vos[i].gender}</td>
					<td>${vos[i].job}</td>
					<td>${vos[i].address}</td>
				</tr>
			</c:forEach>
			<tr><td colspan="5" class="m-0 p-0"></td></tr>
		</table>		
		<hr/>
		<p><a href="${ctp}/study/1101_JSTL/jstl5.jsp" class="btn btn-outline-danger">돌아가기</a></p>
		
		<!--숙제 : 검색해서 검색한 자료만 나오게 -->
	</div>
<p><br/></p>
</body>
</html>