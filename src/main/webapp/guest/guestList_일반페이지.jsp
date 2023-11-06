<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>guestList.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
 	<script>
 		'use strict';
 	
 		function delCheck(idx) {
			let ans = confirm("해당 글을 삭제하시겠습니까?");
			if(ans) location.href = "${ctp}/GuestDelete?idx="+idx;
			
		}
 		
 		function pageCheck() {
 			let pageSize = document.getElementById("pageSize").value;
			location.href = "${ctp}/GuestList?pag=${pag}&pageSize="+pageSize;
		}
 	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
	<div class="container">
		<h2>방명록 리스트</h2>
		<table class="table table-borderless m-0 p-0">
			<tr>
				<td>
					<c:if test="${sAdmin != 'adminOk'}"><a href="${ctp}/guest/adminLogin.jsp" class="btn btn-primary">관리자</a></c:if>
					<c:if test="${sAdmin == 'adminOk'}"><a href="${ctp}/guest/AdminLogout" class="btn btn-primary">관리자 로그아웃</a></c:if>
				</td>
				<td class="text-right"><a href="${ctp}/guest/guestInput.jsp" class="btn btn-info">글쓰기</a></td>
			</tr>
		</table>
		<table class="table table-borderless m-0 p-0">
			<tr>
				<td>
					<select name="pageSize" id="pageSize" onchange="pageCheck()">
						<option <c:if test="${pageSize == 2}">selected</c:if>>2</option>
						<option <c:if test="${pageSize == 4}">selected</c:if>>4</option>
					</select>개
				</td>
				<td class="text-right">
					<c:if test="${pag > 1}">
						<a href="${ctp}/GuestList?pag=1&pageSize=${pageSize}" title="첫페이지">◁◁</a>
						<a href="${ctp}/GuestList?pag=${pag-1}&pageSize=${pageSize}" title="이전페이지">◀</a>
					</c:if>
					${pag} / ${totPage}
					<c:if test="${pag < totPage}">
						<a href="${ctp}/GuestList?pag=${pag+1}&pageSize=${pageSize}" title="다음페이지">▶</a>
						<a href="${ctp}/GuestList?pag=${totPage}&pageSize=${pageSize}" title="마지막페이지">▷▷</a>
					</c:if>
				</td>
			</tr>
		</table>
		<%-- <c:set var="curScrStartNo" value="${curScrStartNo}" /> 59번이 있으니까 없어도 됨--%>
		<c:forEach var="vo" items="${vos}" varStatus="stg">
		<table class="table table-borderless">
			<tr>
				<td>
					번호 : ${curScrStartNo} &nbsp;
					<c:if test="${sAdmin == 'adminOk'}"><a href="javascript:delCheck(${vo.idx})" class="btn btn-sm btn-danger">삭제</a></c:if>
				</td>
				<td class="text-right">방문IP : ${vo.hostIp}</td>
			</tr>
		</table>
		<table class="table table-bordered">
			<tr>
				<th>작성자</th>
				<td>${vo.name}</td>
				<th>방문일자</th>
				<td>${fn:substring(vo.visitDate, 0,19)}</td>
			</tr>
			<tr>
				<th>메일주소</th>
				<td colspan="3">
					<c:if test="${empty vo.email || fn:length(vo.email)<5 || fn:indexOf(vo.email, '@')==-1 || fn:indexOf(vo.email, '.')==-1}">없음</c:if>
					<c:if test="${!empty vo.email && fn:length(vo.email)>=5 && fn:indexOf(vo.email, '@')!=-1 && fn:indexOf(vo.email, '.')!=-1}">
						${vo.email}
					</c:if>
				</td>
			</tr>
			<tr>
				<th>홈페이지</th>
				<td colspan="3">
					<c:if test="${empty vo.homePage || fn:length(vo.homePage)<10 || fn:indexOf(vo.homePage,'.')==-1}">없음</c:if>
					<c:if test="${!empty vo.homePage && fn:length(vo.homePage)>=10 && fn:indexOf(vo.homePage,'.')!=-1}">
						<a href="${vo.homePage}" target="_blank">${vo.homePage}</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>방문소감</th>
				<td colspan="3">${fn: replace(vo.content, newLine, '<br/>')}</td>
			</tr>
		</table>
		<c:set var="curScrStartNo" value="${curScrStartNo - 1}" />
		</c:forEach>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>