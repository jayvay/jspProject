<%@page import="member.MemberChatVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("utf-8");	//바로 불렀으니까 한글 처리 해줘야 한다
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberChatVO> vos = dao.getMemberMessage();
	
	pageContext.setAttribute("vos", vos);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberMessage.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
 	<script>
 		'use strict';
 		
 		setTimeout("location.reload()", 1000*2);	//2초마다 Refresh
 		
 		$(document).ready(function name() {
			document.body.scrollIntoView(false); //스크롤바 강제로 body태그 마지막으로 이동
		});
 		
 		/* 
 		$(function name() {
			제이쿼리~!!!
		});
 		 */
 	</script>
</head>
<body>
	<div class="container">
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<c:if test="${sNickName == vo.nickName}"><font color="blue"><b>${vo.nickName}</b> : ${vo.chat}</font></c:if>
			<c:if test="${sNickName != vo.nickName}"><b>${vo.nickName}</b> : ${vo.chat}</c:if><br/>
		</c:forEach>
	</div>
</body>
</html>