<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberMain.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
 	<script>
 		'use strict';
 		
 		function searchCheck() {
			let str = '';
			str += '<form name="myForm" method="post" action="${ctp}/database/MemberSearch">';
			str += '<div class="row"> <span class=" mt-1">검색할 아이디</span>';
			str += '<div class="col"><input type="text" name="mid" value="admin" class="form-control"/></div>';
			str += '<div class="col"><input type="submit" value="검색" class="btn btn-outline-info"/></div>';
			str += '</div>';
			
			demo.innerHTML = str;
			
		}
 	</script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>회원 메인 화면</h2>
		<div>${sName}님, 로그인 중입니다.</div>
		<hr/>
		
		<p>현재 보유 중인 포인트 : ${sPoint}</p>
		<p>최종 접속일 : ${sLastDate}</p>
		<p>오늘 접속 횟수 : ${sTodayCount}회</p>
		<hr/>
		<c:set var="random" ><%=(int)(Math.random()*17)+1%></c:set>
		<p><img src="${ctp}/images/${random}.jpg" width="300px"/></p>
		<hr/>
		<div class="row">
			<div class="col"></div>
			<div class="col"><a href="javascript:searchCheck()" class="btn btn-info">개별조회</a></div>
			<div class="col"><a href="${ctp}/database/memberList" class="btn btn-primary">전체조회</a></div>
			<div class="col"><a href="${ctp}/database/memberLogout" class="btn btn-secondary">로그아웃</a></div>
			<div class="col"></div>
		</div>
		<hr/>
		<div id="demo"></div>
	</div>
<p><br/></p>
</body>
</html>