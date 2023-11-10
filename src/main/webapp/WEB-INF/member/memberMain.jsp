<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberMain.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
	<div class="container">
		<h2>회 원 전 용 방</h2>
		<hr/>
		<pre>
			정회원 등업 조건
		</pre>
		<hr/>
		<div><img src="${ctp}/images/member/noImage.jpg" width="200px" /></div>
		<div>
			<p>현재 ${sNickName}(${sStrLevel})님 접속 중입니다.</p>
			<p>총 방문 횟수 : ${mVo.visitCnt}회</p>
			<p>오늘 방문 횟수 : ${mVo.todayCnt}회</p>
			<p>총 보유 포인트 : ${mVo.point}점</p>
			<hr/>
			<h4>활동 내역 : </h4>
			<p>방명록 게시글 수 : ${fn:length(gVos)}건</p>
			<p>게시판 게시글 수 : ${empty bVo.boardCnt ? 0 : bVo.boardCnt}건</p>
		</div>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>