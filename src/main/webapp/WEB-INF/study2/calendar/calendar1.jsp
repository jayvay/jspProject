<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>calendar1.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
 	<style>
 		#td1,#td8,#tdl5,#td22,#td29,#td36 {color: red};
 		#td7,#td14,#td21,#td28,#td35 {color: blue};
 		
 		.today {
 			background-color : black;
 			color : white;
 			font-weight : bolder;
 		}
 	</style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
	<div class="container">
		<div class="text-center">
			<button type="button" onclick="location.href='calendar1.st?yy=${yy-1}&mm=${mm}';" class="btn btn-secondary btn-sm" title="이전년도">◀◀</button>
			<button type="button" onclick="location.href='calendar1.st?yy=${yy}&mm=${mm-1}';" class="btn btn-secondary btn-sm" title="이전월">◀</button>
			<font size="5">${yy}년 ${mm+1}월</font>
			<button type="button" onclick="location.href='calendar1.st?yy=${yy}&mm=${mm+1}';" class="btn btn-secondary btn-sm" title="다음월도">▶</button>
			<button type="button" onclick="location.href='calendar1.st?yy=${yy+1}&mm=${mm}';" class="btn btn-secondary btn-sm" title="다음년도">▶▶</button>
			<button type="button" onclick="location.href='calendar1.st';" class="btn btn-secondary btn-sm" title="오늘날짜"><i class='fas fa-home'></i></button>
		</div>
		<div class="text-center">
			<table class="table table-bordered" style="height:450px">
				<tr class="table-dark text-dark">
					<th style="width:15%; vertical-align:middle;">sun</th>
					<th style="width:15%; vertical-align:middle;">mon</th>
					<th style="width:15%; vertical-align:middle;">tue</th>
					<th style="width:15%; vertical-align:middle;">wed</th>
					<th style="width:15%; vertical-align:middle;">thu</th>
					<th style="width:15%; vertical-align:middle;">fri</th>
					<th style="width:15%; vertical-align:middle;">sat</th>
				</tr>
				<tr>
					<!-- 시작일 이전을 공백으로 처리(오늘이 수요일이면 startWeek는 4 이므로 3칸이 공백) -->
					<c:forEach begin="1" end="${startWeek - 1}">
						<td>&nbsp;</td>
					</c:forEach>
					
					<!-- 해당 월의 1일을 startWeek 위치부터 출력(날짜는 1씩 증가, 7칸이 채워지면 행 끊어주기) -->
					<c:set var="cell" value="${startWeek}" />
					<c:forEach begin="1" end="${lastDay}" varStatus="st">
						<c:set var="todaySw" value="${year == yy && month == mm && day == st.count ? 1 : 0}" />
						<td id="td${cell}" ${todaySw == 1 ? 'class=today' : ''}>${st.count}</td>
						<c:if test="${cell % 7 == 0}"></tr><tr></c:if>
						<c:set var="cell" value="${cell + 1}" />
					</c:forEach>
				</tr>
			</table>
		</div> 
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>